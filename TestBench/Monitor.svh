////////////***************MONITOR FILE***************////////////
//class declaration
class dff_monitor extends uvm_monitor;
  //factory registration
  `uvm_component_utils(dff_monitor)
  
  //handle for interface
  virtual dff_if vif;
  uvm_analysis_port #(dff_seq_item) analysis_port;
  dff_seq_item seq_item;
  
  //constructor
  function new(string name="dff_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("dff_monitor","constructor",UVM_NONE)
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_port = new("analysis_port", this);
    if(!uvm_config_db#(virtual dff_if)::get(this, "", "vif", vif))
      `uvm_fatal("no_inf in driver","virtual interface get failed from config db");
  endfunction : build_phase
    //task body
    task body(uvm_phase phase);
      forever begin @(posedge vif.clk or negedge vif.clk)
        seq_item = dff_seq_item::type_id::create("seq_item");
        seq_item.rst = vif.rst;
        seq_item.din = vif.din;
        seq_item.dout= vif.dout;
        analysis_port.write(seq_item);
      end
    endtask
endclass
