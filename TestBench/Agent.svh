//class declaration
class dff_agent extends uvm_agent;
  
  //factory registration
  `uvm_component_utils(dff_agent)
  
  //handle creation
  dff_driver drv;
  dff_monitor mon;
  dff_sequencer seqr;  
  
  //constructor
  function new(string name="dff_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("dff_agent", "constructor", UVM_LOW)
  endfunction:new
  
  // active agent or passive agent
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (get_is_active() == UVM_ACTIVE) begin 
      drv = dff_driver::type_id::create("dff_driver", this);
      seqr = dff_sequencer::type_id::create("dff_sequencer", this);
    end
    mon = dff_monitor::type_id::create("dff_monitor", this);
  endfunction : build_phase
  
  //connect phase
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active()) begin
     `uvm_info("agent Class", "connect phase", UVM_LOW)
    drv.seq_item_port.connect(seqr.seq_item_export);
    end
  endfunction:connect_phase
endclass
