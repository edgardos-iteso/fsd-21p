module uartTX
(
  i_clk,
  i_rst,
  i_data,
  i_startTX,
  o_busy,
  o_done,
  o_serialTX
);

  parameter CLK_DIVIDER = 10417;
  parameter NBITS_DIVIDER = 14;

  input i_clk;
  input i_rst;
  input [7:0] i_data;
  input i_startTX;
  output o_busy;
  output o_done;
  output o_serialTX;

  localparam IDLE = 3'b000;
  localparam TX_START_BIT = 3'b001;
  localparam TX_DATA_BITS = 3'b011;
  localparam TX_STOP_BIT = 3'b010;
  localparam DONE = 3'b110;

  reg [2:0] r_currentState;
  reg [2:0] r_nextState;
  reg [NBITS_DIVIDER-1:0] r_clkCounter;
  reg [2:0] r_txBitIdx;
  reg [7:0] r_txData;
  reg r_done;
  reg r_busy;
  reg r_bitTX;

  assign o_busy = r_busy;
  assign o_done = r_done;
  assign o_serialTX = r_bitTX;

  always @ (posedge i_clk or negedge i_rst) begin
    if (!i_rst) begin
      r_clkCounter <= {NBITS_DIVIDER{1'b0}};
      r_txBitIdx <= 3'b0;
      r_txData <= 8'b0;
      r_done <= 1'b0;
      r_busy <= 1'b0;
      r_bitTX <= 1'b1;
    end
    else begin
      case (r_currentState)
        IDLE: begin
          r_clkCounter <= {NBITS_DIVIDER{1'b0}};
          r_txBitIdx <= 4'b0;
          r_txData <= 8'b0;
          r_done <= 1'b0;
          if (i_startTX) begin
            r_txData <= i_data;
            r_busy = 1'b1;
          end
        end
        TX_START_BIT: begin
          r_bitTX <= 1'b0;
          if (r_clkCounter < CLK_DIVIDER-1) begin
            r_clkCounter <= r_clkCounter + 1'b1;
          end
          else begin
            r_clkCounter <= {NBITS_DIVIDER{1'b0}};
          end
        end
        TX_DATA_BITS: begin
          r_bitTX <= r_txData[r_txBitIdx];
          if (r_clkCounter < CLK_DIVIDER-1) begin
            r_clkCounter <= r_clkCounter + 1'b1;
          end
          else begin
            r_clkCounter <= {NBITS_DIVIDER{1'b0}};
            r_txBitIdx <= r_txBitIdx + 1'b1;
          end
        end
        TX_STOP_BIT: begin
          r_bitTX <= 1'b1;
          if (r_clkCounter < CLK_DIVIDER-1) begin
            r_clkCounter <= r_clkCounter + 1'b1;
          end
          else begin
            r_clkCounter <= {NBITS_DIVIDER{1'b0}};
          end
        end
        DONE: begin
          r_done <= 1'b1;
          r_busy <= 1'b0;
        end
        default: ;
      endcase
    end
  end

  always @ ( posedge i_clk or negedge i_rst ) begin
    if (!i_rst) begin
      r_currentState <= IDLE;
    end
    else begin
      r_currentState <= r_nextState;
    end
  end

  always @ ( * ) begin
    case (r_currentState)
      IDLE: begin
        if (i_startTX) begin
          r_nextState = TX_START_BIT;
        end
        else begin
          r_nextState = IDLE;
        end
      end
      TX_START_BIT: begin
        if (r_clkCounter < CLK_DIVIDER-1) begin
          r_nextState = TX_START_BIT;
        end
        else begin
          r_nextState = TX_DATA_BITS;
        end
      end
      TX_DATA_BITS: begin
        if (r_txBitIdx == 7 && r_clkCounter == CLK_DIVIDER-1) begin
            r_nextState = TX_STOP_BIT;
        end
        else begin
          r_nextState = TX_DATA_BITS;
        end
      end
      TX_STOP_BIT: begin
        if (r_clkCounter < CLK_DIVIDER-1) begin
          r_nextState = TX_STOP_BIT;
        end
        else begin
          r_nextState = DONE;
        end
      end
      DONE: begin
        r_nextState = IDLE;
      end
      default: begin
        r_nextState = IDLE;
      end
    endcase
  end

endmodule
