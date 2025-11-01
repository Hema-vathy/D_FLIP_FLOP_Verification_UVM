`include "uvm_macros.svh" // contains all uvm macros
import uvm_pkg::*;
//import file_pkg::*;
`include "dff_interface.svh"
`include "dff_seq_item.svh"
`include "dff_seq.svh"
`include "dff_sequencer.svh"
`include "dff_driver.svh"
`include "dff_monitor.svh"
`include "dff_agent.svh"
`include "dff_scoreboard.svh"
`include "dff_env.svh"
`include "dff_test.svh"
module dff_tb_top;
    
  //creating handle for interface
  dff_if vif();
  
    //DUT Instance
  dff dut(.clk(vif.clk),
          .rst(vif.rst),
          .din(vif.din),
          .dout(vif.dout));
  
  //Initialization block
  initial begin
    vif.clk=0;
    vif.rst = 1; 
    vif.din=0;
  end
  
  task clk_gen();
    forever #5 vif.clk=~vif.clk;
  endtask
   
  initial begin
    uvm_config_db#(virtual dff_if)::set(null, "*", "vif", vif);
  end
  
  initial begin
    $monitor($time,"clk=%b,rst=%b,din=%b,dout=%b",vif.clk,vif.rst,vif.din,vif.dout);
  end
  
  initial begin
    fork
      clk_gen();
    join

  end
 
  
  //Calling run test
  initial begin
    run_test("dff_test");
    `uvm_info("Run phase","run_test initiated",UVM_LOW)
  end
  //dump file
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dff_tb_top);
  end
endmodule
    
  
