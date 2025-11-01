//////////////////***************DESIGN CODE FOR D FLIP FLOP***************//////////////////
module dff(input clk,input rst,input din,output reg dout);
 always @(posedge clk or negedge clk) begin
    if(!rst) begin
      assign dout=din;
    end
    else begin
      assign dout=0;
    end
 end
endmodule
