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
  Vendas in 'Movimentações\Vendas.pas' {FrmVendas},
  CancelarItem in 'Movimentações\CancelarItem.pas' {FrmCancelarItem},
  Movimentacoes in 'Movimentações\Movimentacoes.pas' {FrmMovimentacoes},
  FormaPagamento in 'Movimentações\FormaPagamento.pas' {FrmPagamento},
  VendaDireta in 'Movimentações\VendaDireta.pas' {FrmVendaDireta},
  Gastos in 'Movimentações\Gastos.pas' {FrmGastos},
  ListaVendas in 'Movimentações\ListaVendas.pas' {FrmListaVendas},
  CertificadoDigital in 'Movimentações\CertificadoDigital.pas' {FrmCertificado},
  DadosEmitente in 'Relatorios\DadosEmitente.pas' {FrmDadosEmitente},
  Caixa in 'Movimentações\Caixa.pas' {FrmCaixa},
  AreaAdm in 'Movimentações\AreaAdm.pas' {FrmAreaAdm},
  FluxoCaixa in 'Movimentações\FluxoCaixa.pas' {FrmFluxoCaixa},
  RelatoriosPorDatas in 'Relatorios\RelatoriosPorDatas.pas' {FrmRelDatas},
  DadosComprovante in 'Relatorios\DadosComprovante.pas' {FrmDadosComprov},
  ExcluirDados in 'Ferramentas\ExcluirDados.pas' {FrmExcluirDados},
  Gaveta in 'Cadastros\Gaveta.pas' {FrmGaveta},
  uRegistro in 'uRegistro.pas' {FrmRegistro},
  DiretaEmbutida in 'Movimentações\DiretaEmbutida.pas' {FrmVendaEmbutida},
  BuscarProduto in 'Movimentações\BuscarProduto.pas' {FrmBuscarProduto},
  RetiradaCaixa in 'Movimentações\RetiradaCaixa.pas' {FrmRetiradaCaixa};

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
