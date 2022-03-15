program ttyGopher;

uses gopherFunctions, configFunctions, URIParser, crt;

var 
	run: integer;
	ch: char;
	sel: integer;
	url: TURI;
	uri,host,path: string;

begin
	uri := getConfigHost();
	url := ParseURI(uri);

	host := url.Host;
	port := Integer(url.Port);
	path := url.Path;

	openGopher(host , path, port); 

	repeat
		ch := ReadKey;
	until ch=#27;
end.
