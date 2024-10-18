unit TesteWK.View.Pages.PedidoVenda;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.SysUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.NumberBox,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,
  Vcl.DBCtrls,
  Data.DB,
  TesteWK.Model.DAO.Clientes,
  TesteWK.Model.DAO.Produtos,
  TesteWK.Model.DAO.Pedido,
  TesteWK.Model.DAO.PedidoProduto,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TPagePedidoVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btCancelarPedido: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label3: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel24: TPanel;
    DBGrid1: TDBGrid;
    dsPedidoProduto: TDataSource;
    TablePedidoProduto: TFDMemTable;
    TablePedidoProdutoCODIGO: TIntegerField;
    TablePedidoProdutoDESCRICAO: TStringField;
    TablePedidoProdutoVALOR_UNITARIO: TFloatField;
    TablePedidoProdutoQUANTIDADE: TIntegerField;
    Panel25: TPanel;
    btAdicionar: TButton;
    TablePedidoProdutoVALOR_TOTAL: TFloatField;
    Label6: TLabel;
    btBuscarPedido: TButton;
    btGravarPedido: TButton;
    Panel26: TPanel;
    Panel27: TPanel;
    btNovoPedido: TButton;
    DBEditCodigoCliente: TDBEdit;
    TablePedido: TFDMemTable;
    dsPedido: TDataSource;
    TablePedidoCODIGO_CLIENTE: TIntegerField;
    TablePedidoNOME_CLIENTE: TStringField;
    TablePedidoNUMERO_PEDIDO: TIntegerField;
    TablePedidoDATA_EMISSAO: TDateField;
    DBEditNomeCliente: TDBEdit;
    DBEditDescricao: TDBEdit;
    DBEditCodigoProduto: TDBEdit;
    DBEditQuantidade: TDBEdit;
    DBEditValorUnitario: TDBEdit;
    DBEditNumeroPedido: TDBEdit;
    lblData_Atual: TLabel;
    DBEditTotal: TDBEdit;
    TablePedidoVALOR_TOTAL: TFloatField;
    TablePedidoProdutoNUMERO_PEDIDO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btGravarPedidoClick(Sender: TObject);
    procedure btNovoPedidoClick(Sender: TObject);
    procedure DBEditCodigoClienteExit(Sender: TObject);
    procedure DBEditCodigoProdutoExit(Sender: TObject);
    procedure btBuscarPedidoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    FDAOClientes : TModelDAOClientes;
    FDAOProdutos : TModelDAOProdutos;
    FDAOPedido : TModelDAOPedido;
    FDAOPedidoProduto : TModelDAOPedidoProduto;
    procedure Habilita_Campos;
    procedure Atualiza_Valor_Total;
  public
    { Public declarations }
  end;

var
  PagePedidoVenda: TPagePedidoVenda;
  FNumeroPedido : Integer;

implementation

{$R *.dfm}


procedure TPagePedidoVenda.FormShow(Sender: TObject);
begin
  TablePedido.Close;
  TablePedidoProduto.Close;
  lblData_Atual.Caption := DateToStr(Now);
  Habilita_Campos;
end;

procedure TPagePedidoVenda.btNovoPedidoClick(Sender: TObject);
begin
  TablePedido.Close;
  TablePedido.Open;
  TablePedidoProduto.Close;
  TablePedidoProduto.Open;
  Habilita_Campos;

  TablePedido.Append;
  TablePedido.FieldByName('NUMERO_PEDIDO').AsInteger := FDAOPedido.GetNumeroPedido;
  TablePedido.FieldByName('DATA_EMISSAO').AsDateTime := Now;
end;

procedure TPagePedidoVenda.Habilita_Campos;
begin
  if TablePedido.State = dsInactive then
  begin
    DBEditCodigoCliente.ReadOnly := True;
    DBEditDescricao.ReadOnly := True;
    DBEditCodigoProduto.ReadOnly := True;
    DBEditQuantidade.ReadOnly := True;
    DBEditValorUnitario.ReadOnly := True;
    btAdicionar.Enabled := False;
    btGravarPedido.Enabled := False;
    btBuscarPedido.Enabled := True;
    btCancelarPedido.Enabled := True;
  end
  else if TablePedido.State = dsBrowse then
  begin
    DBEditCodigoCliente.ReadOnly := False;
    DBEditDescricao.ReadOnly := False;
    DBEditCodigoProduto.ReadOnly := False;
    DBEditQuantidade.ReadOnly := False;
    DBEditValorUnitario.ReadOnly := False;
    DBEditCodigoCliente.SetFocus;
    btAdicionar.Enabled := True;
    btGravarPedido.Enabled := True;
    btBuscarPedido.Enabled := False;
    btCancelarPedido.Enabled := False;
  end;
end;

