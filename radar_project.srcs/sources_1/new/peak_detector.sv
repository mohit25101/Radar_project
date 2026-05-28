module peak_detector
(
    input clk,
    input reset,

    input signed [31:0] corr_in,

    output reg signed [31:0] peak
);

always @(posedge clk)
begin
    if(reset)
        peak <= 0;

    else
    begin
        if(corr_in > peak)
            peak <= corr_in;
    end
end

endmodule