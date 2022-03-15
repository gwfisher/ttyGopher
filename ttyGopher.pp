program ttyGopher;

uses gopherFunctions, crt;

var 
	ch: char;
	sel: integer;
begin
	openGopher('sdf.org','/', 70);
	
	repeat
		write('Selection? ');
		read(sel);
		getSelection(sel);

		ch:=ReadKey;
	until ch=#27;
end.
