module nand_d_latch (q, en, d);
    input en, d;
    output q;

    wire inverted_d, qp, set, reset;
    
    INV l0_input_inverter(inverted_d, d);

    NAND2 l1_set_control(set, en, d) ;
    NAND2 l1_reset_control(reset, en, inverted_d) ;
    
    NAND2 l2_reset_output(qp, reset, q);
    NAND2 l2_set_ouput(q, set, qp);
endmodule

module master_slave_d_flip_flop (q, d, clk);
    input d, clk;
    output q;

    wire inverted_clk, latch_connection;

    INV l0_input_inverter(inverted_clk, clk);

    nand_d_latch l1_latch(latch_connection, clk, d);
    nand_d_latch l2_latch(q, inverted_clk, latch_connection);
endmodule

