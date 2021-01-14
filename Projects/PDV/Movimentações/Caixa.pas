unit Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls;

type
  TFrmCaixa = class(TForm)
    BtnAbrir: TSpeedButton;
    BtnFechar: TSpeedButton;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    edtValor: TEdit;
    edtCaixa: TEdit;
    btnPDV: TButton;
    btnAreaAdm: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnAbrirClick(Sender: TObject);
    procedure btnPDVClick(Sender: TObject);
    procedure btnAreaAdmClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }

     procedure limpar;
     procedure habilitarCampos;
     procedure desabilitarCampos;


     procedure associarCampos;
     procedure listar;
     procedure abrirCaixa;





  public
    { Public declarations }
  end;

var
  FrmCaixa: TFrmCaixa;
  gerente :string;
  cargoGerente :string;
  idCaixa :string;
  //

  valorVendido : double;
  valorQuebra : double;
  valorAbertura : double;
  valorFechamento : double;

 

implementation

{$R *.dfm}

uses Modulo, MENU, Vendas, Login, AreaAdm, BuscarProduto, CancelarItem, Cargos,
  CertificadoDigital, DadosComprovante, DadosEmitente, DiretaEmbutida,
  EntradasProdutos, EstoqueBaixo, ExcluirDados, FluxoCaixa, FormaPagamento,
  Fornecedores, Funcionarios, Gastos, Gaveta, ImprimirBarras, ListaVendas,
  Movimentacoes, Produtos, RelatoriosPorDatas, SaidasProdutos, uRegistro,
  Usuarios, VendaDireta, RetiradaCaixa;

procedure TFrmCaixa.abrirCaixa;
begin
 //////// VALIDA��O DE CAMPOS///////////////

    if trim(EdtUsuario.Text) = '' then
      Begin
        MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
        EdtUsuario.SetFocus;
        exit;
      End;

    if Trim(EdtSenha.text) = '' then
      begin
        MessageDlg('Preencha o campo do produto!',MtInformation , mbOKCancel,0);
        EdtSenha.SetFocus;
        exit;
      end;

    if Trim(edtValor.Text) = '' then
      begin
        MessageDlg('Preencha o campo usu�rio!!',MtInformation ,mbOKCancel,0);
        edtValor.SetFocus;
        exit;
      end;

     if Trim(EdtCaixa.Text) = '' then
      begin
        MessageDlg('Preencha o campo de telefone!',mtInformation,mbOKCancel,0);
        EdtCaixa.SetFocus;
        exit;
      end;

       //VERIFICAR STATUS DO CAIXA
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin
          messageDlg('Esse caixa j� est� aberto!',mtInformation, mbOKCancel,0);
          listar;
          exit;
        end;



       //VERIFICAR FUNCIONARIO

        dm.query_usuarios.close;
        dm.query_usuarios.sql.clear;
        dm.query_usuarios.SQL.Add('SELECT * FROM usuarios where usuario = :usuario and senha = :senha');
        dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
        dm.query_usuarios.ParamByName('senha').Value := EdtSenha.Text;
        dm.query_usuarios.open;

        if not dm.query_usuarios.IsEmpty then
        begin
        nomeUsuario := dm.query_usuarios['usuario'];
        cargoUsuario := dm.query_usuarios['cargo'];
        nomeFunc := dm.query_usuarios['nome'];

        end
        else
          begin
            MessageDlg('Usu�rio ou senha incorreto!', mtError, mbOKCancel ,0);
            EdtUsuario.Text := '';
            EdtSenha.Text := '';
            EdtUsuario.SetFocus;
            exit;
          end;


        associarCampos;
        dm.tb_caixa.Post;
        MessageDlg('Caixa Aberto com sucesso!!',mtInformation,mbOKCancel,0);
        numCaixa := edtCaixa.Text;
        limpar;

        BtnAbrir.Enabled := false;

        btnFechar.Enabled := true;

        edtCaixa.Enabled := false;
        listar;
        edtValor.enabled := true;
        edtUsuario.setFocus;
        FrmVendas := TFrmVendas.Create(self);
        FrmVendas.ShowModal;
        limpar;
end;

