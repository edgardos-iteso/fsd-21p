module exa2
(
  clk, // 100 MHz
  rst,
  dataTX,
  start,
  mosi,
  sck, // 20 MHz ????
  ss
);

  localparam IDLE = 0;
  localparam TXB7 = 1;
  localparam TXB6 = 2;
  localparam TXB5 = 3;
  localparam TXB4 = 4;
  localparam TXB3 = 5;
  localparam TXB2 = 6;
  localparam TXB1 = 7;
  localparam TXB0 = 8;
  localparam CLEAR = 9;

  input clk;
  input rst;
  input [7:0] dataTX;
  input start;
  output reg mosi;
  output sck;
  output reg ss;

  wire clkdiv;
  wire wSCK;
  reg wRstCC;
  reg [3:0] rState;
  reg [2:0] rCounter;
  reg [7:0] rDataTX;

  assign sck = ((rState >= TXB7) & rState <= TXB0) ? wSCK : 1'b0;

  always @ (posedge clk or negedge rst) begin
    if (!rst) begin
      rState <= IDLE;
      rCounter <= 3'd0;
      rDataTX <= 8'd0;
    end
    else begin
      case (rState)
        IDLE: begin
          if (start) begin
            rState <= TXB7;
            rCounter <= 2'd0;
            rDataTX <= dataTX;
          end
          else begin
            rState <= IDLE;
          end
        end
        TXB7: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB7;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB6;
          end
        end
        TXB6: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB6;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB5;
          end
        end
        TXB5: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB5;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB4;
          end
        end
        TXB4: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB4;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB3;
          end
        end
        TXB3: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB3;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB2;
          end
        end
        TXB2: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB2;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB1;
          end
        end
        TXB1: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB1;
          end
          else begin
            rCounter <= 2'd0;
            rState <= TXB0;
          end
        end
        TXB0: begin
          if (rCounter < (6 - 1)) begin
            rCounter <= rCounter + 1'b1;
            rState <= TXB0;
          end
          else begin
            rCounter <= 2'd0;
            rState <= CLEAR;
          end
        end
        CLEAR: begin
          rState <= IDLE;
        end
        default: ;
      endcase
    end
  end

  always @ (*) begin
    case (rState)
      IDLE: begin
        mosi = 1'b0;
        ss = 1'b0;
        wRstCC = 1'b0;
      end
      TXB7: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[7];
        ss = 1'b1;
      end
      TXB6: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[6];
        ss = 1'b1;
      end
      TXB5: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[5];
        ss = 1'b1;
      end
      TXB4: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[4];
        ss = 1'b1;
      end
      TXB3: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[3];
        ss = 1'b1;
      end
      TXB2: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[2];
        ss = 1'b1;
      end
      TXB1: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[1];
        ss = 1'b1;
      end
      TXB0: begin
        wRstCC <= 1'b1;
        mosi = rDataTX[0];
        ss = 1'b1;
      end
      CLEAR: begin
        wRstCC <= 1'b0;
        mosi = 1'b0;
        ss = 1'b0 ;
      end
      default: ;
    endcase
  end

  countCompare
  #(
    .NBITS (2)
  )
  CLKDIV
  (
    .clk (clk),
    .rst (wRstCC),
    .compareValue (2),
    .equal (clkdiv)
  );

  ffT
  FFT
  (
    .clk (clk),
    .rst (rst),
    .t (clkdiv),
    .q (wSCK)
  );

endmodule // exa2
