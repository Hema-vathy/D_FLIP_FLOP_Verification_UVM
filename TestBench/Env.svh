/////////////////***************ENVIRONMENT FILE***************/////////////////
//class declaration
class dff_env extends uvm_env;
  
  //factory registration
  `uvm_component_utils(dff_env)
  
  //handle creation
  dff_agent agent;
  dff_scoreboard scb;
  //virtual dff_if intf;
  
  //constructor
  function new(string name = "dff_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("dff_env", "constructor", UVM_LOW)
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scb = dff_scoreboard::type_id::create("scb", this);
    agent = dff_agent::type_id::create("agent", this);
  endfunction : build_phase
  
  /*//set the interface
  initial begin
    //for driver
    uvm_config_db#(virtual dff_if)::set(null,"uvm_test_top.env.agent.driver","vif",intf);
    
    //for monitor
    uvm_config_db#(virtual dff_if)::set(null,"uvm_test_top.env.agent.monitor","vif",intf);
  end*/
  
  // connect phase
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     `uvm_info("env Class", "connect phase", UVM_LOW);
     agent.mon.analysis_port.connect(scb.analysis_export);
   endfunction:connect_phase
endclass
