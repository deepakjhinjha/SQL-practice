create procedure welcome_msg(p_name in varchar(20)) is 
begin 
dbma.output.print_line('Welcome'|| P_name)
end;

EXEC welcome_msg("DEEPAK JHINJHA")