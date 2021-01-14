unit MENU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ACBrUtil, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, ShellApi;

type
  TFrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Ca1: TMenuItem;
    Produtos1: TMenuItem;
    Fornecedores1: TMenuItem;
    Movimentaes1: TMenuItem;
    Produtos2: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Usurios1: TMenuItem;
    Funcionrios1: TMenuItem;
    Cargos1: TMenuItem;
    EntradasdeProdutos1: TMenuItem;
    NvelBaixo1: TMenuItem;
    Vendas1: TMenuItem;
    Movimentaes2: TMenuItem;
    Gastos1: TMenuItem;
    ConsultarVendas1: TMenuItem;
    VendaDireta1: TMenuItem;
    CertificadoDigital1: TMenuItem;
    DadosEmitente1: TMenuItem;
    Sair2: TMenuItem;
    DadosParaComprovante1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    FluxodeMovimentacoes1: TMenuItem;
    SaidasdeProdutos1: TMenuItem;
    RelatriodeProdutos1: TMenuItem;
    Ferramentas1: TMenuItem;
    BackupdoBanco1: TMenuItem;
    ExcluirDadosVendas1: TMenuItem;
    ExcluirDadosdoCaixa1: TMenuItem;
    grid_caixa: TDBGrid;
    grid_vendas: TDBGrid;
    Panel1: TPanel;
    lblHora: TLabel;
    Label1: TLabel;
    lblData: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    lblCargo: TLabel;
    lblUsuario: TLabel;
    Label5: TLabel;
    Image3: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblEntradas: TLabel;
    lblSaidas: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    lblEstoque: TLabel;
    Image4: TImage;
    Label13: TLabel;
    lblCaixaAberto: TLabel;
    lblSaldo: TLabel;
    pnlEstoque: TPanel;
    Image6: TImage;
    Image11: TImage;
    Timer1: TTimer;
    Image5: TImage;
    Label10: TLabel;
    Image7: TImage;
    Label11: TLabel;
    RelatrioporStatusdaVenda1: TMenuItem;
    ExcluirdadosMovimentaces1: TMenuItem;
    Timer2: TTimer;
    btnVoltarPdv: TButton;
    procedure Usurios1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure EntradasdeProdutos1Click(Sender: TObject);

    procedure NvelBaixo1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Movimentaes2Click(Sender: TObject);
    procedure VendaDireta1Click(Sender: TObject);
    procedure Gastos1Click(Sender: TObject);
    procedure ConsultarVendas1Click(Sender: TObject);
    procedure CertificadoDigital1Click(Sender: TObject);
    procedure DadosEmitente1Click(Sender: TObject);
    procedure FluxodeCaixa1Click(Sender: TObject);
    procedure DadosParaComprovante1Click(Sender: TObject);
    procedure FluxodeMovimentacoes1Click(Sender: TObject);



    procedure SaidasdeProdutos1Click(Sender: TObject);
    procedure RelatriodeProdutos1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
      procedure formatarGrid;
    procedure Timer1Timer(Sender: TObject);
    procedure totalizarEntradas;
    procedure totalizarSaidas;
    procedure totalizar;
    procedure FormActivate(Sender: TObject);
    procedure totalizarCaixa;
    procedure verificarEstoque;
    procedure pnlEstoqueClick(Sender: TObject);
    procedure lblEstoqueClick(Sender: TObject);
    procedure listarCaixa;
    procedure RelatrioporStatusdaVenda1Click(Sender: TObject);
    procedure ExcluirDadosVendas1Click(Sender: TObject);
    procedure ExcluirDadosdoCaixa1Click(Sender: TObject);
    procedure ExcluirdadosMovimentaces1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BackupdoBanco1Click(Sender: TObject);
    procedure btnVoltarPdvClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;
  totEntradas : double;
  totSaidas : double;
 backup_bd : boolean;
totCaixa : integer;

 

implementation

{$R *.dfm}

