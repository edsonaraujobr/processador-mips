library verilog;
use verilog.vl_types.all;
entity MIPS_VHDL is
    port(
        clk             : in     vl_logic;
        start_key3      : in     vl_logic;
        confirmar_valor_key2: in     vl_logic;
        reset_key0      : in     vl_logic;
        led_verde_g7    : out    vl_logic;
        led_verde_g6    : out    vl_logic;
        led_verde_g5    : out    vl_logic;
        led_verde_g4    : out    vl_logic;
        led_vermelho_r0 : out    vl_logic;
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        primeiroBit     : out    vl_logic;
        segundoBit      : out    vl_logic;
        terceiroBit     : out    vl_logic;
        quartoBit       : out    vl_logic;
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        alu_ctrl        : in     vl_logic_vector(2 downto 0);
        alu_result      : out    vl_logic_vector(3 downto 0);
        estado          : out    vl_logic_vector(2 downto 0)
    );
end MIPS_VHDL;