procedure TPagePedidoVenda.btAdicionarClick(Sender: TObject);
begin
  if TablePedidoProduto.State in [dsInsert, dsEdit] then
  begin
    TablePedidoProduto.FieldByName('NUMERO_PEDIDO').AsInteger := TablePedido.FieldByName('NUMERO_PEDIDO').AsInteger;
    TablePedidoProduto.FieldByName('VALOR_TOTAL').AsFloat := TablePedidoProduto.FieldByName('QUANTIDADE').AsInteger * TablePedidoProduto.FieldByName('VALOR_UNITARIO').AsFloat;
    TablePedidoProduto.Post;
    Atualiza_Valor_Total;
    TablePedidoProduto.Append;
  end;
end;

procedure TPagePedidoVenda.btBuscarPedidoClick(Sender: TObject);
var
  aNumero : Integer;
begin
  aNumero := StrToIntDef(Trim(InputBox('', 'Informe o Nº do Pedido', '')), 0);
  if aNumero > 0 then
  begin
    TablePedido.Close;
    TablePedidoProduto.Close;
    TablePedido.CopyDataSet(FDAOPedido.Get(aNumero));
    TablePedidoProduto.CopyDataSet(FDAOPedidoProduto.Get(aNumero));
  end;
end;

procedure TPagePedidoVenda.btCancelarPedidoClick(Sender: TObject);
begin
  if (not TablePedido.IsEmpty) and (not TablePedidoProduto.IsEmpty) then
  begin
    FDAOPedidoProduto.Delete(TablePedido.FieldByName('NUMERO_PEDIDO').AsInteger);
    FDAOPedido.Delete(TablePedido.FieldByName('NUMERO_PEDIDO').AsInteger);
    TablePedido.Close;
    TablePedidoProduto.Close;
    Habilita_Campos;
  end;
end;

procedure TPagePedidoVenda.btGravarPedidoClick(Sender: TObject);
begin
  if TablePedido.State in [dsInsert, dsEdit] then
    TablePedido.Post;

  if (not TablePedido.IsEmpty) and (not TablePedidoProduto.IsEmpty) then
  begin
    FDAOPedido.Insert(dsPedido);
    FDAOPedidoProduto.Insert(TablePedido.FieldByName('NUMERO_PEDIDO').AsInteger, dsPedidoProduto);
    TablePedido.Close;
    TablePedidoProduto.Close;
    Habilita_Campos;
  end;
end;

procedure TPagePedidoVenda.DBEditCodigoClienteExit(Sender: TObject);
begin
  if TablePedido.State in [dsEdit, dsInsert] then
  begin
    if TablePedido.FieldByName('CODIGO_CLIENTE').AsInteger > 0 then
    begin
      TablePedido.FieldByName('NOME_CLIENTE').AsString := FDAOClientes.GetNomeCliente(TablePedido.FieldByName('CODIGO_CLIENTE').AsInteger);

      if TablePedido.FieldByName('NOME_CLIENTE').AsString = '' then
        DBEditCodigoCliente.SetFocus
      else
        DBEditCodigoProduto.SetFocus;
    end;
  end;
end;

procedure TPagePedidoVenda.DBEditCodigoProdutoExit(Sender: TObject);
begin
  if TablePedidoProduto.State in [dsEdit, dsInsert] then
  begin
    if TablePedidoProduto.FieldByName('CODIGO').AsInteger > 0 then
    begin
      TablePedidoProduto.FieldByName('DESCRICAO').AsString := FDAOProdutos.GetDescricaoProduto(TablePedidoProduto.FieldByName('CODIGO').AsInteger);

      if TablePedidoProduto.FieldByName('DESCRICAO').AsString = '' then
        DBEditCodigoProduto.SetFocus
      else
        DBEditQuantidade.SetFocus;
    end;
  end;
end;

procedure TPagePedidoVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if (not TablePedido.IsEmpty) and (not TablePedidoProduto.IsEmpty) then
    begin
      if MessageDlg('Deseja realmente excluir este Item?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
      begin
        TablePedidoProduto.Delete;
        Atualiza_Valor_Total;
      end;
    end;
  end;
end;

procedure TPagePedidoVenda.Atualiza_Valor_Total;
var
  vTotal: Double;
begin
  vTotal := 0;
  TablePedidoProduto.First;
  while not TablePedidoProduto.Eof do
  begin
    vTotal := vTotal + TablePedidoProduto.FieldByName('VALOR_TOTAL').AsFloat;
    TablePedidoProduto.Next;
  end;
  TablePedido.FieldByName('VALOR_TOTAL').AsFloat := vTotal;
  DBEditCodigoProduto.SetFocus;
end;

procedure TPagePedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TablePedido.Close;
  TablePedido.Free;
  TablePedidoProduto.Close;
  TablePedidoProduto.Free;
end;

end.
