program ttyGopher;

uses gopherFunctions, configFunctions, URIParser, crt;

var 
	ch: char;
	url: TURI;
	uri,host,path: string;
	port,sel: integer;


begin
	uri := getConfigHost();
	url := ParseURI(uri);

	host := url.Host;
	port := Integer(url.Port);
	path := url.Path;

	openGopher(host , path, port); 
	write('Selection ? ');
	read(sel);
	getSelection(sel);

	repeat
		ch := ReadKey;
	until ch=#27;
end.