uses Usuarios, Funcionarios, Cargos, Modulo, Fornecedores, Produtos,
  EntradasProdutos, SaidasProdutos, EstoqueBaixo, Vendas, Movimentacoes,
  VendaDireta, Gastos, ListaVendas, CertificadoDigital, DadosEmitente,
  FluxoCaixa, DadosComprovante, RelatoriosPorDatas, ExcluirDados, Caixa;

  //FUN��O PARA CONVERTER EM RGB

  function ConverterRBG(r, g, b: byte) : tColor;
   begin
     Result := RGB(r, g , b)
   end;

procedure TFrmMenu.totalizarCaixa;

begin
dm.query_cor_caixa.Close;
dm.query_cor_caixa.SQL.Clear;
dm.query_cor_caixa.SQL.Add('Select * from caixa where data_abertura = curDate() and status = "Aberto"');
dm.query_cor_caixa.Open;
totCaixa := dm.query_cor_caixa.RecordCount;
lblCaixaAberto.Caption := FloatToStr(totCaixa);
end;

procedure TFrmMenu.BackupdoBanco1Click(Sender: TObject);
var
caminhoBd : string;
caminhoDump : string;
nome : string;

begin
 //BACKUP
  backup_bd := true;
  nome := FormatDateTime('dd-mm-yyyy',now);
  caminhoBd := GetCurrentDir + '\bd\';
  caminhoDump := GetCurrentDir + '\bd\mysqldump.exe';
  caminhoBd := caminhoBd + nome + '.sql';
 // messageDlg(caminhobd,mtInformation, mbOKCancel, 0);
   //local
  ShellExecute(handle,'open', 'cmd.exe',Pchar('/c' + caminhoDump + ' pdv -u root -hlocalhost -p --opt -v> ' + caminhoBd),nil, SW_SHOW );

  //rede
  // ShellExecute(handle,'open', 'cmd.exe',Pchar('/c' + caminhoDump + ' lojao1realpdv -u bruno_pdv1real -hmysql873.umbler.com:41890 -pjesuscristo --opt -v> ' + caminhoBd),nil, SW_SHOW );
  end;

procedure TFrmMenu.btnVoltarPdvClick(Sender: TObject);
begin
 teste := 'teste';
 FrmMenu.Close;

end;

procedure TFrmMenu.Button1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmMenu.Cargos1Click(Sender: TObject);
begin
    FrmCargos := TFrmCargos.create(self);
    FrmCargos.ShowModal;
end;
                //AO ABRIR O MENU
               //AO ABRIR O MENU
                //AO ABRIR O MENU
                 //AO ABRIR O MENU
procedure TFrmMenu.CertificadoDigital1Click(Sender: TObject);
var
addLinha: boolean;
i: integer;
serie: string;

caminhoNFCE: string;
begin

FrmCertificado := TFrmCertificado.Create(self);

try

  //APONTANDO PARA A PASTA ONDE ESTAO OS COMPONENTES NFCE
  caminhoNFCE := ExtractFilePath(Application.ExeName) + 'nfe\';
  FrmVendas.nfce.Configuracoes.Arquivos.PathSchemas := caminhoNFCE;

  FrmVendas.nfce.SSL.LerCertificadosStore;
  //vendadireta
  FrmVendaDireta.nfce.Configuracoes.Arquivos.PathSchemas := caminhoNFCE;

  FrmVendaDireta.nfce.SSL.LerCertificadosStore;


  addLinha := true;

  with FrmCertificado.StringGrid1 do
  begin
     ColWidths[0] := 220;
     ColWidths[1] := 250;
     ColWidths[2] := 120;
     ColWidths[3] := 80;
     ColWidths[4] := 150;

     Cells[0,0] := 'Num S�rie';
     Cells[1,0] := 'Raz�o Social';
     Cells[2,0] := 'CNPJ';
     Cells[3,0] := 'Validade';
     Cells[4,0] := 'Certificadora';

  end;

  for i := 0 to FrmVendas.nfce.SSL.ListaCertificados.Count -1 do
  begin

  with FrmVendas.nfce.SSL.ListaCertificados[i] do
  begin
  serie := NumeroSerie;


  with FrmCertificado.StringGrid1 do
  begin

  if addLinha then
  begin

     RowCount := RowCount + 1;


     Cells[0, RowCount - 1] := NumeroSerie;
     Cells[1, RowCount - 1] := RazaoSocial;
     Cells[2, RowCount - 1] := CNPJ;
     Cells[3, RowCount - 1] := FormatDateBr(DataVenc);
     Cells[4, RowCount - 1] := Certificadora;
     addLinha := true;

  end;




  end;


  end;
