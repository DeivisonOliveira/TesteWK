unit TesteWK.Model.DAO.Clientes;

interface

uses
  Data.DB,
  System.SysUtils,
  System.UITypes,
  Vcl.Dialogs,
  FireDAC.Stan.Param,
  TesteWK.Model.Components.Connection.FireDAC;

type

  TModelDAOClientes = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function GetNomeCliente(aParam : Integer) : string;
  end;

implementation


{ TModelDAOClientes }

constructor TModelDAOClientes.Create;
begin

end;

destructor TModelDAOClientes.Destroy;
begin

  inherited;
end;

function TModelDAOClientes.GetNomeCliente(aParam : Integer): string;
begin
  DataModule1.FDConnection.StartTransaction;
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('SELECT NOME FROM CLIENTES WHERE CODIGO = :CODIGO');
    DataModule1.FDQuery.ParamByName('CODIGO').AsInteger := aParam;
    DataModule1.FDQuery.Open;

    if DataModule1.FDQuery.IsEmpty then
      MessageDlg('Cliente não encontrado!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

    Result := DataModule1.FDQuery.FieldByName('NOME').AsString;
    DataModule1.FDConnection.Commit;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível buscar o Cliente:' + sLineBreak + E.Message);
    end;
  end;
end;

end.
