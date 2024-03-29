	component all_things is
		port (
			clk_clk       : in  std_logic := 'X'; -- clk
			led_export    : out std_logic;        -- export
			sw_export     : in  std_logic := 'X'; -- export
			reset_reset_n : in  std_logic := 'X'  -- reset_n
		);
	end component all_things;

	u0 : component all_things
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			led_export    => CONNECTED_TO_led_export,    --   led.export
			sw_export     => CONNECTED_TO_sw_export,     --    sw.export
			reset_reset_n => CONNECTED_TO_reset_reset_n  -- reset.reset_n
		);

