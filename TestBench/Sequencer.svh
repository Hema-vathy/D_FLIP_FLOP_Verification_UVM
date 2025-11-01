//////////////******************SEQUENCER FILE******************//////////////
//class declaration
class dff_sequencer extends uvm_sequencer #(dff_seq_item);
  
  //factory registration
  `uvm_component_utils(dff_sequencer)
  
  dff_sequence seq;
  //constructor
  function new(string name= "dff_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("dff_sequencer","constructor",UVM_LOW)
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=dff_sequence::type_id::create("seq");
  endfunction:build_phase
endclass
