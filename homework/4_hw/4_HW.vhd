-- 4_HW_Quest_1.a
  type seven_segment_config is record
      a   : std_logic;
      b   : std_logic;
      c   : std_logic;
      d   : std_logic;
      e   : std_logic;
      f   : std_logic;
      g   : std_logic;
      dp  : std_logic;
    end record seven_segment_config;
-- 4_HW_Quest_1.b
  type seven_seg_config_arr is array(natural range <>) of seven_segment_config;

-- 4_HW_Quest_2
  type lamp_configuration is (common_anode, common_cathode);
  constant default_lamp_config : lamp_configuration := common_anode;
  -- Pin assignments will be handled at the top level. Not going to create a record here for it.
  -- Pin mapping belowl
  ------     set_location_assignment PIN_C14 -to HEX0[0]
  ------     set_location_assignment PIN_E15 -to HEX0[1]
  ------     set_location_assignment PIN_C15 -to HEX0[2]
  ------     set_location_assignment PIN_C16 -to HEX0[3]
  ------     set_location_assignment PIN_E16 -to HEX0[4]
  ------     set_location_assignment PIN_D17 -to HEX0[5]
  ------     set_location_assignment PIN_C17 -to HEX0[6]
  ------     set_location_assignment PIN_D15 -to HEX0[7]
  ------     set_location_assignment PIN_C18 -to HEX1[0]
  ------     set_location_assignment PIN_D18 -to HEX1[1]
  ------     set_location_assignment PIN_E18 -to HEX1[2]
  ------     set_location_assignment PIN_B16 -to HEX1[3]
  ------     set_location_assignment PIN_A17 -to HEX1[4]
  ------     set_location_assignment PIN_A18 -to HEX1[5]
  ------     set_location_assignment PIN_B17 -to HEX1[6]
  ------     set_location_assignment PIN_A16 -to HEX1[7]
  ------     set_location_assignment PIN_B20 -to HEX2[0]
  ------     set_location_assignment PIN_A20 -to HEX2[1]
  ------     set_location_assignment PIN_B19 -to HEX2[2]
  ------     set_location_assignment PIN_A21 -to HEX2[3]
  ------     set_location_assignment PIN_B21 -to HEX2[4]
  ------     set_location_assignment PIN_C22 -to HEX2[5]
  ------     set_location_assignment PIN_B22 -to HEX2[6]
  ------     set_location_assignment PIN_A19 -to HEX2[7]
  ------     set_location_assignment PIN_F21 -to HEX3[0]
  ------     set_location_assignment PIN_E22 -to HEX3[1]
  ------     set_location_assignment PIN_E21 -to HEX3[2]
  ------     set_location_assignment PIN_C19 -to HEX3[3]
  ------     set_location_assignment PIN_C20 -to HEX3[4]
  ------     set_location_assignment PIN_D19 -to HEX3[5]
  ------     set_location_assignment PIN_E17 -to HEX3[6]
  ------     set_location_assignment PIN_D22 -to HEX3[7]
  ------     set_location_assignment PIN_F18 -to HEX4[0]
  ------     set_location_assignment PIN_E20 -to HEX4[1]
  ------     set_location_assignment PIN_E19 -to HEX4[2]
  ------     set_location_assignment PIN_J18 -to HEX4[3]
  ------     set_location_assignment PIN_H19 -to HEX4[4]
  ------     set_location_assignment PIN_F19 -to HEX4[5]
  ------     set_location_assignment PIN_F20 -to HEX4[6]
  ------     set_location_assignment PIN_F17 -to HEX4[7]
  ------     set_location_assignment PIN_J20 -to HEX5[0]
  ------     set_location_assignment PIN_K20 -to HEX5[1]
  ------     set_location_assignment PIN_L18 -to HEX5[2]
  ------     set_location_assignment PIN_N18 -to HEX5[3]
  ------     set_location_assignment PIN_M20 -to HEX5[4]
  ------     set_location_assignment PIN_N19 -to HEX5[5]
  ------     set_location_assignment PIN_N20 -to HEX5[6]
  ------     set_location_assignment PIN_L19 -to HEX5[7]

  