end;

// VENDA DIRETA
  for i := 0 to FrmVendaDireta.nfce.SSL.ListaCertificados.Count -1 do
  begin

  with FrmVendaDireta.nfce.SSL.ListaCertificados[i] do
  begin
  serie := NumeroSerie;


  with FrmCertificado.StringGrid1 do
  begin

  if addLinha then
  begin

     RowCount := RowCount + 1;


     Cells[0, RowCount - 1] := NumeroSerie;
     Cells[1, RowCount - 1] := RazaoSocial;
     Cells[2, RowCount - 1] := CNPJ;
     Cells[3, RowCount - 1] := FormatDateBr(DataVenc);
     Cells[4, RowCount - 1] := Certificadora;
     addLinha := true;

  end;




  end;


  end;

end;

    FrmCertificado.ShowModal;
    if FrmCertificado.ModalResult = mrOk then
    begin
      certificadoDig := FrmCertificado.StringGrid1.Cells[0, FrmCertificado.StringGrid1.Row];

    end;

     FrmVendas.nfce.Configuracoes.Certificados.NumeroSerie := certificadoDig;
     FrmVendas.nfce.WebServices.StatusServico.Executar;
     ShowMessage(certificadoDig);
      ShowMessage(FrmVendas.nfce.WebServices.StatusServico.Msg);

    //VENDA DIRETA
     FrmVendaDireta.nfce.Configuracoes.Certificados.NumeroSerie := certificadoDig;
     FrmVendaDireta.nfce.WebServices.StatusServico.Executar;
     ShowMessage(certificadoDig);
     ShowMessage(FrmVendaDireta.nfce.WebServices.StatusServico.Msg);






    finally
    FrmCertificado.Free;
    end;
end;



procedure TFrmMenu.ConsultarVendas1Click(Sender: TObject);
begin
FrmListaVendas := TFrmListaVendas.create(self);
FrmListaVendas.ShowModal;
end;

procedure TFrmMenu.DadosEmitente1Click(Sender: TObject);
begin
FrmDadosEmitente := TFrmDadosEmitente.Create(self);
FrmDadosEmitente.ShowModal;
end;

procedure TFrmMenu.DadosParaComprovante1Click(Sender: TObject);
begin
 FrmDadosComprov := TFrmDadosComprov.create(self);
 FrmDadosComprov.ShowModal;

end;

procedure TFrmMenu.EntradasdeProdutos1Click(Sender: TObject);
begin
 FrmEntradasProdutos := TFrmEntradasProdutos.create(self);
 FrmEntradasProdutos.ShowModal;
end;

procedure TFrmMenu.ExcluirDadosdoCaixa1Click(Sender: TObject);
begin
if backup_bd = true then
 begin
 excluir := 'Caixa';
 FrmExcluirDados := TFrmExcluirDados.create(self);
 FrmExcluirDados.ShowModal;
 end
   else
      begin
        messageDlg('Para apagar os dados � necess�rio fazer um Backup primeiro.', mtWarning, mbOKCancel,0);
      end;
end;

procedure TFrmMenu.ExcluirdadosMovimentaces1Click(Sender: TObject);
begin
if backup_bd = true then
   begin
     excluir := 'Movimentacoes';
     FrmExcluirDados := TFrmExcluirDados.create(self);
     FrmExcluirDados.ShowModal;
   end
    else
      begin
        messageDlg('Para apagar os dados � necess�rio fazer um Backup primeiro.', mtWarning, mbOKCancel,0);
      end;
end;

procedure TFrmMenu.ExcluirDadosVendas1Click(Sender: TObject);
begin
if backup_bd = true then
 begin
 excluir := 'Vendas';
 FrmExcluirDados := TFrmExcluirDados.create(self);
 FrmExcluirDados.ShowModal;
 end
    else
      begin
        messageDlg('Para apagar os dados � necess�rio fazer um Backup primeiro.', mtWarning, mbOKCancel,0);
      end;
