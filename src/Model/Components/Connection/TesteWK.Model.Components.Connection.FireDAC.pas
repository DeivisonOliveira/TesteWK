unit TesteWK.Model.Components.Connection.FireDAC;

interface

uses
  Data.DB,
  IniFiles,
  System.Classes,
  System.UITypes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.MySQL,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type

  TConfigDB = class
    DriverID: string;
    Database: string;
    User_Name: string;
    Password: string;
    Server: string;
    Port: Integer;
    VendorLib: string;
    Diretorio: string;
    Arquivo: string;
  end;

  TDataModule1 = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FConfigDB: TConfigDB;
    procedure Carrega_Arquivo_Ini;
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses
  System.SysUtils, Vcl.Forms, Vcl.Dialogs;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  FConfigDB := TConfigDB.Create;

  Carrega_Arquivo_Ini;

  try
    FDConnection.LoginPrompt := False;
    FDConnection.Open;
  except
    on E: Exception do
    begin
      MessageDlg('Não foi possível conectar na Base de Dados:' + sLineBreak + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      Application.Terminate;
      Exit;
    end;
  end;
end;

procedure TDataModule1.Carrega_Arquivo_Ini;
var
  vConfigFile: TIniFile;
const
  CONFIG_DB: string = 'CONFIG_DB';
begin
  FConfigDB.Diretorio := ExtractFilePath(Application.ExeName);
  FConfigDB.Arquivo := FConfigDB.Diretorio + 'TesteWK.ini';

  vConfigFile := TIniFile.Create(FConfigDB.Arquivo);

  try
    if vConfigFile.ReadString(CONFIG_DB, 'DriverID', '').IsEmpty then
    begin
      vConfigFile.EraseSection(CONFIG_DB);
      vConfigFile.WriteString(CONFIG_DB, 'DriverID', 'MySQL');
      vConfigFile.WriteString(CONFIG_DB, 'Database', 'teste_wk');
      vConfigFile.WriteString(CONFIG_DB, 'User_Name', 'deivison');
      vConfigFile.WriteString(CONFIG_DB, 'Password', 'mysql');
      vConfigFile.WriteString(CONFIG_DB, 'Server', 'localhost');
      vConfigFile.WriteString(CONFIG_DB, 'Port', '3306');
      vConfigFile.WriteString(CONFIG_DB, 'VendorLib', FConfigDB.Diretorio + 'libmysql.dll');
    end;

    FConfigDB.DriverID := vConfigFile.ReadString(CONFIG_DB, 'DriverID', '');
    FConfigDB.Database := vConfigFile.ReadString(CONFIG_DB, 'Database', '');
    FConfigDB.User_Name := vConfigFile.ReadString(CONFIG_DB, 'User_Name', '');
    FConfigDB.Password := vConfigFile.ReadString(CONFIG_DB, 'Password', '');
    FConfigDB.Server := vConfigFile.ReadString(CONFIG_DB, 'Server', '');
    FConfigDB.Port := vConfigFile.ReadInteger(CONFIG_DB, 'Port', 3306);
    FConfigDB.VendorLib := vConfigFile.ReadString(CONFIG_DB, 'VendorLib', '');

    vConfigFile.ReadSectionValues(CONFIG_DB, FDConnection.Params);
    FDPhysMySQLDriverLink.VendorLib := FConfigDB.VendorLib;
  finally
    FreeAndNil(vConfigFile);
  end;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  FConfigDB.Free;
end;

end.
