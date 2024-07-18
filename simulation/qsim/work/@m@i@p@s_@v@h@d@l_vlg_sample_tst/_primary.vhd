library verilog;
use verilog.vl_types.all;
entity MIPS_VHDL_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        alu_ctrl        : in     vl_logic_vector(2 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        confirmar_valor_key2: in     vl_logic;
        reset_key0      : in     vl_logic;
        start_key3      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MIPS_VHDL_vlg_sample_tst;
