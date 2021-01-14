unit DiretaEmbutida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.MPlayer;

type
  TFrmVendaEmbutida = class(TForm)
    Label1: TLabel;
    edtCodBarras: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    EdtQuantidade: TEdit;
    Label2: TLabel;
    EdtPreco: TEdit;
    Label4: TLabel;
    edtEstoque: TEdit;
    Label6: TLabel;
    MediaPlayer1: TMediaPlayer;
    Label12: TLabel;
    pnlEstoque: TPanel;
    lblEstoque: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtCodBarrasChange(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtPrecoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure buscarProduto;
    procedure listar;
    procedure salvarItens;
    procedure associarCamposDet;


  public
    { Public declarations }
  end;

var
  FrmVendaEmbutida: TFrmVendaEmbutida;
   estoque : double;
    idProdutoEst: string;


implementation

{$R *.dfm}

uses Modulo, Vendas;

//FUN��O PARA CONVERTER EM RGB

  function ConverterRBG(r, g, b: byte) : tColor;
   begin
     Result := RGB(r, g , b)
   end;

procedure TFrmVendaEmbutida.associarCamposDet;
begin
 dm.tb_detalhes_vendas.fieldByName('id_venda').Value := 0;
  dm.tb_detalhes_vendas.fieldByName('cod_exc').Value := codexc;
 dm.tb_detalhes_vendas.fieldByName('produto').Value := produtoemb;
 dm.tb_detalhes_vendas.fieldByName('valor').Value := totalItememb / strToFloat(edtQuantidade.Text);
 dm.tb_detalhes_vendas.fieldByName('quantidade').Value := edtQuantidade.text;
 dm.tb_detalhes_vendas.fieldByName('total').Value := totalItememb;
 dm.tb_detalhes_vendas.fieldByName('id_produto').Value := idProduto;
 dm.tb_detalhes_vendas.fieldByName('funcionario').Value := nomeFunc;
  dm.tb_detalhes_vendas.fieldByName('data').Value := DateToStr(date);
    dm.tb_detalhes_vendas.fieldByName('mov').Value := 'Venda Direta';
 estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
end;

procedure TFrmVendaEmbutida.buscarProduto;
begin


      pnlEstoque.Visible := false;
      lblEstoque.Visible := false;
      Label12.Visible := false;

     //Buscar

         dm.query_produtos.Close;
         dm.query_produtos.SQL.Clear;
         dm.query_produtos.SQL.Add('select * from produtos where codigo = :codigo');
         dm.query_produtos.ParamByName('codigo').Value := edtCodBarras.Text;
         dm.query_produtos.Open;


         if not dm.query_produtos.IsEmpty then
          begin

            edtQuantidade.Enabled := false;
            produtoemb := dm.query_produtos.FieldByName('nome').Value;
            //edtDescricao.Text := dm.query_produtos.FieldByName('descricao').Value;
           // edtPreco.Text := dm.query_produtos.FieldByName('valor').Value;
            edtEstoque.Text := dm.query_produtos.FieldByName('estoque').Value;

              //Verificando se tem produto para vender
            if strToInt(edtEstoque.Text) >= strtoInt(edtQuantidade.Text) then
            begin
             listar;


            IdProduto := dm.query_produtos.FieldByName('id').Value;

            //ExibeFoto(dm.query_produtos, 'imagem', imagem);





                                                 ////
            totalItememb := strToFloat(edtPreco.Text); //- strToFloat(edtDesconto.Text);

            //totalVenda := totalVenda + totalItem;
            //totalcomDesconto := totalVenda;
            //
            ////edtTotal.Text := formatFloat('R$ #,,,,0.00',totalItem);
            //edtSubTotal.Text := formatFloat('R$ #,,,,0.00',totalVenda);
           // edtTotalCompra.Text := formatFloat('R$ #,,,,0.00',totalVenda);


            dm.tb_detalhes_vendas.Insert;

            if edtEstoque.Text  > '0' then
            begin
            edtEstoque.Text := dm.query_produtos.FieldByName('estoque').Value - edtQuantidade.Text;
            end;

            estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
            salvarItens;

             (*if edtDesconto.Text = '0' then
             begin
             troco := strToFloat(edtValorRecebido.Text) - totalVenda;
             edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
             totalcomDesconto := totalVenda;

             end
              else
                begin
                   troco := strToFloat(edtValorRecebido.Text) - totalcomDesconto;
                     edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
                end; *)


                 //if edtValorRecebido.Text = '0'  then
                 // begin
                    //   valorZerado := 0;
                   // edtTroco.Text := FormatFloat('R$ #,,,,0.00', valorZerado);
                   // troco := valorZerado;
                 // end;


            //edtValorRecebido.Enabled := true;

            end
              else
                begin
                  messageDlg('N�o tem produto em estoque para vender!',mtWarning,mbOKCancel,0);
                 edtCodBarras.Text := '';
                 edtCodBarras.SetFocus;
                 edtQuantidade.Text := '1';
                 edtQuantidade.enabled := true;
                   pnlEstoque.Visible := true;
                 lblEstoque.Visible := true;
                  pnlEstoque.Color := ConverterRBG(234, 139, 139);
                 //limparProdutos;
                end;
            end
              else
              begin
              //limparProdutos;
              end;



end;

procedure TFrmVendaEmbutida.EdtPrecoChange(Sender: TObject);
begin
if (trim(edtPreco.text) = '0') or (edtPreco.Text = '') then
  begin
   edtCodBarras.Enabled := false;
  end
    else
     begin
        edtCodBarras.Enabled := true;
     end;

end;

procedure TFrmVendaEmbutida.EdtQuantidadeExit(Sender: TObject);
begin
 if edtQuantidade.Text = '0' then
  begin
    edtQuantidade.text := '1';
  end;
end;

procedure TFrmVendaEmbutida.edtCodBarrasChange(Sender: TObject);
begin



     if edtpreco.Text = '' then
   begin
     edtpreco.Text := '1';
   end;

       if edtQuantidade.Text = '' then
   begin
     edtQuantidade.Text := '1';

   end;

   if edtCodBarras.text <> ''  then
     begin
       buscarProduto;
     end;

end;

procedure TFrmVendaEmbutida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//MediaPlayer1.Destroy;
end;

procedure TFrmVendaEmbutida.FormDestroy(Sender: TObject);
begin
///MediaPlayer1.Destroy;
end;

procedure TFrmVendaEmbutida.FormShow(Sender: TObject);
begin
 pnlEstoque.Visible := false;
      lblEstoque.Visible := false;
      Label12.Visible := false;
edtpreco.SetFocus;



//dtPreco.Text := FormatFloat('R$ #,,,,0.00', StrToFloat(edtPreco.Text));dm.tb_venda_dir.Active := false;

//limparProdutos;

dm.tb_vendas.Active := false;
dm.tb_vendas.Active := true;
dm.tb_vendas.Insert;

dm.tb_detalhes_vendas.active := false;
dm.tb_detalhes_vendas.active := true;

 if Embutida = 'vendadireta' then
   begin

   end;




   //limpar;

    //  edtQuantidade.Text := '1';
     (* := 0;
      totalVenda := 0;
      estoque := 0;
      totalItem := 0;
      troco := 0;
      valorZerado := 0;  //para troco
      verificaQtd := 0 ;


      lblHora.Caption := TimeToStr(time);
    lblData.Caption := DateToStr(date);


      pnlEstoque.Visible := false;
              lblEstoque.Visible := false;  *)
end;

procedure TFrmVendaEmbutida.listar;
begin
 dm.query_det_vendas.Close;
    dm.query_det_vendas.SQL.clear;
    dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = 0 and funcionario = :func order by id desc');
    dm.query_det_vendas.ParamByName('func').Value := nomeFunc; // informando os parametros a passar para cargo e o que comparar com id
       // passando parametro e esse id no final vem da variavel no inicio do cod
    // dm.query_det_vendas.ParamByName('id_venda').Value := idVenda;
    dm.query_det_vendas.Open;// inicia a query /abrir
end;

procedure TFrmVendaEmbutida.salvarItens;
begin
begin
if codexc = 0 then
begin
codexc := 1;
end;
///MediaPlayer1.close;
edtquantidade.enabled := true;


 if (trim(EdtQuantidade.text) = '') or (EdtQuantidade.text = '0') then
    begin
      MessageDlg('Preencha o campo quantidade!' , mtInformation, mbOKCancel,0);
      edtQuantidade.SetFocus;
      edtQuantidade.Text := '';
      exit;
    end;



associarCamposDet;
//idProdutoEst := dm.query_det_vendas.FieldByName('id_produto').Value;
dm.tb_detalhes_vendas.Post;
codexc := codexc + 1;


//Pegando estoque atual

    dm.query_produtos.Close;
    dm.query_produtos.SQL.Clear;
    dm.query_produtos.SQL.Add('select * from produtos where id = :id');
    dm.query_produtos.ParamByName('id').Value := idProduto;
    dm.query_produtos.Open;

    if not dm.query_produtos.IsEmpty then
      begin
        estoqueProduto := dm.query_produtos['estoque'];
      end;


    //Atualiza��o de estoque

    estoque := estoqueProduto - strToFloat(edtQuantidade.Text);

    dm.query_produtos.Close;
    dm.query_produtos.SQL.Clear;
    dm.query_produtos.SQL.Add('UPDATE produtos set estoque = :estoque where id = :id');
    dm.query_produtos.ParamByName('estoque').Value := estoque;
    dm.query_produtos.ParamByName('id').Value := idProduto;

    dm.query_produtos.ExecSQL;


listar;



edtCodBarras.Text := '';
edtCodBarras.SetFocus;
edtQuantidade.Text := '1';

/// MediaPlayer1.FileName := GetCurrentDir + '\img\barCode1.wav';
 //ExtractFileDir(GetCurrentDir) + '\Debug\img\barCode1.wav';   //Pegando o audio
 ///MediaPlayer1.Open; //abrindo o audio
/// MediaPlayer1.Play; // executando
//MessageDlg('Salvo com sucesso!',mtInformation, mbOKCancel,0);

  totalItem := totalItem + totalItememb;
     totalVenda :=  totalVenda + totalItememb;
      totalcomDesconto := totalcomDesconto + totalItememb ;
     conversor := totalcomDesconto;
       totalItememb := 0;
FrmVendaEmbutida.close;



end;
    end;
end.
