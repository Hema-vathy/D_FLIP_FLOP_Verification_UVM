//class declaration
class dff_sequence extends uvm_sequence #(dff_seq_item);
  
  //factory registration
  `uvm_object_utils(dff_sequence)
  //handle creation
  dff_seq_item seq_item;
  
  //constructor
  function new(string name ="dff_sequence");
    super.new(name);
    `uvm_info("dff_sequence", "constructor", UVM_LOW)
    $display("Seqqqqq");
  endfunction

  //task body
  task body();
    $display("started");
    seq_item=dff_seq_item::type_id::create("seq_item",null);
    #40 seq_item.rst = 1'b0;
    $display("reset---------------");
    repeat(50) begin
      start_item(seq_item);
      seq_item.din=$urandom_range(0,1);
      $display("sequence");
      finish_item(seq_item);
    end
    $display("reset---------------end");
   // #40 seq_item.rst = 0;
  endtask
endclass
  