end;

procedure TFrmMenu.FluxodeCaixa1Click(Sender: TObject);
begin
FrmFluxoCaixa := TFrmFluxoCaixa.create(self);
  FrmFluxoCaixa.ShowModal;
end;

procedure TFrmMenu.FluxodeMovimentacoes1Click(Sender: TObject);
begin
  rel := 'Movimentacoes';
 FrmRelDatas := TFrmRelDatas.create(self);
 FrmRelDatas.ShowModal;
end;

procedure TFrmMenu.FormActivate(Sender: TObject);
begin

totalizarEntradas;
totalizarSaidas;
totalizar;

totalizarCaixa;
verificarEstoque;

 // formatarGrid;

    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
    dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data = curDate() order by id desc');
    dm.query_mov.Open;

    formatarGrid;

    //
    listarCaixa;


end;

procedure TFrmMenu.formatarGrid;
begin

 grid_Vendas.Columns.Items[0].Title.Caption := 'Id';
grid_Vendas.Columns.Items[0].Visible := false;

grid_Vendas.Columns.Items[1].FieldName := 'tipo';
grid_Vendas.Columns.Items[1].Title.caption := 'Tipo';
grid_Vendas.Columns.Items[1].Width := 70;

grid_Vendas.Columns.Items[2].FieldName := 'movimento';
grid_Vendas.Columns.Items[2].Title.Caption := 'Movimento';
grid_Vendas.Columns[2].Alignment := taCenter;
//gridVendas.Columns.Items[2].Width := 60;

grid_Vendas.Columns[3].Alignment := taLeftJustify;  //Alinhar
grid_Vendas.Columns.Items[3].Title.Caption := 'Desconto';
grid_Vendas.Columns.Items[3].Width := 80;


//gridVendas.Columns.Items[3].FieldName := 'valor';
grid_Vendas.Columns.Items[4].Title.Caption := 'Valor';
grid_Vendas.Columns[4].Alignment := taLeftJustify;


grid_Vendas.Columns.Items[5].Title.Caption := 'Metodo';
grid_Vendas.Columns[5].Alignment := taCenter;

 grid_Vendas.Columns.Items[6].FieldName := 'status';
grid_Vendas.Columns.Items[6].Title.Caption := 'Status';
grid_Vendas.Columns.Items[6].Width := 70;

grid_Vendas.Columns.Items[7].FieldName := 'valor_pago';
grid_Vendas.Columns.Items[7].Title.Caption := 'Valor_Recebido';
grid_Vendas.Columns.Items[7].Visible := false;

grid_Vendas.Columns.Items[8].FieldName := 'troco';
grid_Vendas.Columns.Items[8].Title.Caption := 'Troco';
grid_Vendas.Columns.Items[8].Visible := false;

grid_Vendas.Columns[8].Alignment := taLeftJustify;


grid_Vendas.Columns.Items[9].FieldName := 'funcionario';
grid_Vendas.Columns.Items[9].Title.Caption := 'Funcionario';
grid_Vendas.Columns.Items[9].Width := 72;

grid_Vendas.Columns.Items[10].Title.Caption := 'Data';
grid_Vendas.Columns.Items[11].Title.Caption := 'Hora';
grid_Vendas.Columns.Items[12].Title.Caption := 'Num_Venda';
grid_Vendas.Columns.Items[12].Visible := false;
//grid_Vendas.Columns[12].Alignment := taCenter;

 TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
    TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';
end;

