module top_radar
(
    input clk,
    input reset,

    input signed [7:0] sample_in,

    output signed [31:0] corr_out,
    output signed [31:0] peak
);

wire signed [7:0] data [0:10];

shift_register SR
(
    .clk(clk),
    .reset(reset),
    .sample_in(sample_in),
    .data(data)
);

correlator CORR
(
    .clk(clk),
    .reset(reset),
    .x(data),
    .corr_out(corr_out)
);

peak_detector PD
(
    .clk(clk),
    .reset(reset),
    .corr_in(corr_out),
    .peak(peak)
);

endmodule