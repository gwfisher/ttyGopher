unit gopherFunctions;

interface
uses
	gopherclient,crt;

type 
	MenuItem = record
		ItemText: array of string;
		ItemType: array of string;
		ItemHost: array of string;
		ItemPort: array of integer;
		ItemSelector: array of string;
	end;

var
	menu: MenuItem;

procedure writeGopher(size: integer);
procedure openGopher(host, selector: string; port: integer);
procedure getSelection(sel: integer);


implementation

procedure writeGopher(size: integer);
var
	i: integer;
begin
	for i := 0 to size do
	begin
		case (menu.ItemType[i]) of
			'i': 
				writeln(menu.ItemText[i]);
			'1':
				writeln(i, ' ' + menu.ItemText[i]);
		end;
	end;
end;

procedure openGopher(host, selector: string;  port: integer);

var
	client: TGopherClient;
	i,size: integer;

begin
	client := TGopherClient.Create;

	client.Host := host;
	client.Selector := selector;
	client.Port := port;

	client.Get;

	size := client.Contents.Count - 1;

	setLength(menu.ItemText,size);
	setLength(menu.ItemType,size);
	setLength(menu.ItemHost,size);
	setLength(menu.ItemPort,size);
	setLength(menu.ItemSelector,size);

	for i := 0 to size do
	begin
		menu.ItemText[i] := client.MenuItems[i].Text;
		menu.ItemType[i] := client.MenuItems[i].GopherType;
		menu.ItemHost[i] := client.MenuItems[i].Host;
		menu.ItemPort[i] := client.MenuItems[i].Port;
		menu.ItemSelector[i] := client.MenuItems[i].Selector;
	end;

	writeGopher(size);
	client.Free;
end;

procedure getSelection(sel: integer);
var
	host: string;
	port: integer;
	selector: string;
	sel: integer;

begin
	host := menu.Itemhost[sel];
	port := menu.ItemPorr[sel];
	selector := menu.ItemSelector[sel];
	sel := 0;
	write('Selection?');
	read(opt);
	openGopher(host,selector,port);
end;

end.
