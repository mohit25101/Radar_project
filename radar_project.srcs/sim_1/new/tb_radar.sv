module tb_radar;

reg clk;
reg reset;

reg signed [7:0] sample_in;

wire signed [31:0] corr_out;
wire signed [31:0] peak;

top_radar DUT
(
    .clk(clk),
    .reset(reset),
    .sample_in(sample_in),
    .corr_out(corr_out),
    .peak(peak)
);

always #5 clk = ~clk;

integer i;

integer file;

integer data_read;

reg signed [7:0] sample_memory [0:255];

initial
begin

    clk = 0;
    reset = 1;

    #20;
    reset = 0;

    //-----------------------------------
    // READ MATLAB GENERATED FILE
    //-----------------------------------

    file = $fopen("radar_input.txt","r");

    i = 0;

    while(!$feof(file))
    begin

        data_read = $fscanf(file,"%d\n",sample_memory[i]);

        i = i + 1;

    end

    $fclose(file);

    //-----------------------------------
    // FEED SAMPLES TO FPGA
    //-----------------------------------

    for(i=0;i<36;i=i+1)
    begin

        sample_in = sample_memory[i];

        #10;

    end
    $monitor("time=%0t sample=%d corr=%d peak=%d",
          $time,
          sample_in,
          corr_out,
          peak);

    #100;

    $stop;

end

endmodule