procedure TFrmCaixa.associarCampos;
begin
      dm.tb_caixa.FieldByName('data_abertura').Value := DateToStr(Date);
      dm.tb_caixa.FieldByName('hora_abertura').Value := TimeToStr(Time);
      dm.tb_caixa.FieldByName('valor_abertura').Value := strToFloat(edtValor.text);
      dm.tb_caixa.FieldByName('funcionario_abertura').Value := nomeFunc;
      dm.tb_caixa.FieldByName('num_caixa').Value := edtCaixa.text;
      dm.tb_caixa.FieldByName('operador').Value := nomeFunc;
      dm.tb_caixa.FieldByName('status').Value := 'Aberto';

end;

procedure TFrmCaixa.BtnAbrirClick(Sender: TObject);
begin
  //////// VALIDA��O DE CAMPOS///////////////

    if trim(EdtUsuario.Text) = '' then
      Begin
        MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
        EdtUsuario.SetFocus;
        exit;
      End;

    if Trim(EdtSenha.text) = '' then
      begin
        MessageDlg('Preencha o campo do produto!',MtInformation , mbOKCancel,0);
        EdtSenha.SetFocus;
        exit;
      end;

    if Trim(edtValor.Text) = '' then
      begin
        MessageDlg('Preencha o campo usu�rio!!',MtInformation ,mbOKCancel,0);
        edtValor.SetFocus;
        exit;
      end;

     if Trim(EdtCaixa.Text) = '' then
      begin
        MessageDlg('Preencha o campo de telefone!',mtInformation,mbOKCancel,0);
        EdtCaixa.SetFocus;
        exit;
      end;

       //VERIFICAR STATUS DO CAIXA
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num and data_abertura = curDate()');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin
          messageDlg('Esse caixa j� est� aberto!',mtInformation, mbOKCancel,0);
          listar;
          exit;
        end;



       //VERIFICAR FUNCIONARIO

        dm.query_usuarios.close;
        dm.query_usuarios.sql.clear;
        dm.query_usuarios.SQL.Add('SELECT * FROM usuarios where usuario = :usuario and senha = :senha');
        dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
        dm.query_usuarios.ParamByName('senha').Value := EdtSenha.Text;
        dm.query_usuarios.open;

        if not dm.query_usuarios.IsEmpty then
        begin
        nomeUsuario := dm.query_usuarios['usuario'];
        cargoUsuario := dm.query_usuarios['cargo'];
        nomeFunc := dm.query_usuarios['nome'];

        end
        else
          begin
            MessageDlg('Usu�rio ou senha incorreto!', mtError, mbOKCancel ,0);
            EdtUsuario.Text := '';
            EdtSenha.Text := '';
            EdtUsuario.SetFocus;
            exit;
          end;


        associarCampos;
        dm.tb_caixa.Post;
        MessageDlg('Caixa Aberto com sucesso!!',mtInformation,mbOKCancel,0);
        numCaixa := edtCaixa.Text;
        limpar;

        BtnAbrir.Enabled := false;

        btnFechar.Enabled := true;

        edtCaixa.Enabled := false;
        listar;
        edtValor.enabled := true;
        edtUsuario.setFocus;
        FrmVendas := TFrmVendas.Create(self);
        FrmVendas.ShowModal;
        limpar;


end;


procedure TFrmCaixa.BtnFecharClick(Sender: TObject);
var
totalzao : double;
totalTudo : double;
totalCanc : double;
totalRetirada : double;
totalDinheiro : double;
  totalCartao : double;
totalVend : double;
totalQuebra : double;
totalAbert : double;
totalFech : double;
    conversaodinheiro : string;
  conversaocartao : string;
  conversaovend : string;
  conversaoquebra : string;
  conversaoabert : string;
  conversaofech : string;
  conversaocanc : string;
  conversaototaltudo: string;
  conversaoretirada : string;



