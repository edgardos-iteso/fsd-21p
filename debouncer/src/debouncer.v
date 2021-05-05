module debouncer
(
  input clk,
  input rst,
  input sw_pb,
  output reg one_shot
);

  parameter [2:0] ini = 'b000;
  parameter [2:0] shot = 'b001;
  parameter [2:0] off1 = 'b011;
  parameter [2:0] sw_pb_1 = 'b010;
  parameter [2:0] off2 = 'b110;

  wire fin_delay;

  reg [2:0] estado;

  always @ (posedge clk or negedge rst) begin
    if (!rst) begin
      estado <= ini;
    end
    else
      case (estado)
        ini: begin
          if (sw_pb) begin
            estado <= shot;
          end
        end
        shot: begin
          estado <= off1;
        end
        off1: begin
          if (fin_delay) begin
            estado <= sw_pb_1;
          end
        end
        sw_pb_1: begin
          if (!sw_pb) begin
            estado <= off2;
          end
        end
        off2: begin
          estado <= ini;
        end
        default: begin
          estado <= ini;
        end
      endcase
  end

  always @ ( estado ) begin
    case (estado)
      ini: one_shot <= 'b0;
      shot: one_shot <= 'b1;
      off1: one_shot <= 'b0;
      sw_pb_1: one_shot <= 'b0;
      off2: one_shot <= 'b0;
      default: one_shot <= 'b0;
    endcase
  end

  countCompare
  #(
    .NBITS(22)
  ) COUNTCOMPARE
  (
    .clk (clk),
    .rst (rst),
    .compareValue (3000000),
    .equal (fin_delay)
  );

endmodule
