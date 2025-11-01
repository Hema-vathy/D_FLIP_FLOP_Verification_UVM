/////////////////*****************SCOREBOARD FILE*****************/////////////////
//class declaration
class dff_scoreboard extends uvm_scoreboard;
  
  //factory registration
  `uvm_component_utils(dff_scoreboard)
  
  uvm_analysis_imp #(dff_seq_item, dff_scoreboard) analysis_export;
  
  //constructor
  function new(string name= "dff_scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("dff_scoreboard", "-constructor", UVM_LOW)
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_export = new("analysis_export", this);
  endfunction : build_phase
  
  // write task - recives the pkt from monitor and pushes into queue
  //write function
  function void write(dff_seq_item pkt);
    if(pkt.dout != pkt.din) begin
      $error("not matched: din: %b dout: %b at time: %t", pkt.din, pkt.dout, $time);
    end
  endfunction: write
endclass
