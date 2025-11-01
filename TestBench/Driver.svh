//class declaration
class dff_driver extends uvm_driver #(dff_seq_item);
  
  //factory registration
  `uvm_component_utils(dff_driver)
  
  //handle for interface
  virtual dff_if vif;
  dff_seq_item seq_item;
  
  //constructor
  function new(string name= "dff_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("dff_driver", "constructor", UVM_LOW)
  endfunction
  
 
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dff_if)::get(this," ", "vif", vif))
      `uvm_fatal("NO_VIF","virtual interface must be set");
  endfunction: build_phase
  
  //task body
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(seq_item);
      $display("driver");
      drive();
      seq_item_port.item_done();
    end
  endtask 
  //drive task
  task drive();
    @(posedge vif.clk or negedge vif.clk)
    vif.rst = seq_item.rst;
    vif.din = seq_item.din;
  endtask
endclass
