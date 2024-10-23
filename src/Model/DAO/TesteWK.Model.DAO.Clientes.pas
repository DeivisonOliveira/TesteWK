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
    Result := DataModule1.FDConnection.ExecSQLScalar('SELECT NOME FROM CLIENTES WHERE CODIGO = :CODIGO', [aParam]);

    if Result.IsEmpty then
      MessageDlg('Cliente não encontrado!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

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
