module correlator
#(
    parameter N = 11
)
(
    input clk,
    input reset,

    input signed [7:0] x [0:N-1],

    output reg signed [31:0] corr_out
);

reg signed [7:0] pulse [0:N-1];

integer i;

reg signed [31:0] sum;

initial
begin
    pulse[0]=1;
    pulse[1]=1;
    pulse[2]=1;
    pulse[3]=-1;
    pulse[4]=-1;
    pulse[5]=1;
    pulse[6]=1;
    pulse[7]=-1;
    pulse[8]=1;
    pulse[9]=-1;
    pulse[10]=1;
end

always @(posedge clk)
begin
    if(reset)
        corr_out <= 0;

    else
    begin
        sum = 0;

        for(i=0;i<N;i=i+1)
            sum = sum + x[i]*pulse[i];

        corr_out <= sum;
    end
end

endmodule