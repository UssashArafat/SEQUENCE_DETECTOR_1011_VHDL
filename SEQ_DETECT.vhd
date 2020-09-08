----------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: HW0_P7
-- Design Name: SEQ_DETECT
----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SEQ_DETECT is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CONT : in STD_LOGIC;
           INPUT : in STD_LOGIC;
           OUTPUT : out STD_LOGIC);
end SEQ_DETECT;

architecture Behavioral of SEQ_DETECT is

type STATE_TYPE is (ST0, ST1, ST2, ST3, ST4);
signal NEXT_STATE, CURRENT_STATE : STATE_TYPE;

begin
--NEXT STATE LOGIC
    process(INPUT, CURRENT_STATE)
    begin
        case CURRENT_STATE is
        when ST0 => 
            if(INPUT='1') then
                NEXT_STATE <= ST1;
            else NEXT_STATE <= ST0;
            end if;
        when ST1 => 
            if(INPUT='0') then
                NEXT_STATE <= ST2;
            else NEXT_STATE <= ST1;
            end if;
        when ST2 => 
            if(INPUT='1') then
                NEXT_STATE <= ST3;
            else NEXT_STATE <= ST0;
            end if;
        when ST3 => 
            if(INPUT='1') then
                NEXT_STATE <= ST4;
            else NEXT_STATE <= ST2;
            end if;
        when ST4 => 
            if(INPUT='1') then
                NEXT_STATE <= ST1;
            else NEXT_STATE <= ST2;
            end if;
        when others =>
             NEXT_STATE <= ST0;
        end case;
      end process;
--CURRENT STATE LOGIC
    process(CLOCK, RESET)
    begin
        if(RESET = '1') then
        CURRENT_STATE <= ST0;
        elsif(rising_edge(CLOCK)) then
        CURRENT_STATE <= NEXT_STATE;
        end if;
    end process;
--OUTPUT Logic
OUTPUT <=  '1' when (CURRENT_STATE = ST4 and CONT = '1') else
           '0';       
end Behavioral;
