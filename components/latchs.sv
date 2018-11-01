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