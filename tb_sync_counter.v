module testbench;
  reg clk,rst_n,test_enable;
  wire [3:0] test_count;
  
  sync_counter DUT(.clk(clk), .rst_n(rst_n), .enable(test_enable),    .count(test_count)
                );
  initial
    clk =1'b0;
  always #5 clk = ~clk;
  
  initial
    begin
      
  rst_n =1'b0;
  test_enable =1'b0;
      
  @(posedge clk);
      #1;
  
      if(test_count ==4'b0000)begin
        $display("PASS:test_count (%b) works suuper perfecto",test_count);
  end else begin
    $display("FAIL:test_count (%b) is missing",test_count);
  end
  
   rst_n =1'b1;
  test_enable =1'b1;
      
   @(posedge clk);
      #1;
  
      if(test_count ==4'b0001)begin
        $display("PASS:test_count (%b) works suuper perfecto",test_count);
  end else begin
    $display("FAIL:test_count (%b) is missing bro",test_count);
  end
      $finish;
    end
endmodule
