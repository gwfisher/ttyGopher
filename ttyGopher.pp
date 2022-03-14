program ttyGopher;

uses gopherFunctions, crt;

var 
	ch: char;
	sel: integer;
begin
	openGopher('','',0);
	write('Selection? ');
	read(sel);
	getSelection(sel);

	repeat
		ch:=ReadKey;
	until ch=#27

end.
