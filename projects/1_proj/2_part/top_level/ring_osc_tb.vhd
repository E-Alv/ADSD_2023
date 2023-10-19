-- ring_osc_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

entity ring_osc_tb is
end ring_osc_tb;

architecture test_fixture of ring_osc_tb is

    signal enable : std_logic;  -- inputs
    signal ro_out : std_logic;  

begin
    -- connecting testbench signals with ring_oscillator.vhd
	UUT : entity work.ring_oscillator port map (
		enable => enable,
		ro_out => ro_out
	);

    -- inputs
	 enable <= '0', '0' after 0.2 ns, '1' after 0.3 ns, '1' after 0.5 ns, '0' after 0.7 ns, '0' after 0.9 ns;
	 
end test_fixture ;