library verilog;
use verilog.vl_types.all;
entity MIPS_VHDL_vlg_check_tst is
    port(
        alu_result      : in     vl_logic_vector(3 downto 0);
        estado          : in     vl_logic_vector(2 downto 0);
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        led_verde_g4    : in     vl_logic;
        led_verde_g5    : in     vl_logic;
        led_verde_g6    : in     vl_logic;
        led_verde_g7    : in     vl_logic;
        led_vermelho_r0 : in     vl_logic;
        primeiroBit     : in     vl_logic;
        quartoBit       : in     vl_logic;
        segundoBit      : in     vl_logic;
        terceiroBit     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end MIPS_VHDL_vlg_check_tst;
