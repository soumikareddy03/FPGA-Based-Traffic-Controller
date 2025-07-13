`timescale 1ns/1ps

module tb_traffic_light_fsm;

reg clk;
reg rst;
wire red, green, yellow;

traffic_light_fsm uut (
    .clk(clk),
    .rst(rst),
    .red(red),
    .green(green),
    .yellow(yellow)
);

// Generate clock
always #5 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    rst = 1;
    #10;
    rst = 0;

    // Run for some cycles
    #300;
    $stop;
end

endmodule