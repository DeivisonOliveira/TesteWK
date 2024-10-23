unit TesteWK.Model.DAO.Produtos;

interface

uses
  Data.DB,
  System.SysUtils,
  System.UITypes,
  Vcl.Dialogs,
  FireDAC.Stan.Param,
  TesteWK.Model.Components.Connection.FireDAC;

type

  TModelDAOProdutos = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function GetDescricaoProduto(aParam : Integer) : string;
  end;

implementation

{ TModelDAOProdutos }

constructor TModelDAOProdutos.Create;
begin

end;

destructor TModelDAOProdutos.Destroy;
begin

  inherited;
end;

function TModelDAOProdutos.GetDescricaoProduto(aParam: Integer): string;
begin
  DataModule1.FDConnection.StartTransaction;
  try
    Result := DataModule1.FDConnection.ExecSQLScalar('SELECT DESCRICAO FROM PRODUTOS WHERE CODIGO = :CODIGO', [aParam]);

    if Result.IsEmpty then
      MessageDlg('Produto não encontrado!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

    DataModule1.FDConnection.Commit;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível buscar a Descrição do Produto:' + sLineBreak + E.Message);
    end;
  end;
end;

end.
