module shift_register
#(
    parameter N = 11
)
(
    input clk,
    input reset,
    input signed [7:0] sample_in,
    output reg signed [7:0] data [0:N-1]
);

integer i;

always @(posedge clk)
begin
    if(reset)
    begin
        for(i=0;i<N;i=i+1)
            data[i] <= 0;
    end

    else
    begin
        for(i=N-1;i>0;i=i-1)
            data[i] <= data[i-1];

        data[0] <= sample_in;
    end
end

endmodule