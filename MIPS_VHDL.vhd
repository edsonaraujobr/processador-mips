library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPS_VHDL is
    port (
        clk: in std_logic;
		  start_key3: in std_logic;
	     confirmar_valor_key2: in std_logic;
        reset_key0: in std_logic;
        led_verde_g7, led_verde_g6, led_verde_g5, led_verde_g4, led_vermelho_r0: out std_logic;
		  
		  HEX3 : out STD_LOGIC_VECTOR (6 downto 0);
		  HEX2 : out STD_LOGIC_VECTOR (6 downto 0);
		  HEX1 : out STD_LOGIC_VECTOR (6 downto 0);
		  HEX0 : out STD_LOGIC_VECTOR (6 downto 0);
		  
		  primeiroBit, segundoBit, terceiroBit, quartoBit: buffer std_logic;
        a, b: in std_logic_vector(3 downto 0);
        alu_ctrl: in std_logic_vector(2 downto 0);
        alu_result: buffer std_logic_vector(3 downto 0);
        estado: out std_logic_vector(2 downto 0)
  );
end MIPS_VHDL;

architecture Behavioral of MIPS_VHDL is
 
    type estados_type is (estado_adicionar_a, estado_adicionar_b, estado_adicionar_operacao, estado_final, estado_reiniciar);
    signal estado_atual, proximo_estado: std_logic_vector(2 downto 0);
	 
begin
	
    process(clk)
    begin
        if (clk'event and clk = '1') then
            if reset_key0 = '0' then
                estado_atual <= "000";
            else
                estado_atual <= proximo_estado;

                case estado_atual is
                    when "000" => 
								estado <= "000";
								
								led_vermelho_r0 <= '1';
								led_verde_g7 <= '0';
								led_verde_g6 <=  '0';
								led_verde_g5 <= '0';
								led_verde_g4 <= '0';
								
								
                        if start_key3 = '0' then
                            proximo_estado <= "001";
                        end if;

                    when "001" => 
								led_vermelho_r0 <= '0';
								led_verde_g7 <= '1';
								led_verde_g6 <=  '0';
								led_verde_g5 <= '0';
								led_verde_g4 <= '0';
								
								primeiroBit <= a(3);
								segundoBit <= a(2);
								terceiroBit <= a(1);
								quartoBit <= a(0);
								
								estado <= "001";
                        if confirmar_valor_key2 = '0' then
                            proximo_estado <= "010"; 
                        end if;

                    when "010" => 
								led_vermelho_r0 <= '0';
								led_verde_g7 <= '1';
								led_verde_g6 <=  '1';
								led_verde_g5 <= '0';
								led_verde_g4 <= '0';
								
								primeiroBit <= b(3);
								segundoBit <= b(2);
								terceiroBit <= b(1);
								quartoBit <= b(0);
								
								estado <= "010";
                        if confirmar_valor_key2 = '0' then
                            proximo_estado <= "011";
                        end if;

                    when "011" => 
						  
								led_vermelho_r0 <= '0';
								led_verde_g7 <= '1';
								led_verde_g6 <=  '1';
								led_verde_g5 <= '1';
								led_verde_g4 <= '0';
								
								primeiroBit <= alu_ctrl(2);
								segundoBit <= alu_ctrl(1);
								terceiroBit <= alu_ctrl(0);
								quartoBit <= '0';
								
								estado <= "011";
                        if confirmar_valor_key2 = '0' then
                            proximo_estado <= "100"; 
                        end if;

                    when "100" => 
						  
								led_vermelho_r0 <= '0';
								led_verde_g7 <= '1';
								led_verde_g6 <=  '1';
								led_verde_g5 <= '1';
								led_verde_g4 <= '1';
								
								primeiroBit <= alu_result(3);
								segundoBit <= alu_result(2);
								terceiroBit <= alu_result(1);
								quartoBit <= alu_result(0);
								
								
								estado <= "100";
                       if reset_key0 = '0' then
									 proximo_estado <= "000"; 
							  end if;
                    when others =>
                        proximo_estado <= "000"; 
                end case;
            end if;
        end if;
    end process;
	 
	 process (primeiroBit)
    begin
        if primeiroBit = '0' then
            HEX3 <= "0111111";  -- Display 0
        else
            HEX3 <= "0000110";  -- Display 1
        end if;
    end process;
	 
	 process (segundoBit)
    begin
        if segundoBit = '0' then
            HEX2 <= "0111111";  -- Display 0
        else
            HEX2 <= "0000110";  -- Display 1
        end if;
    end process;
	 
	 process (terceiroBit)
    begin
        if terceiroBit = '0' then
            HEX1 <= "0111111";  -- Display 0
        else
            HEX1 <= "0000110";  -- Display 1
        end if;
    end process;
	 
	 process (quartoBit)
    begin
        if quartoBit = '0' then
            HEX0 <= "0111111";  -- Display 0
        else
            HEX0 <= "0000110";  -- Display 1
        end if;
    end process;
	 
    alu: entity work.ALU_VHDL port map (
	     a => a,
        b => b,
        alu_control => alu_ctrl,
        alu_result => alu_result
    );
	 
end Behavioral;
