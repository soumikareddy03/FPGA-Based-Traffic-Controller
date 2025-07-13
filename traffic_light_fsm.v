module traffic_light_fsm (
    input wire clk,
    input wire rst,
    output reg red,
    output reg green,
    output reg yellow
);

// State encoding
localparam S0 = 2'b00;  // Red
localparam S1 = 2'b01;  // Green
localparam S2 = 2'b10;  // Yellow

// State register
reg [1:0] state, next_state;

// Counter for timing
reg [3:0] count;
reg [3:0] count_max;

// FSM state transition
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= S0;
        count <= 0;
    end else begin
        if (count == count_max - 1) begin
            state <= next_state;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
end

// Next state logic
always @(*) begin
    case (state)
        S0: next_state = S1;  // Red ? Green
        S1: next_state = S2;  // Green ? Yellow
        S2: next_state = S0;  // Yellow ? Red
        default: next_state = S0;
    endcase
end

// Counter max value logic (state duration)
always @(*) begin
    case (state)
        S0: count_max = 10;  // Red
        S1: count_max = 10;  // Green
        S2: count_max = 3;   // Yellow
        default: count_max = 10;
    endcase
end

// Output logic (Moore)
always @(*) begin
    red = 0;
    green = 0;
    yellow = 0;
    case (state)
        S0: red = 1;
        S1: green = 1;
        S2: yellow = 1;
        default: red = 1;
    endcase
end

endmodule