begin
  //////// VALIDA��O DE CAMPOS///////////////
             dm.tb_caixa.edit;
    if trim(EdtUsuario.Text) = '' then
      Begin
        MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
        EdtUsuario.SetFocus;
        exit;
      End;

         if trim(EdtSenha.Text) = '' then
      Begin
        MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
        EdtSenha.SetFocus;
        exit;
      End;
    

    (*if Trim(edtValor.Text) = '' then
      begin
        MessageDlg('Preencha o campo Valor!!',MtInformation ,mbOKCancel,0);
        edtValor.SetFocus;
        exit;
      end; *)

     if Trim(EdtCaixa.Text) = '' then
      begin
        MessageDlg('Preencha o n�mero do caixa!',mtInformation,mbOKCancel,0);
        EdtCaixa.SetFocus;
        exit;
      end;

       //VERIFICAR SE O CAIXA JA ESTA FECHADO
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num and operador = :func and data_fechamento = curDate()');
        dm.query_caixa.ParamByName('status').Value := 'Fechado';
        dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
         dm.query_caixa.ParamByName('func').Value := nomeFunc;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin
          messageDlg('Esse caixa j� est� fechado!',mtInformation, mbOKCancel,0);
          listar;
          exit;
        end;





       //VERIFICAR FUNCIONARIO

        dm.query_usuarios.close;
        dm.query_usuarios.sql.clear;
        dm.query_usuarios.SQL.Add('SELECT * FROM usuarios where usuario = :usuario and senha = :senha');
        dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
        dm.query_usuarios.ParamByName('senha').Value := EdtSenha.Text;
        dm.query_usuarios.open;

        if not dm.query_usuarios.IsEmpty then
        begin
        nomeUsuario := dm.query_usuarios['usuario'];
        cargoUsuario := dm.query_usuarios['cargo'];
        nomeFunc := dm.query_usuarios['nome'];

        end
        else
          begin
            MessageDlg('Usu�rio ou senha incorreto!', mtError, mbOKCancel ,0);
            EdtUsuario.Text := '';
            EdtSenha.Text := '';
            EdtUsuario.SetFocus;
            exit;
          end;

         //Recuperar Valor da Abertura
       dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin

          valorAbertura := dm.query_caixa.fieldbyName('valor_abertura').Value;
        end;


         //Recuperar Total Vendido no Dia Pelo Funcionario
      dm.query_coringa.Close;
      dm.query_coringa.SQL.Clear;
      dm.query_coringa.SQL.Add('SELECT sum(valor) as total FROM movimentacoes where data = curDate() and status = :status and funcionario = :func');
      dm.query_coringa.ParamByName('status').Value := 'Conclu�da';
      dm.query_coringa.ParamByName('func').Value := nomeFunc;
      dm.query_coringa.Prepare;
      dm.query_coringa.Open;
      valorVendido := dm.query_coringa.FieldByName('total').AsFloat;


    valorQuebra := strToFloat(edtValor.Text) - valorVendido - valorAbertura;


     ////////////////////////////////////////////////////////
        valorFechamento := strToFloat(EdtValor.Text);
       (*   dm.query_caixa.Close;
          dm.query_caixa.SQL.Clear;
       dm.query_caixa.SQL.Add('UPDATE caixa set data_fechamento = curDate(), hora_fechamento = curTime(), valor_fechamento = :valor, valor_vendido = :valor_v, valor_quebra = :valor_que, funcionario_fechamento = :funcionario_fe, status := :st where num_caixa = :num and status = :status');// ('UPDATE funcionarios set cpf = :cpf');
      dm.query_caixa.ParamByName('valor').value := valorFechamento;
      dm.query_caixa.ParamByName('valor_v').value := valorVendido;
      dm.query_caixa.ParamByName('valor_que').value := valorQuebra;
      dm.query_caixa.ParamByName('funcionario_fe').Value := nomeFunc;
      dm.query_caixa.ParamByName('st').Value := 'Fechado';
     dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
      dm.query_caixa.ParamByName('status').Value := 'Aberto';
      dm.query_caixa.ExecSQL;*)


        MessageDlg('Caixa Fechado com sucesso!!',mtInformation,mbOKCancel,0);
        numCaixa := edtCaixa.Text;
        limpar;
        desabilitarCampos;
        BtnAbrir.Enabled := false;

        btnFechar.Enabled := true;
       (* ShowMessage('Imprimindo as vendas de hoje feita pelo ' + nomeFunc);  *)

          dm.query_mov.Close;
          dm.query_mov.SQL.Clear;
          dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data = curDate() and status = "Cancelada" and funcionario = :func');
           dm.query_mov.ParamByName('func').Value := NomeFunc;
          dm.query_mov.Open;

         if dm.query_mov.IsEmpty then
           begin
            //
             dm.query_retirada.Close;
             dm.query_retirada.sql.Clear;
             dm.query_retirada.SQL.Add('select * from retirada_caixa');
             dm.query_retirada.Open;

             if not dm.query_retirada.IsEmpty then
               begin
             dm.query_retirada.Close;
            dm.query_retirada.SQL.clear;
            dm.query_retirada.SQL.Add('SELECT sum(valor) as total FROM retirada_caixa where data = curDate()and funcionario = :func');
            dm.query_retirada.ParamByName('func').Value := NomeFunc;
            dm.query_retirada.Prepare;
            dm.query_retirada.Open;
             totalRetirada := dm.query_retirada.FieldByName('total').AsFloat;

            end;


            //valor quebra atualizado
            valorQuebra := (valorQuebra + totalRetirada);
            //atualizar quebra
                    dm.query_caixa.Close;
                dm.query_caixa.SQL.Clear;
             dm.query_caixa.SQL.Add('UPDATE caixa set data_fechamento = curDate(), hora_fechamento = curTime(), valor_fechamento = :valor, valor_vendido = :valor_v, valor_quebra = :valor_que, funcionario_fechamento = :funcionario_fe, status := :st where num_caixa = :num and status = :status');// ('UPDATE funcionarios set cpf = :cpf');
            dm.query_caixa.ParamByName('valor').value := valorFechamento;
            dm.query_caixa.ParamByName('valor_v').value := valorVendido;
            dm.query_caixa.ParamByName('valor_que').value := valorQuebra;
            dm.query_caixa.ParamByName('funcionario_fe').Value := nomeFunc;
            dm.query_caixa.ParamByName('st').Value := 'Fechado';
           dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
            dm.query_caixa.ParamByName('status').Value := 'Aberto';
            dm.query_caixa.ExecSQL;

            ShowMessage('Imprimindo as vendas de hoje feita pelo ' + nomeFunc);

            dm.query_caixa.Close;
            dm.query_caixa.SQL.clear;
            dm.query_caixa.SQL.Add('SELECT * FROM caixa where funcionario_abertura = :func and data_abertura = curDate() order by hora_abertura asc');
            dm.query_caixa.ParamByName('func').Value := NomeFunc;
            dm.query_caixa.Open;
            dm.rel_caixa.LoadFromFile(GetCurrentDir + '/rel/dadoscaixa.fr3');
            dm.rel_caixa.PrintOptions.ShowDialog := false;
            //dm.rel_caixa.ShowReport();
            dm.rel_caixa.PrepareReport;
            dm.rel_caixa.Print;

            dm.query_mov.Close;
            dm.query_mov.SQL.clear;
            dm.query_mov.SQL.Add('SELECT sum(valor) as total FROM movimentacoes where funcionario = :func and data = curDate() and status = "Conclu�da" order by hora asc');
            dm.query_mov.ParamByName('func').Value := NomeFunc;
            dm.query_mov.Prepare;
            dm.query_mov.Open;
             totalTudo := dm.query_mov.FieldByName('total').AsFloat;

            dm.rel_Mov_Dinheiro.Close;
            dm.rel_Mov_Dinheiro.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
            dm.rel_Mov_Dinheiro.SQL.Add('Select sum(valor) as total FROM movimentacoes where data = curDate() and metodo = :metodo and funcionario = :func and status = "Conclu�da"');
            dm.rel_Mov_Dinheiro.ParamByName('metodo').Value := 'Dinheiro';
             dm.rel_Mov_Dinheiro.ParamByName('func').Value := NomeFunc;
            dm.rel_Mov_Dinheiro.Prepare;
            dm.rel_Mov_Dinheiro.open;
            totalDinheiro := dm.rel_Mov_Dinheiro.FieldByName('total').AsFloat;



            dm.rel_Mov_Cartao.Close;
            dm.rel_Mov_Cartao.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
            dm.rel_Mov_Cartao.SQL.Add('Select sum(valor) as total FROM movimentacoes where data = curDate() and metodo = :metodo and funcionario = :func and status = "Conclu�da" ');
            dm.rel_Mov_Cartao.ParamByName('metodo').Value := 'Cart�o';
            dm.rel_Mov_Cartao.ParamByName('func').Value := NomeFunc;
            dm.rel_Mov_Cartao.Prepare;
            dm.rel_Mov_Cartao.open;
            totalCartao := dm.rel_Mov_Cartao.FieldByName('total').AsFloat;

            
            totalzao := totalTudo - totalRetirada;


            dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/fimdiaalt.fr3');
             conversaodinheiro := FloatToStr(totalDinheiro);
             conversaocartao := FloatToStr(totalCartao);
             conversaototaltudo := FloatToStr(totalzao);
             conversaoretirada := FloatToStr(totalRetirada);
             //conversaoabert := FloatToStr(totalAbert);
            // conversaofech := FloatToStr(totalFech);
             //conversaovend := FloatToStr(totalVend);
             //conversaoquebra := FloatToStr(totalQuebra);

             dm.rel_comprovante.Variables['totCartao'] := QuotedStr(conversaocartao);
            dm.rel_comprovante.Variables['totDinheiro'] :=  QuotedStr(conversaodinheiro);
            dm.rel_comprovante.Variables['tot'] := QuotedStr(conversaototaltudo);
             dm.rel_comprovante.Variables['retirada'] := QuotedStr(conversaoretirada);

           // dm.rel_comprovante.Variables['totalAbert'] :=  QuotedStr(conversaoabert);
           // dm.rel_comprovante.Variables['totalFech'] :=  QuotedStr(conversaofech);
            //dm.rel_comprovante.Variables['totalVend'] :=  QuotedStr(conversaovend);
            //dm.rel_comprovante.Variables['totalQuebra'] :=  QuotedStr(conversaoquebra);

            dm.rel_comprovante.PrintOptions.ShowDialog := false;
             //dm.rel_comprovante.ShowReport();
            dm.rel_comprovante.PrepareReport;

            dm.rel_comprovante.Print;

             dm.query_retirada.Close;
             dm.query_retirada.sql.Clear;
             dm.query_retirada.SQL.Add('SELECT * FROM retirada_caixa where data = curDate() and funcionario = :func');
             dm.query_retirada.ParamByName('func').Value := NomeFunc;
             dm.query_retirada.Open;

             if not dm.query_retirada.IsEmpty then
               begin
                  dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/informacoesretirada.fr3');
                  dm.rel_comprovante.PrintOptions.ShowDialog := false;
                  dm.rel_comprovante.PrepareReport;
                  dm.rel_comprovante.Print;
               end;
           end
             else
                begin
                    //
                   dm.query_retirada.Close;
                   dm.query_retirada.sql.Clear;
                   dm.query_retirada.SQL.Add('select * from retirada_caixa');
                   dm.query_retirada.Open;

                   if not dm.query_retirada.IsEmpty then
                     begin
                   dm.query_retirada.Close;
                  dm.query_retirada.SQL.clear;
                  dm.query_retirada.SQL.Add('SELECT sum(valor) as total FROM retirada_caixa where data = curDate()and funcionario = :func');
                  dm.query_retirada.ParamByName('func').Value := NomeFunc;
                  dm.query_retirada.Prepare;
                  dm.query_retirada.Open;
                   totalRetirada := dm.query_retirada.FieldByName('total').AsFloat;

                  end;

                   //valor quebra atualizado
                     valorQuebra := (valorQuebra + totalRetirada);
                    //atualizar quebra
                    dm.query_caixa.Close;
                      dm.query_caixa.SQL.Clear;
                   dm.query_caixa.SQL.Add('UPDATE caixa set data_fechamento = curDate(), hora_fechamento = curTime(), valor_fechamento = :valor, valor_vendido = :valor_v, valor_quebra = :valor_que, funcionario_fechamento = :funcionario_fe, status := :st where num_caixa = :num and status = :status');// ('UPDATE funcionarios set cpf = :cpf');
                  dm.query_caixa.ParamByName('valor').value := valorFechamento;
                  dm.query_caixa.ParamByName('valor_v').value := valorVendido;
                  dm.query_caixa.ParamByName('valor_que').value := valorQuebra;
                  dm.query_caixa.ParamByName('funcionario_fe').Value := nomeFunc;
                  dm.query_caixa.ParamByName('st').Value := 'Fechado';
                 dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
                  dm.query_caixa.ParamByName('status').Value := 'Aberto';
                  dm.query_caixa.ExecSQL;

                  ShowMessage('Imprimindo as vendas de hoje feita pelo ' + nomeFunc);

                                                                                                      dm.query_caixa.Close;
                       dm.query_caixa.Close;
                  dm.query_caixa.SQL.clear;
                  dm.query_caixa.SQL.Add('SELECT * FROM caixa where funcionario_abertura = :func and data_abertura = curDate() order by hora_abertura asc');
                  dm.query_caixa.ParamByName('func').Value := NomeFunc;
                  dm.query_caixa.Open;
                  dm.rel_caixa.LoadFromFile(GetCurrentDir + '/rel/dadoscaixa.fr3');
                  dm.rel_caixa.PrintOptions.ShowDialog := false;
                  //dm.rel_caixa.ShowReport();
                  dm.rel_caixa.PrepareReport;
                  dm.rel_caixa.Print;

                        dm.query_mov.Close;
                  dm.query_mov.SQL.clear;
                  dm.query_mov.SQL.Add('SELECT sum(valor) as total FROM movimentacoes where funcionario = :func and data = curDate() and status = "Conclu�da" order by hora asc');
                  dm.query_mov.ParamByName('func').Value := NomeFunc;
                  dm.query_mov.Prepare;
                  dm.query_mov.Open;
                   totalTudo := dm.query_mov.FieldByName('total').AsFloat;


                  dm.query_canc2.Close;
                  dm.query_canc2.SQL.clear;
                  dm.query_canc2.SQL.Add('SELECT sum(valor) as total FROM movimentacoes where funcionario = :func and data = curDate() and status = "Cancelada" order by hora asc');
                  dm.query_canc2.ParamByName('func').Value := NomeFunc;
                   dm.query_canc2.Prepare;
                  dm.query_canc2.Open;
                  totalCanc :=  dm.query_canc2.FieldByName('total').AsFloat;

                      dm.rel_Mov_Dinheiro.Close;
                dm.rel_Mov_Dinheiro.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
                dm.rel_Mov_Dinheiro.SQL.Add('Select sum(valor) as total FROM movimentacoes where data = curDate() and metodo = :metodo and funcionario = :func and status = "Conclu�da"');
                dm.rel_Mov_Dinheiro.ParamByName('metodo').Value := 'Dinheiro';
                 dm.rel_Mov_Dinheiro.ParamByName('func').Value := NomeFunc;
                dm.rel_Mov_Dinheiro.Prepare;
                dm.rel_Mov_Dinheiro.open;
                totalDinheiro := dm.rel_Mov_Dinheiro.FieldByName('total').AsFloat;


                dm.rel_Mov_Cartao.Close;
                dm.rel_Mov_Cartao.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
                dm.rel_Mov_Cartao.SQL.Add('Select sum(valor) as total FROM movimentacoes where data = curDate() and metodo = :metodo and funcionario = :func and status = "Conclu�da"');
                dm.rel_Mov_Cartao.ParamByName('metodo').Value := 'Cart�o';
                dm.rel_Mov_Cartao.ParamByName('func').Value := NomeFunc;
                dm.rel_Mov_Cartao.Prepare;
                dm.rel_Mov_Cartao.open;
                totalCartao := dm.rel_Mov_Cartao.FieldByName('total').AsFloat;

                totalzao := totalTudo - totalRetirada;

                 //valorQuebra := strToFloat(edtValor.Text) - valorVendido - valorAbertura - totalRetirada;

                 


                dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/fimdiacancalt.fr3');
                 conversaodinheiro := FloatToStr(totalDinheiro);
                 conversaocartao := FloatToStr(totalCartao);
                 conversaototaltudo := FloatToStr(totalzao);
                 conversaoretirada := FloatToStr(totalRetirada);
                 conversaoCanc := FloatToStr(totalCanc);

                 //conversaoabert := FloatToStr(totalAbert);
                // conversaofech := FloatToStr(totalFech);
                 //conversaovend := FloatToStr(totalVend);
                 //conversaoquebra := FloatToStr(totalQuebra);


                 dm.rel_comprovante.Variables['totCartao'] := QuotedStr(conversaocartao);
                dm.rel_comprovante.Variables['totDinheiro'] :=  QuotedStr(conversaodinheiro);
                dm.rel_comprovante.Variables['tot'] := QuotedStr(conversaototaltudo);
                 dm.rel_comprovante.Variables['retirada'] := QuotedStr(conversaoretirada);
                 dm.rel_comprovante.Variables['cancelamento'] := QuotedStr(conversaoCanc);

               // dm.rel_comprovante.Variables['totalAbert'] :=  QuotedStr(conversaoabert);
               // dm.rel_comprovante.Variables['totalFech'] :=  QuotedStr(conversaofech);
                //dm.rel_comprovante.Variables['totalVend'] :=  QuotedStr(conversaovend);
                //dm.rel_comprovante.Variables['totalQuebra'] :=  QuotedStr(conversaoquebra);

                dm.rel_comprovante.PrintOptions.ShowDialog := false;
                 //dm.rel_comprovantedir.ShowReport();
                dm.rel_comprovante.PrepareReport;

                dm.rel_comprovante.Print;

                 dm.query_retirada.Close;
                 dm.query_retirada.sql.Clear;
                 dm.query_retirada.SQL.Add('SELECT * FROM retirada_caixa where data = curDate() and funcionario = :func');
                 dm.query_retirada.ParamByName('func').Value := NomeFunc;
                 dm.query_retirada.Open;

                 if not dm.query_retirada.IsEmpty then
                   begin
                      dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/informacoesretirada.fr3');
                      dm.rel_comprovante.PrintOptions.ShowDialog := false;
                      dm.rel_comprovante.PrepareReport;
                      dm.rel_comprovante.Print;
                   end;

                   dm.query_canc2.Close;
                   dm.query_canc2.sql.Clear;
                   dm.query_canc2.SQL.Add('SELECT * FROM movimentacoes where data = curDate() and funcionario = :func and status = "Cancelada"');
                     dm.query_canc2.ParamByName('func').Value := NomeFunc;
                   dm.query_canc2.Open;

                 if not dm.query_canc2.IsEmpty then
                   begin
                      dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/informacoescancelamento.fr3');
                      dm.rel_comprovante.PrintOptions.ShowDialog := false;
                      dm.rel_comprovante.PrepareReport;
                      dm.rel_comprovante.Print;
                   end;


                end;



        Application.Terminate;




