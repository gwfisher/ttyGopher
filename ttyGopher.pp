program ttyGopher;

uses gopherFunctions, configFunctions, URIParser, crt;

var 
	ch: char;
	sel: integer;
	url: TURI;
	uri,host,path: string;
	port: integer;
begin
	uri := getConfigHost();
	url := ParseURI(uri);

	host := url.Host;
	port := Integer(url.Port);
	path := url.Path;

	openGopher(host , path, port); 

	writeln(uri);

	repeat
		write('Selection? ');
		read(sel);
		getSelection(sel);

		ch:=ReadKey;
	until ch=#27;
end.
