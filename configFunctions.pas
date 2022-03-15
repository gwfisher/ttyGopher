Unit configFunctions;

interface
uses IniFiles,sysutils;

var
	INI: TINIFile;

function getConfigHost() : String;

implementation

function getConfigHost() : String;

var
	defaultHost : String;
	homeDir : String;
	configPath: string;
begin

	homeDir := GetUserDir;
	configPath := homeDir + '.ttygopher';

	if FileExists(configPath) then
		begin
			INI := TINIFile.Create(configPath);
	
			defaultHost := INI.ReadString('General','Host','');

			getConfigHost := defaultHost;
		end
		else
		begin
			getConfigHost := 'gopher://sdf.org:70/';
		end;

end;

end.


