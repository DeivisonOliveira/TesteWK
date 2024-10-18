unit TesteWK.Model.DAO.Pedido;

interface

uses
  Data.DB,
  System.UITypes,
  Vcl.Forms,
  Vcl.Dialogs,
  System.SysUtils,
  FireDAC.Stan.Param,
  TesteWK.Model.Components.Connection.FireDAC;

type

  TModelDAOPedido = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    procedure Insert (aDataSource : TDataSource);
    procedure Delete (aNumeroPedido : Integer);
    function Get (aNumeroPedido : Integer) : TDataSet;
    function GetNumeroPedido : Integer;
  end;

implementation


{ TModelDAOPedido }

constructor TModelDAOPedido.Create;
begin

end;

destructor TModelDAOPedido.Destroy;
begin

  inherited;
end;

procedure TModelDAOPedido.Insert (aDataSource : TDataSource);
begin
  DataModule1.FDConnection.StartTransaction;
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('INSERT INTO PEDIDO (NUMERO_PEDIDO, DATA_EMISSAO, VALOR_TOTAL, CODIGO_CLIENTE)');
    DataModule1.FDQuery.SQL.Add('VALUES (:NUMERO_PEDIDO, :DATA_EMISSAO, :VALOR_TOTAL, :CODIGO_CLIENTE)');
    DataModule1.FDQuery.ParamByName('NUMERO_PEDIDO').AsInteger := aDataSource.DataSet.FieldByName('NUMERO_PEDIDO').AsInteger;
    DataModule1.FDQuery.ParamByName('DATA_EMISSAO').AsDateTime := aDataSource.DataSet.FieldByName('DATA_EMISSAO').AsDateTime;
    DataModule1.FDQuery.ParamByName('VALOR_TOTAL').AsFloat := aDataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
    DataModule1.FDQuery.ParamByName('CODIGO_CLIENTE').AsInteger := aDataSource.DataSet.FieldByName('CODIGO_CLIENTE').AsInteger;
    DataModule1.FDQuery.ExecSQL;
    // não dou Commit pois ainda falta inserir a PEDIDO_PRODUTO
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível Gravar o Pedido:' + sLineBreak + E.Message);
    end;
  end;
end;

procedure TModelDAOPedido.Delete(aNumeroPedido: Integer);
begin
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('DELETE FROM PEDIDO WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO');
    DataModule1.FDQuery.ParamByName('NUMERO_PEDIDO').AsInteger := aNumeroPedido;
    DataModule1.FDQuery.ExecSQL;
    DataModule1.FDConnection.Commit;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível Cancelar o Pedido:' + sLineBreak + E.Message);
    end;
  end;
end;

function TModelDAOPedido.Get(aNumeroPedido: Integer): TDataSet;
begin
  DataModule1.FDConnection.StartTransaction;
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('SELECT');
    DataModule1.FDQuery.SQL.Add('PEDIDO.NUMERO_PEDIDO,');
    DataModule1.FDQuery.SQL.Add('PEDIDO.CODIGO_CLIENTE,');
    DataModule1.FDQuery.SQL.Add('CLIENTES.NOME AS NOME_CLIENTE,');
    DataModule1.FDQuery.SQL.Add('PEDIDO.DATA_EMISSAO,');
    DataModule1.FDQuery.SQL.Add('PEDIDO.VALOR_TOTAL');
    DataModule1.FDQuery.SQL.Add('FROM PEDIDO');
    DataModule1.FDQuery.SQL.Add('JOIN CLIENTES ON CLIENTES.CODIGO = PEDIDO.CODIGO_CLIENTE');
    DataModule1.FDQuery.SQL.Add('WHERE PEDIDO.NUMERO_PEDIDO = :NUMERO_PEDIDO');
    DataModule1.FDQuery.ParamByName('NUMERO_PEDIDO').AsInteger := aNumeroPedido;
    DataModule1.FDQuery.Open;

    if DataModule1.FDQuery.IsEmpty then
      raise Exception.Create('Pedido não encontrado!');

    Result := DataModule1.FDQuery;
    DataModule1.FDConnection.Commit;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível buscar o Pedido:' + sLineBreak + E.Message);
    end;
  end;
end;

function TModelDAOPedido.GetNumeroPedido: Integer;
begin
  DataModule1.FDConnection.StartTransaction;
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('SELECT MAX(NUMERO_PEDIDO) AS NUMERO_PEDIDO FROM PEDIDO');
    DataModule1.FDQuery.Open;
    Result := DataModule1.FDQuery.FieldByName('NUMERO_PEDIDO').AsInteger + 1;
    DataModule1.FDConnection.Commit;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Falha na consulta:' + sLineBreak + E.Message);
    end;
  end;
end;

end.