procedure TFrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  

    if nomeFunc = 'Administrador' then
    begin
       if messageDlg('Deseja imprimir as vendas do dia?',mtInformation, mbYESNO,0) = mrYES then
       begin

          ShowMessage('Imprimindo as vendas de hoje feita pelo Administrador');

          dm.query_mov.Close;
          dm.query_mov.SQL.Clear;
          dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data = curDate() and status = "Cancelada"');
          dm.query_mov.Open;

         if dm.query_mov.IsEmpty then
           begin
            dm.query_mov.Close;
            dm.query_mov.SQL.clear;
            dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where funcionario = :func and data = curDate() order by hora asc');
            dm.query_mov.ParamByName('func').Value := NomeFunc;
            dm.query_mov.Open;

            (*
            dm.rel_Mov_Dinheiro.Close;
            dm.rel_Mov_Dinheiro.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
            dm.rel_Mov_Dinheiro.SQL.Add('Select sum(valor) as total FROM movimentacoes where data = curDate() and metodo = :metodo and funcionario = :func');
            dm.rel_Mov_Dinheiro.ParamByName('metodo').Value := 'Dinheiro';
              dm.rel_Mov_Dinheiro.ParamByName('func').Value := nomeFunc;
            dm.rel_Mov_Dinheiro.Prepare;
            dm.rel_Mov_Dinheiro.open;
            totalDinheiro := dm.rel_Mov_Dinheiro.FieldByName('total').AsFloat;

            dm.rel_Mov_Cartao.Close;
            dm.rel_Mov_Cartao.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
            dm.rel_Mov_Cartao.SQL.Add('Select sum(valor) as total FROM movimentacoes where data = curDate() and metodo = :metodo and funcionario = :func');
            dm.rel_Mov_Cartao.ParamByName('metodo').Value := 'Cart�o';
              dm.rel_Mov_Cartao.ParamByName('func').Value := nomeFunc;
            dm.rel_Mov_Cartao.Prepare;
            dm.rel_Mov_Cartao.open;
            totalCartao := dm.rel_Mov_Cartao.FieldByName('total').AsFloat;

            (*dm.query_caixa.Close;
            dm.query_caixa.SQL.clear;
            dm.query_caixa.SQL.Add('SELECT * FROM movimentacoes where funcionario = :func and data = curDate() order by hora asc');
            dm.query_caixa.ParamByName('func').Value := NomeFunc;
            dm.query_caixa.Open;
            dm.rel_caixa.LoadFromFile(GetCurrentDir + '/rel/fimdia.fr3');

            conversaodinheiro := FloatToStr(totalDinheiro);
            conversaocartao := FloatToStr(totalCartao);
            //dm.rel_comprovante.Variables['totalDinheiro']:= lblHora.Caption;
            dm.rel_caixa.Variables['totCartao'] := QuotedStr(conversaocartao);
            dm.rel_caixa.Variables['totDinheiro'] := QuotedStr(conversaodinheiro); *)




             dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/teste3.fr3');
            dm.rel_comprovante.PrintOptions.ShowDialog := false;
              //dm.rel_caixa.ShowReport();
            dm.rel_comprovante.PrepareReport;

            dm.rel_comprovante.Print;
           end
             else
                begin
                   dm.query_mov.Close;
                  dm.query_mov.SQL.clear;
                  dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where funcionario = :func and data = curDate() and status = "Conclu�da" order by hora asc');
                  dm.query_mov.ParamByName('func').Value := NomeFunc;
                  dm.query_mov.Open;

                  dm.query_canc.Close;
                  dm.query_canc.SQL.clear;
                  dm.query_canc.SQL.Add('SELECT * FROM movimentacoes where funcionario = :func and data = curDate() and status = "Cancelada" order by hora asc');
                  dm.query_canc.ParamByName('func').Value := NomeFunc;
                  dm.query_canc.Open;


                  dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/fimdiacanc.fr3');
                 // dm.rel_comprovante.Variables['tot'] := totalzao;
                  dm.rel_comprovante.PrintOptions.ShowDialog := false;
                  dm.rel_comprovante.PrepareReport;
                  dm.rel_comprovante.Print;
                 
                end;




       end;

    end;




    if teste = 'teste' then
      begin
        exit;
      end;
 //VERIFICAR STATUS DO CAIXA
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num ');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := numCaixa;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin

          MessageDlg('Voc� n�o pode fechar com o caixa aberto!!!',mtInformation,mbOKCancel,0);

          Action := caNone;
        end;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
//NIVEL DE USUARIO

    btnVoltarPdv.Visible := false;
      if areaAdministrativa = 'Gerenciar' then
       begin
            btnVoltarPdv.Visible := true;
            areaAdministrativa := '';

       end;

      if cargoUsuario = 'Admin' then
      begin
       ExcluirDadosVendas1.Enabled := true;
       ExcluirDadosdoCaixa1.Enabled := true;
       ExcluirdadosMovimentaces1.enabled := true;
       Usurios1.Enabled := true;
       Ca1.Enabled := true;

       VendaDireta1.Enabled := false;
       Produtos2.Enabled := true;
       Relatrios1.Enabled := true;
       FluxodeCaixa1.enabled := true;
      end;

       if cargoUsuario = 'Gerente' then
      begin
       Ca1.Enabled := true;
       Fornecedores1.Enabled := false;
       Funcionrios1.Enabled := false;
       Cargos1.Enabled := false;
       Produtos1.Enabled := true;
       Vendas1.Enabled := false;
        Produtos2.Enabled := true;
       VendaDireta1.Enabled := false;
        VendaDireta1.Enabled := false;
         Gastos1.Enabled := false;
          Movimentaes2.Enabled := false;
           ConsultarVendas1.Enabled := true;
      end;


    //restaurar informa�oes para o menu

    lblUsuario.Caption := nomeFunc;
    lblCargo.Caption := cargoUsuario;
    lblHora.Caption := TimeToStr(time);
    lblData.Caption := DateToStr(date);

      // formatarGrid;

    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
    dm.query_mov.SQL.Add('SELECT * FROM movimentacoes order by id desc');
    dm.query_mov.Open;
    formatarGrid;

end;

procedure TFrmMenu.Fornecedores1Click(Sender: TObject);
begin
    FrmFornecedores := TFrmFornecedores.create(self);
    FrmFornecedores.ShowModal;
end;

procedure TFrmMenu.Funcionrios1Click(Sender: TObject);
begin
    FrmFuncionarios := TFrmFuncionarios.Create(self);//ou self
    FrmFuncionarios.ShowModal;
end;

procedure TFrmMenu.Gastos1Click(Sender: TObject);
begin
FrmGastos := TFrmGastos.Create(self);
FrmGastos.Show;
end;

procedure TFrmMenu.lblEstoqueClick(Sender: TObject);
begin
if lblEstoque.Caption = 'Estoque Baixo' then
  begin
    FrmEstoqueBaixo := TFrmEstoqueBaixo.Create(self);
    FrmEstoqueBaixo.Show;
  end;
end;

procedure TFrmMenu.listarCaixa;
begin
       dm.query_caixa_coringa.Close;
       dm.query_caixa_coringa.SQL.Clear;
       dm.query_caixa_coringa.SQL.Add('SELECT * from caixa where data_abertura = curDate() order by num_caixa asc');
       dm.query_caixa_coringa.Open;
end;

procedure TFrmMenu.Movimentaes2Click(Sender: TObject);
begin
FrmMovimentacoes := TFrmMovimentacoes.Create(FrmMenu);
FrmMovimentacoes.ShowModal;
end;

procedure TFrmMenu.NvelBaixo1Click(Sender: TObject);
begin
FrmEstoqueBaixo := TFrmEstoqueBaixo.create(self);
FrmEstoqueBaixo.showmodal;
end;

procedure TFrmMenu.pnlEstoqueClick(Sender: TObject);
begin
if lblEstoque.Caption = 'Estoque Baixo' then
  begin
    FrmEstoqueBaixo := TFrmEstoqueBaixo.Create(self);
    FrmEstoqueBaixo.Show;
  end;
end;

procedure TFrmMenu.Produtos1Click(Sender: TObject);
begin
   FrmProdutos := TFrmProdutos.create(self);
   FrmProdutos.ShowModal;
end;






procedure TFrmMenu.RelatriodeProdutos1Click(Sender: TObject);
begin
        dm.rel_produtos.LoadFromFile(GetCurrentDir + '/rel/produtos.fr3');
        dm.rel_produtos.ShowReport();
       // dm.rel_caixa.Print;
end;

procedure TFrmMenu.RelatrioporStatusdaVenda1Click(Sender: TObject);
begin
 rel := 'Vendas';
 FrmRelDatas := TFrmRelDatas.create(self);
 FrmRelDatas.ShowModal;
end;

procedure TFrmMenu.Usurios1Click(Sender: TObject);
begin
    FrmUsuarios := TFrmUsuarios.create(self);
    FrmUsuarios.ShowModal;
end;

procedure TFrmMenu.VendaDireta1Click(Sender: TObject);
begin
FrmVendaDireta := TFrmVendaDireta.Create(FrmMenu);
FrmVendaDireta.ShowModal;
end;

procedure TFrmMenu.Vendas1Click(Sender: TObject);
begin
FrmVendas := TFrmVendas.Create(self);
FrmVendas.ShowModal;
end;

procedure TFrmMenu.verificarEstoque;
begin

       dm.query_cor_produtos.Close;
       dm.query_cor_produtos.SQL.Clear;
       dm.query_cor_produtos.SQL.Add('SELECT * from produtos where estoque <= estoque_min order by nome asc');
       dm.query_cor_produtos.Open;

       if dm.query_cor_produtos.RecordCount <= 0 then
        begin
              pnlEstoque.Color := ConverterRBG(142, 234, 139);
              lblEstoque.Caption := 'Estoque Bom';
        end
          else
            begin

              pnlEstoque.Color := ConverterRBG(234, 139, 139);
               lblEstoque.Caption := 'Estoque Baixo';
            end;

    








end;

procedure TFrmMenu.SaidasdeProdutos1Click(Sender: TObject);
begin
 FrmSaidasProdutos := TFrmSaidasProdutos.create(self);
FrmSaidasProdutos.ShowModal;
end;

procedure TFrmMenu.Sair2Click(Sender: TObject);
begin
     if teste = 'teste' then
      begin
        exit;
      end;
 //VERIFICAR STATUS DO CAIXA
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num ');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := numCaixa;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin

          MessageDlg('Voc� n�o pode fechar com o caixa aberto!!!',mtInformation,mbOKCancel,0);


        end;
    close;
end;

procedure TFrmMenu.Timer1Timer(Sender: TObject);
begin
lblHora.Caption := timeToStr(Time);
end;

procedure TFrmMenu.Timer2Timer(Sender: TObject);
begin
totalizarEntradas;
totalizarSaidas;
totalizar;

totalizarCaixa;
verificarEstoque;

    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
    dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data = curDate() order by id desc');
    dm.query_mov.Open;
    formatarGrid;

listarCaixa;
end;

procedure TFrmMenu.totalizar;
var
tot : real;
begin
tot := totEntradas - totSaidas;
 if tot >= 0 then
  begin
    lblSaldo.Font.Color := ConverterRBG(164, 191, 255); //COR DA FONTE
    end
      else
        begin
        lblSaldo.Font.Color :=  ConverterRBG(237, 103, 103); //COR DA FONTE
        end;

   lblSaldo.Caption := formatFloat('R$ #,,,,0.00',tot);
end;

procedure TFrmMenu.totalizarEntradas;
var
tot:real;
begin
  dm.query_cor_ent.Close;
  dm.query_cor_ent.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
  dm.query_cor_ent.SQL.Add('Select sum(valor) as total from movimentacoes where data = curDate() and tipo = "Entrada" and status = "Conclu�da" ');
  dm.query_cor_ent.Prepare;
  dm.query_cor_ent.Open;



  tot := dm.query_cor_ent.FieldByName('total').AsFloat;
  TotEntradas := tot;
  lblEntradas.Caption := FormatFloat('R$ #,,,,0.00',tot);

end;

procedure TFrmMenu.totalizarSaidas;
var
tot:real;
begin
dm.query_cor_mov.Close;
dm.query_cor_mov.SQL.Clear;
dm.query_cor_mov.SQL.Add('Select sum(valor) as total from movimentacoes where data = curDate() and tipo = "Saida" ');
dm.query_cor_mov.Prepare; //Prepare para que o servidor de banco de dados remoto aloque recursos para a consulta e execute otimiza��es adicionais.
dm.query_cor_mov.Open;
tot := dm.query_cor_mov.FieldByName('total').AsFloat;
totSaidas := tot;
lblSaidas.Caption := formatFloat('R$ #,,,,0.00', tot);
lblSaidas.Font.Color :=  ConverterRBG(252, 180, 187);
end;

end.



