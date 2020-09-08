----------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: HW0_P7
-- Design Name: TB_SE_DETECT
----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_SEQ_DETECT is
end TB_SEQ_DETECT;

architecture Behavioral of TB_SEQ_DETECT is
component SEQ_DETECT is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CONT : in STD_LOGIC;
           INPUT : in STD_LOGIC;
           OUTPUT : out STD_LOGIC);
end component SEQ_DETECT;

signal CLOCK,RESET,CONT,INPUT,OUTPUT: STD_LOGIC;

begin
UUT: SEQ_DETECT port map (CLOCK=>CLOCK, RESET=>RESET, CONT=>CONT, INPUT=>INPUT, OUTPUT=>OUTPUT);

process
begin
CLOCK <= '0';
wait for 5ns;
CLOCK <= '1';
wait for 5ns;
end process;

process
begin
RESET <= '0';
CONT <= '0';
wait for 2ns;
RESET <= '1';
wait for 10ns;
RESET <= '0';
CONT <= '1';
wait;
end process;

process
begin
INPUT <='0';
wait for 10ns;
INPUT <= '1';
wait for 20ns;
INPUT <='0';
wait for 10ns;
INPUT <= '1';
wait for 10ns;
INPUT <= '0';
wait for 10ns;
INPUT <= '1';
wait for 10ns;
INPUT <= '1';
wait for 10ns;
INPUT <= '1';
wait for 20ns;
INPUT <= '0';
wait for 10ns;
end process;
end Behavioral;
