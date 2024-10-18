unit TesteWK.Model.DAO.PedidoProduto;

interface

uses
  Data.DB,
  System.SysUtils,
  System.UITypes,
  Vcl.Dialogs,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  TesteWK.Model.Components.Connection.FireDAC;

type

  TModelDAOPedidoProduto = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    procedure Insert (aNumeroPedido : Integer; aDataSource : TDataSource);
    procedure Delete (aNumeroPedido : Integer);
    function Get (aNumeroPedido : Integer) : TDataSet;
  end;

implementation

{ TModelDAOPedidoProduto }


constructor TModelDAOPedidoProduto.Create;
begin

end;

destructor TModelDAOPedidoProduto.Destroy;
begin

  inherited;
end;

procedure TModelDAOPedidoProduto.Insert(aNumeroPedido : Integer; aDataSource : TDataSource);
begin
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('INSERT INTO PEDIDO_PRODUTO (NUMERO_PEDIDO, CODIGO_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL)');
    DataModule1.FDQuery.SQL.Add('VALUES (:NUMERO_PEDIDO, :CODIGO_PRODUTO, :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL)');

    aDataSource.DataSet.First;
    while not aDataSource.DataSet.Eof do
    begin
      DataModule1.FDQuery.ParamByName('NUMERO_PEDIDO').AsInteger := aNumeroPedido;
      DataModule1.FDQuery.ParamByName('CODIGO_PRODUTO').AsInteger := aDataSource.DataSet.FieldByName('CODIGO').AsInteger;
      DataModule1.FDQuery.ParamByName('QUANTIDADE').AsInteger := aDataSource.DataSet.FieldByName('QUANTIDADE').AsInteger;
      DataModule1.FDQuery.ParamByName('VALOR_UNITARIO').AsFloat := aDataSource.DataSet.FieldByName('VALOR_UNITARIO').AsFloat;
      DataModule1.FDQuery.ParamByName('VALOR_TOTAL').AsFloat := aDataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
      DataModule1.FDQuery.ExecSQL;
      aDataSource.DataSet.Next;
    end;

    DataModule1.FDConnection.Commit;
    MessageDlg('Pedido de Venda de Nº ' + aNumeroPedido.ToString + ' inserido com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;;
      raise Exception.Create('Não foi possível Gravar os Itens do Pedido:' + sLineBreak + E.Message);
    end;
  end;
end;

procedure TModelDAOPedidoProduto.Delete(aNumeroPedido: Integer);
begin
  DataModule1.FDConnection.StartTransaction;
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('DELETE FROM PEDIDO_PRODUTO WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO');
    DataModule1.FDQuery.ParamByName('NUMERO_PEDIDO').AsInteger := aNumeroPedido;
    DataModule1.FDQuery.ExecSQL;
    // não dou Commit pois ainda falta deletar a PEDIDO
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível Cancelar os Produtos do Pedido:' + sLineBreak + E.Message);
    end;
  end;
end;

function TModelDAOPedidoProduto.Get(aNumeroPedido: Integer): TDataSet;
begin
  DataModule1.FDConnection.StartTransaction;
  try
    DataModule1.FDQuery.Close;
    DataModule1.FDQuery.SQL.Clear;
    DataModule1.FDQuery.SQL.Add('SELECT');
    DataModule1.FDQuery.SQL.Add('PRODUTOS.CODIGO,');
    DataModule1.FDQuery.SQL.Add('PRODUTOS.DESCRICAO,');
    DataModule1.FDQuery.SQL.Add('PEDIDO_PRODUTO.NUMERO_PEDIDO,');
    DataModule1.FDQuery.SQL.Add('PEDIDO_PRODUTO.QUANTIDADE,');
    DataModule1.FDQuery.SQL.Add('PEDIDO_PRODUTO.VALOR_UNITARIO,');
    DataModule1.FDQuery.SQL.Add('PEDIDO_PRODUTO.VALOR_TOTAL');
    DataModule1.FDQuery.SQL.Add('FROM PEDIDO_PRODUTO');
    DataModule1.FDQuery.SQL.Add('JOIN PRODUTOS ON PRODUTOS.CODIGO = PEDIDO_PRODUTO.CODIGO_PRODUTO');
    DataModule1.FDQuery.SQL.Add('WHERE PEDIDO_PRODUTO.NUMERO_PEDIDO = :NUMERO_PEDIDO');
    DataModule1.FDQuery.ParamByName('NUMERO_PEDIDO').AsInteger := aNumeroPedido;
    DataModule1.FDQuery.Open;

    if DataModule1.FDQuery.IsEmpty then
      raise Exception.Create('Produto não encontrado!');

    Result := DataModule1.FDQuery;
    DataModule1.FDConnection.Commit;
  except
    on E: Exception do
    begin
      DataModule1.FDConnection.Rollback;
      raise Exception.Create('Não foi possível buscar os Produtos do Pedido:' + sLineBreak + E.Message);
    end;
  end;
end;

end.