end;

procedure TFrmCaixa.btnPDVClick(Sender: TObject);
begin
    //VERIFICAR STATUS DO CAIXA
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin
          FrmVendas := TFrmVendas.Create(self);
          BtnAbrir.Enabled := false;

          btnFechar.Enabled := true;

          edtCaixa.Enabled := true;
          listar;
          FrmVendas.ShowModal;
          limpar;

        end
          else
            begin
               MessageDlg('Abra primeiro o caixa caixa!!',mtInformation,mbOKCancel,0);
                listar;
            end;
end;






procedure TFrmCaixa.btnAreaAdmClick(Sender: TObject);
begin
   areaAdministrativa := 'Gerenciar';
   FrmAreaAdm := TFrmAreaAdm.Create(self);
   FrmAreaAdm.ShowModal;


end;

procedure TFrmCaixa.desabilitarCampos;
begin
      EdtUsuario.Enabled := false;
      EdtSenha.Enabled := false;
      EdtValor.enabled := false;
      EdtCaixa.enabled := false;
end;

procedure TFrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //VERIFICAR STATUS DO CAIXA
               //statusCaixa;
        dm.query_caixa.close;
        dm.query_caixa.sql.clear;
        dm.query_caixa.SQL.Add('SELECT * FROM caixa where status = :status and num_caixa = :num ');
        dm.query_caixa.ParamByName('status').Value := 'Aberto';
        dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
        dm.query_caixa.open;

       if not dm.query_caixa.IsEmpty then
        begin

          MessageDlg('Voc� n�o pode fechar com o caixa aberto!!!',mtInformation,mbOKCancel,0);
          listar;
          Action := caNone;
        end;
end;

procedure TFrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 begin
    abrirCaixa;
 end;
end;

procedure TFrmCaixa.FormShow(Sender: TObject);
begin
  dm.tb_caixa.Active := true;
  dm.tb_caixa.Insert;

if statusCaixa = 'Abertura' then
  Begin

     habilitarCampos;

  btnAbrir.Enabled := true;

  edtUsuario.SetFocus;
  btnFechar.Enabled := false;
  End;
 listar;
 edtCaixa.Text := numCaixa;
end;



procedure TFrmCaixa.habilitarCampos;
begin
      EdtUsuario.Enabled := true;
      EdtSenha.Enabled := true;
      EdtValor.enabled := true;
   edtCaixa.Enabled := true

end;

procedure TFrmCaixa.limpar;
begin
      EdtUsuario.Text := '';
      EdtSenha.Text := '';
      EdtValor.Text := '';

end;

procedure TFrmCaixa.listar;
begin
      dm.query_caixa.Close;
      dm.query_caixa.SQL.Clear;
      dm.query_caixa.SQL.Add('Select * from caixa  where data_abertura = curDate()');
      dm.query_caixa.Open;
end;



end.
