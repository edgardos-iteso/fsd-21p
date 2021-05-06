module uartRX
(
  clk,
  rst,
  serialRX,
  dataRX,
  done,
  busy
);

  parameter CLKCOUNTER = 10_417; //100_000_000 / 9_600 = 10_417
  parameter NBITS_COUNTER = 14; //log(x)/log(2)

  localparam IDLE = 3'b000;
  localparam RX_START = 3'b001;
  localparam RX_DATA = 3'b011;
  localparam RX_STOP = 3'b010;
  localparam DONE = 3'b110;

  input clk;
  input rst;
  input serialRX;
  output reg [7:0] dataRX;
  output reg done;
  output reg busy;

  reg [7:0] rDataRX;
  reg [2:0] rDataIdx;
  reg [2:0] rState;
  reg [NBITS_COUNTER-1:0] rClkCounter;

  always @ (posedge clk or negedge rst) begin
    if (!rst) begin
      rState <= IDLE;
      rClkCounter <= {NBITS_COUNTER{1'b0}};
      rDataRX <= 8'd0;
      rDataIdx <= 3'd0;
      dataRX <= 8'b0;
    end
    else begin
      case (rState)
        IDLE: begin
          rClkCounter <= {NBITS_COUNTER{1'b0}};
          rDataRX <= 8'd0;
          rDataIdx <= 3'd0;

          if (!serialRX) begin
            rState <= RX_START;
          end
          else begin
            rState <= IDLE;
          end
        end

        RX_START: begin
          if (rClkCounter < (CLKCOUNTER/2)) begin
            rClkCounter <= rClkCounter + 1'b1;
            rState <= RX_START;
          end
          else begin
            rClkCounter <= {NBITS_COUNTER{1'b0}};

            if (!serialRX) begin
              rState <= RX_DATA;
            end
            else begin
              rState <= IDLE;
            end
          end
        end

        RX_DATA: begin
          if (rClkCounter < CLKCOUNTER) begin
            rClkCounter <= rClkCounter + 1'b1;
            rState <= RX_DATA;
          end
          else begin
            rClkCounter <= {NBITS_COUNTER{1'b0}};
            rDataRX[rDataIdx] <= serialRX;

            if (rDataIdx < 7) begin
              rDataIdx = rDataIdx + 1'b1;
              rState <= RX_DATA;
            end
            else begin
              rDataIdx <= 3'd0;
              rState <= RX_STOP;
            end
          end
        end

        RX_STOP: begin
          if (rClkCounter < CLKCOUNTER) begin
            rClkCounter <= rClkCounter + 1'b1;
            rState <= RX_STOP;
          end
          else begin
            rClkCounter <= {NBITS_COUNTER{1'b0}};
            rState <= DONE;
            dataRX = rDataRX;
          end
        end

        DONE: begin
          rState <= IDLE;
        end

        default: begin
          rState <= IDLE;
        end
      endcase
    end
  end

  always @ (*) begin
    case (rState)
      IDLE: begin
        done <= 1'b0;
        busy <= 1'b0;
      end

      RX_START: begin
        done <= 1'b0;
        busy <= 1'b1;
      end

      RX_DATA: begin
        done <= 1'b0;
        busy <= 1'b1;
      end

      RX_STOP: begin
        done <= 1'b0;
        busy <= 1'b1;
      end

      DONE: begin
        done <= 1'b1;
        busy <= 1'b0;
      end

      default: begin
        done <= 1'b0;
        busy <= 1'b0;
      end
    endcase
  end

endmodule // uartRX
