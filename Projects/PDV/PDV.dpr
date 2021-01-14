program PDV;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  MENU in 'MENU.pas' {FrmMenu},
  Usuarios in 'Cadastros\Usuarios.pas' {FrmUsuarios},
  Funcionarios in 'Cadastros\Funcionarios.pas' {FrmFuncionarios},
  Cargos in 'Cadastros\Cargos.pas' {FrmCargos},
  Modulo in 'Modulo.pas' {dm: TDataModule},
  Fornecedores in 'Cadastros\Fornecedores.pas' {FrmFornecedores},
  ImprimirBarras in 'Cadastros\ImprimirBarras.pas' {FrmImprimirBarras},
  Produtos in 'Cadastros\Produtos.pas' {FrmProdutos},
  EntradasProdutos in 'Estoque\EntradasProdutos.pas' {FrmEntradasProdutos},
  SaidasProdutos in 'Estoque\SaidasProdutos.pas' {FrmSaidasProdutos},
  EstoqueBaixo in 'Estoque\EstoqueBaixo.pas' {FrmEstoqueBaixo},
  Vendas in 'Movimenta��es\Vendas.pas' {FrmVendas},
  CancelarItem in 'Movimenta��es\CancelarItem.pas' {FrmCancelarItem},
  Movimentacoes in 'Movimenta��es\Movimentacoes.pas' {FrmMovimentacoes},
  FormaPagamento in 'Movimenta��es\FormaPagamento.pas' {FrmPagamento},
  VendaDireta in 'Movimenta��es\VendaDireta.pas' {FrmVendaDireta},
  Gastos in 'Movimenta��es\Gastos.pas' {FrmGastos},
  ListaVendas in 'Movimenta��es\ListaVendas.pas' {FrmListaVendas},
  CertificadoDigital in 'Movimenta��es\CertificadoDigital.pas' {FrmCertificado},
  DadosEmitente in 'Relatorios\DadosEmitente.pas' {FrmDadosEmitente},
  Caixa in 'Movimenta��es\Caixa.pas' {FrmCaixa},
  AreaAdm in 'Movimenta��es\AreaAdm.pas' {FrmAreaAdm},
  FluxoCaixa in 'Movimenta��es\FluxoCaixa.pas' {FrmFluxoCaixa},
  RelatoriosPorDatas in 'Relatorios\RelatoriosPorDatas.pas' {FrmRelDatas},
  DadosComprovante in 'Relatorios\DadosComprovante.pas' {FrmDadosComprov},
  ExcluirDados in 'Ferramentas\ExcluirDados.pas' {FrmExcluirDados},
  Gaveta in 'Cadastros\Gaveta.pas' {FrmGaveta},
  uRegistro in 'uRegistro.pas' {FrmRegistro},
  DiretaEmbutida in 'Movimenta��es\DiretaEmbutida.pas' {FrmVendaEmbutida},
  BuscarProduto in 'Movimenta��es\BuscarProduto.pas' {FrmBuscarProduto},
  RetiradaCaixa in 'Movimenta��es\RetiradaCaixa.pas' {FrmRetiradaCaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmFornecedores, FrmFornecedores);
  Application.CreateForm(TFrmImprimirBarras, FrmImprimirBarras);
  Application.CreateForm(TFrmProdutos, FrmProdutos);
  Application.CreateForm(TFrmEntradasProdutos, FrmEntradasProdutos);
  Application.CreateForm(TFrmSaidasProdutos, FrmSaidasProdutos);
  Application.CreateForm(TFrmEstoqueBaixo, FrmEstoqueBaixo);
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TFrmCancelarItem, FrmCancelarItem);
  Application.CreateForm(TFrmMovimentacoes, FrmMovimentacoes);
  Application.CreateForm(TFrmPagamento, FrmPagamento);
  Application.CreateForm(TFrmVendaDireta, FrmVendaDireta);
  Application.CreateForm(TFrmGastos, FrmGastos);
  Application.CreateForm(TFrmListaVendas, FrmListaVendas);
  Application.CreateForm(TFrmCertificado, FrmCertificado);
  Application.CreateForm(TFrmDadosEmitente, FrmDadosEmitente);
  Application.CreateForm(TFrmCaixa, FrmCaixa);
  Application.CreateForm(TFrmAreaAdm, FrmAreaAdm);
  Application.CreateForm(TFrmFluxoCaixa, FrmFluxoCaixa);
  Application.CreateForm(TFrmRelDatas, FrmRelDatas);
  Application.CreateForm(TFrmDadosComprov, FrmDadosComprov);
  Application.CreateForm(TFrmExcluirDados, FrmExcluirDados);
  Application.CreateForm(TFrmGaveta, FrmGaveta);
  Application.CreateForm(TFrmRegistro, FrmRegistro);
  Application.CreateForm(TFrmVendaEmbutida, FrmVendaEmbutida);
  Application.CreateForm(TFrmBuscarProduto, FrmBuscarProduto);
  Application.CreateForm(TFrmBuscarProduto, FrmBuscarProduto);
  Application.CreateForm(TFrmBuscarProduto, FrmBuscarProduto);
  Application.CreateForm(TFrmRetiradaCaixa, FrmRetiradaCaixa);
  Application.Run;
end.
