program TesteWK;

uses
  Vcl.Forms,
  TesteWK.View.Pages.PedidoVenda in 'View\Pages\TesteWK.View.Pages.PedidoVenda.pas' {PagePedidoVenda},
  TesteWK.Model.Components.Connection.FireDAC in 'Model\Components\Connection\TesteWK.Model.Components.Connection.FireDAC.pas' {DataModule1: TDataModule},
  TesteWK.Model.DAO.Clientes in 'Model\DAO\TesteWK.Model.DAO.Clientes.pas',
  TesteWK.Model.Behaviors in 'Model\Behaviors\TesteWK.Model.Behaviors.pas',
  TesteWK.Model.DAO.Produtos in 'Model\DAO\TesteWK.Model.DAO.Produtos.pas',
  TesteWK.Model.DAO.Pedido in 'Model\DAO\TesteWK.Model.DAO.Pedido.pas',
  TesteWK.Model.DAO.PedidoProduto in 'Model\DAO\TesteWK.Model.DAO.PedidoProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPagePedidoVenda, PagePedidoVenda);
  Application.Run;
end.
