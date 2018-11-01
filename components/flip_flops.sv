module master_slave_d_flip_flop (q, d, clk);
    input d, clk;
    output q;

    wire inverted_clk, latch_connection;

    INV l0_input_inverter(inverted_clk, clk);

    nand_d_latch l1_latch(latch_connection, clk, d);
    nand_d_latch l2_latch(q, inverted_clk, latch_connection);
endmodule