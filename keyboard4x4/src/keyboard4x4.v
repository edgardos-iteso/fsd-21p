module keyboard4x4
(
  clk,
  rst,
  row,
  col,
  key,
  done
);

  localparam KEY_FREE = 7'd0; // No se presiona ningún botón
  localparam SCAN_COL0 = 7'd1; // Escanear columna 0
  localparam SCAN_COL1 = 7'd2; // Escanear columna 1
  localparam SCAN_COL2 = 7'd3; // Escanear columna 2
  localparam SCAN_COL3 = 7'd4; // Escanear columna 3
  localparam KEY_DOWN = 7'd5; // Botón presionado detectado
  localparam KEY_HOLD = 7'd6; // Se sigue presionando el botón
  localparam KEY_UP = 7'd7; // Botón se libero

  input clk;
  input rst;
  input [3:0] row;
  output reg [3:0] col;
  output reg [3:0] key;
  output reg done;

  reg [3:0] rCurrentState;
  reg [3:0] rNextState;
  wire wClk20ms;
  reg [3:0] rCol;
  reg [3:0] rRow;

  countCompare
  #(
    .NBITS (21)
  )
  CLKDIV
  (
    .clk (clk),
    .rst (rst),
    .compareValue (2_000_000),
    .equal (wClk20ms)
  );

  always @ (posedge wClk20ms or negedge rst) begin
    if (!rst) begin
      rCurrentState <= KEY_FREE;
    end
    else begin
    end
      rCurrentState <= rNextState;
  end

  always @ (posedge wClk20ms) begin
    case (rCurrentState)
      KEY_FREE: begin
        if (row != 4'hF)
          rNextState = SCAN_COL0;
        else
          rNextState = KEY_FREE;
      end

      SCAN_COL0: begin
        if (row != 4'hF)
          rNextState = KEY_DOWN;
        else
          rNextState = SCAN_COL1;
      end

      SCAN_COL1: begin
        if (row != 4'hF)
          rNextState = KEY_DOWN;
        else
          rNextState = SCAN_COL2;
      end

      SCAN_COL2: begin
        if (row != 4'hF)
          rNextState = KEY_DOWN;
        else
          rNextState = SCAN_COL3;
      end

      SCAN_COL3: begin
        if (row != 4'hF)
          rNextState = KEY_DOWN;
        else
          rNextState = KEY_FREE;
      end

      KEY_DOWN: begin
          rNextState = KEY_HOLD;
      end

      KEY_HOLD: begin
        if (row != 4'hF)
          rNextState = KEY_HOLD;
        else
          rNextState = KEY_UP;
      end

      KEY_UP: begin
        rNextState = KEY_FREE;
      end

      default: begin
        rNextState = KEY_FREE;
      end
    endcase
  end

  always @ (posedge wClk20ms or negedge rst) begin
    if (!rst) begin
        col <= 4'b0000;
        done <= 1'b1;
        rCol <= 4'h0;
        rRow <= 4'h0;
    end
    else begin
      case (rNextState)
        KEY_FREE: begin
          col <= 4'b0000;
          done <= 1'b1;
        end

        SCAN_COL0: begin
          col <= 4'b1110;
          done <= 1'b0;
        end

        SCAN_COL1: begin
          col <= 4'b1101;
          done <= 1'b0;
        end

        SCAN_COL2: begin
          col <= 4'b1011;
          done <= 1'b0;
        end

        SCAN_COL3: begin
          col <= 4'b0111;
          done <= 1'b0;
        end

        KEY_DOWN: begin
          rCol <= col;
          rRow <= row;
          done <= 1'b0;
        end

        KEY_HOLD: begin
          done <= 1'b0;
        end

        KEY_UP: begin
            done <= 1;
        end
      endcase
    end
  end

  always @ (posedge wClk20ms or negedge rst) begin
    if (!rst) begin
      key <= 4'hF;
    end
    else begin
      case ({rCol, rRow})
        8'b1110_1110 : key <= 4'h1;
        8'b1110_1101 : key <= 4'h4;
        8'b1110_1011 : key <= 4'h7;
        8'b1110_0111 : key <= 4'hE;

        8'b1101_1110 : key <= 4'h2;
        8'b1101_1101 : key <= 4'h5;
        8'b1101_1011 : key <= 4'h8;
        8'b1101_0111 : key <= 4'h0;

        8'b1011_1110 : key <= 4'h3;
        8'b1011_1101 : key <= 4'h6;
        8'b1011_1011 : key <= 4'h9;
        8'b1011_0111 : key <= 4'hF;

        8'b0111_1110 : key <= 4'hA;
        8'b0111_1101 : key <= 4'hB;
        8'b0111_1011 : key <= 4'hC;
        8'b0111_0111 : key <= 4'hD;
        default      : key <= 4'hF;
      endcase
    end
  end

endmodule // keyboard4x4
