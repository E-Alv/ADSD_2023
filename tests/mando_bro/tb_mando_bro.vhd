library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

-- these two ARE mutually exclusive yah know !
--use ieee.fixed_pkg.all;

library floatfixlib;
use floatfixlib.fixed_pkg.all;

entity tb_mando_bro is
end entity tb_mando_bro;

architecture test_bench of tb_mando_bro is

	signal clock : std_logic := '0'    ;
    signal u_val : ufixed(3 downto -4) := "00000000" ;
    signal s_val : sfixed(3 downto -4) := "00000000" ;
    signal m_val : sfixed(3 downto -4) := "00000000" ;   
    signal distance : sfixed(3 downto -4) := "00000000" ;   


begin

	UUT : entity work.mando_bro port map (
        
        s_test => s_val,
        u_test => u_val,
        clock  => clock,
        m_test => m_val        
    );
    
    clock <= not clock after 10 ns; -- 50 MHz
    u_val <= to_ufixed(3.7, u_val) after 5 ns;
    s_val <= to_sfixed(1.5, s_val) after 5 ns;
    m_val <= to_sfixed(0.0, m_val) ;
    
    -- addition
    
    -- subtraction
    
    -- multiplication
    
    -- division
    
    --distance := (to_float(iters_cnt) + 1.0) / (to_float(max_iters) + 1.0)  ;
    distance := 
    

--    write_file : process is
--		file out_file : text open write_mode is "my_generated_file.ppm";
--		variable out_line : line;
--		variable red, grn, blu: natural range 0 to 15;
--	  begin
--        -- ppm file header
--		write(out_file, "P3" & LF); -- magic number, , full color PPM, ASCII characters
--		write(out_file, "64 64" & LF); -- image width & height
--		write(out_file, "15" & LF); -- max colors
--
--		-- generate colors
--		for i in 0 to 15 loop -- 19
--            red := i ;
--			    for j in 0 to 15 loop -- 39
--                    grn := j ;     
--                    for k in 0 to 15 loop
--                        blu := k ;
--				
--                        --for n in 0 to 7 loop
--                            write(-- write them to a file
--                                out_line, 
--                                integer'image(red) & " "
--                                & integer'image(grn) & " "
--                                & integer'image(blu));
--                            writeline(out_file, out_line);
--                        --end loop;    
--                    end loop;
--			    end loop;
--		end loop;
--
--		wait;
--	end process write_file;

end architecture test_bench;
