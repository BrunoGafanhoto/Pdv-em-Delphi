﻿unit Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.MPlayer, ACBrBase, ACBrDFe, ACBrNFe, ACBrUtil, ACBrNFeNotasFiscais, pcnConversao, pcnConversaoNFe,
  ACBrNFSe, pcnNFe, pnfsConversao, System.Math, Vcl.Imaging.pngimage;

type
  TFrmVendas = class(TForm)
    painelGrid: TPanel;
    DBGrid1: TDBGrid;
    painelTotal: TPanel;
    painelCentral: TPanel;
    edtCodBarras: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    edtProduto: TEdit;
    edtQuantidade: TEdit;
    edtPreco: TEdit;
    edtEstoque: TEdit;
    edtTotal: TEdit;
    edtSubTotal: TEdit;
    edtDesconto: TEdit;
    edtValorRecebido: TEdit;
    imagem: TImage;
    edtDescricao: TEdit;
    MediaPlayer1: TMediaPlayer;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    edtTotalCompra: TEdit;
    edtTroco: TEdit;
    nfce: TACBrNFe;
    Label9: TLabel;
    Timer1: TTimer;
    lblHora: TLabel;
    Image1: TImage;
    Label7: TLabel;
    lblData: TLabel;
    pnlEstoque: TPanel;
    lblEstoque: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    procedure edtCodBarrasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSubTotalChange(Sender: TObject);
    procedure edtValorRecebidoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorRecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotalCompraChange(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    procedure limpar;
    procedure limparProdutos;
    procedure buscarProduto;
    procedure buscarProduto2;
    procedure salvarItens;
    procedure salvarVendas;
    procedure limparFoto;
    PROCEDURE associarCamposVenda;
    procedure associarCamposDet;
    procedure listar;



    procedure iniciarNFCE;
    procedure gerarNFCE;
    procedure imprimirCupom;




    procedure abrirGaveta;






  public
    { Public declarations }
  end;

var
  FrmVendas: TFrmVendas;
  estoque : double;
  totalItem: double;
  totalVenda: double;
  id : string;
  idProdutoEst: string;
  troco : double;
  valorZerado: double;  //para troco
  verificaQtd: double ;
  totalcomDesconto : double;
  idVenda :string;
  conversor : double;



    //VARIAVEL ASSOCIACAO
    assocValorRecebido :double;

    // STATUS BUSCARPRODUTO
    buscarstatus : string;


    //restaurar id e estoque
    idrest : string;
    quantrest : double;
    estoqueP : double;


    //
    codexc : double;
    descatz : double;




implementation

{$R *.dfm}

uses Modulo, Produtos, CancelarItem, FormaPagamento, VendaDireta,
  DiretaEmbutida, BuscarProduto, RetiradaCaixa;


//FUN��O PARA CONVERTER EM RGB

  function ConverterRBG(r, g, b: byte) : tColor;
   begin
     Result := RGB(r, g , b)
   end;

{ TFrmVendas }

{PROCEDIMENTO PADR�O PARA RECUPERAR FOTO DO BANCO}
procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao :
TImage);

 var MemoryStream:TMemoryStream; jpg : TPicture;
 const
  OffsetMemoryStream : Int64 = 0;

begin
  if not(DataSet.IsEmpty) and
  not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
    try
      MemoryStream := TMemoryStream.Create;
      Jpg := TPicture.Create;
      (DataSet.FieldByName(BlobFieldName) as
TBlobField).SaveToStream(MemoryStream);
      MemoryStream.Position := OffsetMemoryStream;
      Jpg.LoadFromStream(MemoryStream);
      ImageExibicao.Picture.Assign(Jpg);
    finally
     // Jpg.Free;
      MemoryStream.Free;
    end
  else
    ImageExibicao.Picture := Nil;
end;





(*procedure TFrmVendas.abrirGaveta;
var
F: textfile;
i: integer;
begin
    AssignFile(F,'\\' + nomePc + '\' + nomeCompartilhamento);
   // messageDlg(nomeCompartilhamento, mtInformation,mbOkcancel,0);
    Rewrite(F);
    Writeln(F,#027+ #112+ #000+ #010+ #100'');  //Abrir Gaveta;
    CloseFile(F);

end; *)

procedure TFrmVendas.abrirGaveta;
var
F: textfile;
i: integer;
begin
    AssignFile(F,'\\' + nomePc + '\' + nomeCompartilhamento);
   // messageDlg(nomeCompartilhamento, mtInformation,mbOkcancel,0);
    Rewrite(F);
    Writeln(F,#027+ #112+ #000+ #010+ #100'');  //Abrir Gaveta;
    CloseFile(F);

end;

procedure TFrmVendas.associarCamposDet;
begin
 dm.tb_detalhes_vendas.fieldByName('id_venda').Value := 0;
  dm.tb_detalhes_vendas.fieldByName('cod_exc').Value := codexc;
 dm.tb_detalhes_vendas.fieldByName('produto').Value := edtProduto.text;
 dm.tb_detalhes_vendas.fieldByName('valor').Value := edtPreco.text;
 dm.tb_detalhes_vendas.fieldByName('quantidade').Value := edtQuantidade.text;
 dm.tb_detalhes_vendas.fieldByName('total').Value := totalItem;
 dm.tb_detalhes_vendas.fieldByName('id_produto').Value := idProduto;
 dm.tb_detalhes_vendas.fieldByName('funcionario').Value := nomeFunc;
  dm.tb_detalhes_vendas.fieldByName('data').Value := DateToStr(date);
  dm.tb_detalhes_vendas.fieldByName('mov').Value := 'normal';
 estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
end;

procedure TFrmVendas.associarCamposVenda;
begin

   dm.tb_vendas.fieldbyname('valor').Value := totalVenda;
   dm.tb_vendas.fieldByName('valorcomdesc').Value := totalcomDesconto;
   dm.tb_vendas.FieldByName('desconto').Value := edtDesconto.Text;
   dm.tb_vendas.fieldByName('data').value := DateToStr(date); // asdatetime e now para passar data e hora
   dm.tb_vendas.fieldByName('hora').value := TimeToStr(Time);
   dm.tb_vendas.fieldByName('funcionario').Value := nomeFunc;
      dm.tb_vendas.fieldByName('valor_entregue').Value := edtValorRecebido.Text;
   dm.tb_vendas.FieldByName('troco').Value := troco;
   dm.tb_vendas.fieldByName('metodo').Value := pagamentoo;

  // dm.tb_vendas.fieldByName('status').Value := 'Conclu�da';
 //  dm.tb_vendas.fieldByName('valor_pago').Value := edtValorRecebido.Text;
  // dm.tb_vendas.fieldByName('troco').Value := troco;
end;

procedure TFrmVendas.buscarProduto;
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
        edtProduto.Text := dm.query_produtos.FieldByName('nome').Value;
        edtDescricao.Text := dm.query_produtos.FieldByName('descricao').Value;
        edtPreco.Text := dm.query_produtos.FieldByName('valor').Value;
        edtEstoque.Text := dm.query_produtos.FieldByName('estoque').Value;

          //Verificando se tem produto para vender
        if strToInt(edtEstoque.Text) >= strtoInt(edtQuantidade.Text) then
        begin
         listar;


        IdProduto := dm.query_produtos.FieldByName('id').Value;

        ExibeFoto(dm.query_produtos, 'imagem', imagem);





                                             ////
        totalItem := (strToFloat(edtQuantidade.Text) * strToFloat(edtPreco.Text)); //- strToFloat(edtDesconto.Text);
        totalVenda := totalVenda + totalItem;
        totalcomDesconto := totalVenda;

        edtTotal.Text := formatFloat('R$ #,,,,0.00',totalItem);
        edtSubTotal.Text := formatFloat('R$ #,,,,0.00',totalVenda);
        edtTotalCompra.Text := formatFloat('R$ #,,,,0.00',totalVenda);


        dm.tb_detalhes_vendas.Insert;

        if edtEstoque.Text  > '0' then
        begin
        edtEstoque.Text := dm.query_produtos.FieldByName('estoque').Value - edtQuantidade.Text;
        end;

        estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
        salvarItens;

                //ATUALIZA��O DO DESCONTO
         if (edtDesconto.Text <> '') or (edtDesconto.Text = '0') then
         begin
            totalcomDesconto := totalVenda - strToFloat(edtDesconto.Text);
            edtTotalCompra.Text := formatFloat('R$ #,,,,0.00', totalcomDesconto);
         end
          else
           begin
             totalcomDesconto := totalVenda;
             edtTotalCompra.Text := formatFloat('R$ #,,,,0.00', totalcomDesconto);;
           end;
            //
           if edtDesconto.Text = '0' then
                 begin
                 troco := strToFloat(edtValorRecebido.Text) - totalVenda;
                 edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
                 totalcomDesconto := totalVenda;
                 end
                  else
                    begin
                       troco := strToFloat(edtValorRecebido.Text) - totalcomDesconto;
                         edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
                    end;

          if (edtDesconto.text <> '0') and (edtValorRecebido.Text = '0') then
            begin
                valorZerado := 0;
                edtTroco.Text := FormatFloat('R$ #,,,,0.00', valorZerado);
            end;

         if edtDesconto.Text = '0' then
         begin
         troco := strToFloat(edtValorRecebido.Text) - totalVenda;
         edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
         totalcomDesconto := totalVenda;

         end
          else
            begin
               troco := strToFloat(edtValorRecebido.Text) - totalcomDesconto;
                 edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
            end;

            descatz := strToFloat(edtDesconto.Text);
            totalcomDesconto := totalcomDesconto - descatz;
            edtvalorRecebido.Text := FloatToStr(totalcomDesconto);


        edtValorRecebido.Enabled := true;

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
             limparProdutos;
            end;
        end
          else
          begin
          limparProdutos;
          end;



end;



procedure TFrmVendas.buscarproduto2;
begin


                pnlEstoque.Visible := false;
              lblEstoque.Visible := false;
                Label12.Visible := false;
     dm.query_produtos.Close;
     dm.query_produtos.SQL.Clear;
     dm.query_produtos.SQL.Add('select * from produtos where id = :id');
     dm.query_produtos.ParamByName('id').Value := idProduto;
     dm.query_produtos.Open;

      if idProduto <> '' then
      begin
        edtProduto.Text := nomeProd;
        edtDescricao.Text := descProd;
        edtPreco.Text := valorProd;
        edtEstoque.Text := estoqueProd;

        if edtEstoque.Text = '0' then
        begin
          messageDlg('Sem produto em estoque!!',mtWarning,mbOKCancel,0);
          limparProdutos;
          idProduto := '';
           pnlEstoque.Visible := true;
              lblEstoque.Visible := true;
              pnlEstoque.Color := ConverterRBG(234, 139, 139);

          exit;

        end;


         if strToInt(edtEstoque.Text) >= strtoInt(edtQuantidade.Text) then
        begin
          totalItem := (strToFloat(edtQuantidade.Text) * strToFloat(edtPreco.Text)); //- strToFloat(edtDesconto.Text);
          totalVenda := totalVenda + totalItem;
          totalcomDesconto := totalVenda;

          edtTotal.Text := formatFloat('R$ #,,,,0.00',totalItem);
          edtSubTotal.Text := formatFloat('R$ #,,,,0.00',totalVenda);
          edtTotalCompra.Text := formatFloat('R$ #,,,,0.00',totalVenda);
          dm.tb_detalhes_vendas.Insert;

              if edtEstoque.Text  > '0' then
            begin
            edtEstoque.Text := dm.query_produtos.FieldByName('estoque').Value - edtQuantidade.Text;

            end;

            estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
            if idProduto <> '' then
            begin
            buscarstatus := 'buscando';
            salvarItens;
            end;

            if (edtValorRecebido.Text = '0') and (edtDesconto.Text = '0') then
                begin
                    totalcomDesconto := totalcomDesconto - descatz;
                    edtvalorRecebido.Text := FloatToStr(totalcomDesconto);
                end;

             if edtDesconto.Text = '0' then
             begin
             troco := strToFloat(edtValorRecebido.Text) - totalVenda;
             edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
             totalcomDesconto := totalVenda;

             end
              else
                begin
                   troco := strToFloat(edtValorRecebido.Text) - totalcomDesconto;
                     edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
                end;

                    totalcomDesconto := totalComDesconto - descatz;
                    edtvalorRecebido.Text := FloatToStr(totalcomDesconto);



              (*   if edtValorRecebido.Text = '0'  then
                  begin
                       valorZerado := 0;
                    edtTroco.Text := FormatFloat('R$ #,,,,0.00', valorZerado);
                    troco := valorZerado;
                  end;*)


        end
          else
            begin
              messageDlg('A quantidade pedida � maior que a dispon�vel em estoque!',mtWarning,mbOKCancel,0);
              limparProdutos;
              edtQuantidade.Text := '1';
              edtQuantidade.SetFocus;
              pnlEstoque.Visible := true;
              lblEstoque.Visible := true;
              pnlEstoque.Color := ConverterRBG(234, 139, 139);
            end;
      end;


end;

procedure TFrmVendas.edtCodBarrasChange(Sender: TObject);
begin

    (*if length(edtCodBarras.Text) = 13 then
     begin
        dm.query_produtos.Close;
        dm.query_produtos.sql.Clear;
        dm.query_produtos.SQL.Add('Select * from produtos where codigo =' + QuotedStr(Trim(EdtcodBarras.Text)));;
        dm.query_produtos.Open;
       if dm.query_produtos.IsEmpty then
          begin
            ShowMessage('Produto não cadastrado, entre como administrador e o cadastre!');
            edtCodBarras.SetFocus;
            edtCodBarras.Text := '';
            pnlEstoque.Visible := true;
                Label12.Visible := true;
              pnlEstoque.Color := ConverterRBG(255,255, 0);
            exit;
          end;
     end;   *)

     if length(edtCodBarras.Text) = 13 then
     begin
        dm.query_produtos.Close;
        dm.query_produtos.sql.Clear;
        dm.query_produtos.SQL.Add('Select * from produtos where codigo =' + QuotedStr(Trim(EdtcodBarras.Text)));;
        dm.query_produtos.Open;
       if dm.query_produtos.IsEmpty then
          begin
            ShowMessage('Produto não cadastrado, entre como administrador e o cadastre!');
            edtCodBarras.SetFocus;
            edtCodBarras.Text := '';
            pnlEstoque.Visible := true;
                Label12.Visible := true;
              pnlEstoque.Color := ConverterRBG(255,255, 0);
            exit;
          end;
     end;



   if edtQuantidade.Text = '' then
   begin
     edtQuantidade.Text := '1';

   end;

   if edtpreco.Text = '' then
   begin
     edtpreco.Text := '1';
   end;
         if length(edtCodBarras.Text) = 13 then
    begin
       buscarProduto;
    end;


end;

procedure TFrmVendas.edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13]) then
Key := '0';

end;

procedure TFrmVendas.edtDescontoChange(Sender: TObject);

begin
if (edtDesconto.Text <> '') or (edtDesconto.Text = '0') then
 begin
    totalcomDesconto := totalVenda - strToFloat(edtDesconto.Text);
    edtTotalCompra.Text := formatFloat('R$ #,,,,0.00', totalcomDesconto);
 end
  else
   begin
     totalcomDesconto := totalVenda;
     edtTotalCompra.Text := formatFloat('R$ #,,,,0.00', totalcomDesconto);;
   end;
    //
   if edtDesconto.Text = '0' then
         begin
         troco := strToFloat(edtValorRecebido.Text) - totalVenda;
         edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
         totalcomDesconto := totalVenda;
         end
          else
            begin
               troco := strToFloat(edtValorRecebido.Text) - totalcomDesconto;
                 edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
            end;

  if (edtDesconto.text <> '0') and (edtValorRecebido.Text = '0') then
    begin
        valorZerado := 0;
        edtTroco.Text := FormatFloat('R$ #,,,,0.00', valorZerado);
    end;




end;

procedure TFrmVendas.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13,#44]) then
Key := '0';

end;



procedure TFrmVendas.edtQuantidadeChange(Sender: TObject);
begin
 if edtQuantidade.Text = '0' then
  begin
    edtQuantidade.text := '1';
  end;




end;

procedure TFrmVendas.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13]) then
Key := '0';

end;


procedure TFrmVendas.edtSubTotalChange(Sender: TObject);
begin


   // troco := strToFloat(edtValorRecebido.Text) - totalVenda;
    //edtTroco.Text := formatFloat('R$ #,,,,0.00',troco);

end;

procedure TFrmVendas.edtTotalCompraChange(Sender: TObject);
begin
 if (trim(edtTotalCompra.Text) <> '0') or (edtTotalCompra.Text <> '') then
  begin
    edtDesconto.Enabled := true;
    edtValorRecebido.Enabled := true;
  end;
end;

procedure TFrmVendas.edtValorRecebidoChange(Sender: TObject);
begin

   if (trim(edtValorRecebido.Text) <> '0') and (edtValorRecebido.Text <> '')  then
   begin
     if edtDesconto.Text = '0' then
         begin
         troco := strToFloat(edtValorRecebido.Text) - totalVenda;
         edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
         totalcomDesconto := totalVenda;
         end
          else
            begin
               
               troco := strToFloat(edtValorRecebido.Text) - totalcomDesconto;
                 edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
            end;


   end
    else
     begin
        valorZerado := 0;
        edtTroco.Text := FormatFloat('R$ #,,,,0.00', valorZerado);
     end;







end;

procedure TFrmVendas.edtValorRecebidoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13,#44]) then
Key := '0';
end;



procedure TFrmVendas.FormActivate(Sender: TObject);

begin

listar;
if totalVenda > 0 then
begin
totalVenda := totalVenda - totalProdutos;
end;

edtSubTotal.Text := formatFloat('R$ #,,,,0.00',totalVenda);
//formatFloat('R$ #,,,,0.00',totalVenda);
edtTotalCompra.Text:= formatFloat('R$ #,,,,0.00',totalVenda);

edtTotal.Text := '0';
edtEstoque.Text := FloatToStr(estoqueCancel);
totalcomDesconto := totalVenda;
descatz := strToFloat(edtDesconto.Text);
conversor := totalcomDesconto - descatz;
edtValorRecebido.Text := FloatToStr(conversor);

dm.query_det_vendas.Close;
    dm.query_det_vendas.SQL.clear;
    dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = 0 and funcionario = :func order by id desc');
    dm.query_det_vendas.ParamByName('func').Value := nomeFunc; // informando os parametros a passar para cargo e o que comparar com id
    dm.query_det_vendas.Open;

    if dm.query_det_vendas.IsEmpty then
      begin
        edtValorRecebido.Text := '0';
      end;

 






end;

procedure TFrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MediaPlayer1.Destroy;
end;

procedure TFrmVendas.FormDestroy(Sender: TObject);
begin
//MediaPlayer1.Destroy;
end;

procedure TFrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key = 119 then
   begin
            buscarProd := 'produto';
             if edtValorRecebido.Text = '' then
             begin
                edtValorRecebido.Text := '0';
             end;
             dadosProdutos := edtProduto.Text;
               pnlEstoque.Visible := false;
              lblEstoque.Visible := false;
                Label12.Visible := false;
             FrmBuscarProduto := TFrmBuscarProduto.create(self);
             FrmBuscarProduto.showModal;


          if confirm <> '' then
          begin
            buscarProduto2;
            confirm := '';
          end;
   end;

 if key = 115 then
  begin
    FrmRetiradaCaixa := TFrmRetiradaCaixa.Create(self);
    FrmRetiradaCaixa.Showmodal;
  end;




 if key = 27 then
  begin
    vendaChamada := 'normal';
    FrmCancelarItem := TFrmCancelarItem.create(self);
    FrmCancelarItem.show;
  end;

  (*if key = 13 then
  begin
        dm.tb_vendas.Insert;
   if messagedlg('Deseja fechar a venda?',mtInformation, mbYesNo,0) = mrYes then
    begin

    salvarVendas;


    end;
  end;*)

         //ABRIR VENDA DIRETA NO FORM DE VENDA
   if Key = 121 then
  begin
    limparProdutos;
    Embutida := 'vendadireta';
    FrmVendaEmbutida := TFrmVendaEmbutida.create(self);
    FrmVendaEmbutida.show;
  end;


 //limpar todas vendas

 if key = 117 then
  begin
    if MessageDlg('Deseja Excluir o Registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
    //Confirmation pq � uma pergunta. mbyes e mbno, s�o os dois botoes de escolha. mryes = resposta do usuario
        begin
           codexc := 0;

            //RECUPERAR ID E QUANTIDADE DOS PRODUTOS

         dm.query_coringa.Close;
         dm.query_coringa.SQL.Clear;
         dm.query_coringa.SQL.Add('select * from detalhes_vendas where id_venda = 0');
         dm.query_coringa.Open;

         if dm.query_coringa['id_venda'] = 0 then
         begin
         if not dm.query_coringa.IsEmpty then
          begin


               while not dm.query_coringa.Eof do
                 begin
                   idrest := dm.query_coringa['id_produto'];
                   quantrest:=  dm.query_coringa['quantidade'];

                  //RECUPERAR VALOR ATUAL

                     dm.query_produtos.SQL.Clear;
                     dm.query_produtos.SQL.Add('SELECT * FROM produtos where id = :id');
                     dm.query_produtos.ParamByName('id').Value := idrest;
                     dm.query_produtos.OPEN;

                     if not dm.query_produtos.IsEmpty then
                        begin
                        estoqueP := dm.query_produtos['estoque'];
                        end;

                  //ATUALIZAR O ESTOQUE
                      estoque := estoqueP + quantrest;

                     dm.query_produtos.Close;
                     dm.query_produtos.SQL.Clear;
                     dm.query_produtos.SQL.Add('UPDATE  produtos set estoque = :estoque where id = :id');
                     dm.query_produtos.ParamByName('estoque').Value := estoque;
                     dm.query_produtos.ParamByName('id').Value := idrest;
                     dm.query_produtos.ExecSQL;






                   dm.query_coringa.Next;

                 end;

             (*quantidade := dm.query_coringa.FieldByName('quantidade').Value;

             idProduto := dm.query_coringa.FieldByName('id_produto').Value;

             dm.query_coringa.Close;
             dm.query_coringa.SQL.Clear;
             dm.query_coringa.SQL.Add('Select sum(valor) as totall from detalhes_vendas where id_venda = 0 ');
             dm.query_coringa.Open;

             totalProdutos := dm.query_coringa.FieldByName('totall').AsFloat;
               *)

            end;

         end
          else
            begin
            MessageDlg('Nenhum produto selecionado!', mtInformation, mbOKCancel,0);
               exit;
            end;

        (* //RECUPERAR O ESTOQUE DO PRODUTO
         dm.query_produtos.Close;
         dm.query_produtos.SQL.Clear;
         dm.query_produtos.SQL.Add('select * from produtos where id = :id');
         dm.query_produtos.ParamByName('id').Value := idProduto;
         dm.query_produtos.Open;


         if not dm.query_produtos.IsEmpty then
          begin

            estoque := dm.query_produtos.FieldByName('estoque').Value;

            end;

           *)

          (*
          //RECUPERAR O ESTOQUE DO ITEM CANCELADO
            estoque := estoque + quantidade;

            dm.query_produtos.Close;
            dm.query_produtos.SQL.Clear;
            dm.query_produtos.SQL.Add('UPDATE PRODUTOS set estoque = :estoque where id = :id');
            dm.query_produtos.ParamByName('estoque').value := estoque;
            dm.query_produtos.ParamByName('id').value := idProduto;
            dm.query_produtos.ExecSQL;
              *)
              try

               dm.query_coringa.Close;
               dm.query_coringa.SQL.clear;
               dm.query_coringa.SQL.Add('DELETE FROM detalhes_vendas where id_venda = 0 ');
               dm.query_coringa.Execute;

               MessageDlg('Excluido com Sucesso!', mtInformation, mbOKCancel,0);
               if totalcomDesconto = 0 then
                begin
                  conversor := 0;
                end;
                totalcomDesconto := 0;
                totalVenda := 0;
                totalVendaemb := 0;

                limpar;
                limparProdutos;
                dm.query_det_vendas.Close;
               dm.query_det_vendas.Open;

                estoqueCancel := estoque;
                estoque := 0;
                quantidade := 0;
                totalProdutos := 0;
                vendaChamada := '';

            except

               exit;

            end;
       end;

  end;



  if key = 113 then
  begin
    chamadaPagamento := 'Forma';
    FrmPagamento := TFrmPagamento.create(self);
    FrmPagamento.ShowModal;

    if pagamentoo <> '' then
    begin
    dm.tb_vendas.Insert;
      if totalcomDesconto <> 0 then
      begin
         if edtDesconto.Text = '' then
            begin
              edtDesconto.Text := '0';
            end;

         if edtValorRecebido.Text = '' then
              begin
                edtValorRecebido.Text := '0';
              end;
        salvarVendas;

      end;
    end;


  end;

end;

procedure TFrmVendas.FormShow(Sender: TObject);
begin

limparProdutos;

dm.tb_vendas.Active := false;
dm.tb_vendas.Active := true;
dm.tb_vendas.Insert;

dm.tb_detalhes_vendas.active := false;
dm.tb_detalhes_vendas.active := true;


   limpar;

      edtQuantidade.Text := '1';
      totalcomDesconto := 0;
      totalVenda := 0;
      estoque := 0;
      totalItem := 0;
      troco := 0;
      valorZerado := 0;  //para troco
      verificaQtd := 0 ;


      lblHora.Caption := TimeToStr(time);
    lblData.Caption := DateToStr(date);


      pnlEstoque.Visible := false;
              lblEstoque.Visible := false;
end;

procedure TFrmVendas.gerarNFCE;
Var
NotaF: NotaFiscal;
item : integer;
Produto: TDetCollectionItem;
InfoPgto: TpagCollectionItem;

begin
nfce.NotasFiscais.Clear;
NotaF := nfce.NotasFiscais.Add;



     //Buscando dados dsos emitentes   e para nota
  dm.query_dados_emitente.Close;
  dm.query_dados_emitente.SQL.Clear;
  dm.query_dados_emitente.SQL.Add('select * from dados_emitente');
  dm.query_dados_emitente.Open;

  if not dm.query_dados_emitente.IsEmpty then
  begin
     cnpj := dm.query_dados_emitente.FieldByName('cnpj').Value;
    ie := dm.query_dados_emitente.FieldByName('ie').Value;
     nome  := dm.query_dados_emitente.FieldByName('razao_social').Value;
    fantasia := dm.query_dados_emitente.FieldByName('fantasia').Value;
      tel  := dm.query_dados_emitente.FieldByName('telefone').Value;
      cep := dm.query_dados_emitente.FieldByName('cep').Value;
      logr := dm.query_dados_emitente.FieldByName('logradouro').Value;
       num := dm.query_dados_emitente.FieldByName('num').Value;
     compl := dm.query_dados_emitente.FieldByName('complemento').Value;
       bairro := dm.query_dados_emitente.FieldByName('bairro').Value;
      codcid := dm.query_dados_emitente.FieldByName('cod_cidade').Value;
      cidade  := dm.query_dados_emitente.FieldByName('cidade').Value;
     uf  := dm.query_dados_emitente.FieldByName('uf').Value;
      tpemp  := dm.query_dados_emitente.FieldByName('tipo_empresa').Value;

  end;




  //DADOS DA NOTA FISCAL

  NotaF.NFe.Ide.natOp     := 'VENDA';
  if pagamento = 'Cart�o' then
       begin
       NotaF.NFe.Ide.indPag := ipPrazo;
       end;

       if pagamento = 'Dinheiro' then
       begin
        NotaF.NFe.Ide.indPag := ipVista;
       end;

  NotaF.NFe.Ide.modelo    := 65;
  NotaF.NFe.Ide.serie     := 1;
  NotaF.NFe.Ide.nNF       := strToInt(idVenda);
  NotaF.NFe.Ide.dEmi      := Date;
  NotaF.NFe.Ide.dSaiEnt   := Date;
  NotaF.NFe.Ide.hSaiEnt   := Now;
  NotaF.NFe.Ide.tpNF      := tnSaida;
  NotaF.NFe.Ide.tpEmis    := teNormal;
  NotaF.NFe.Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta vari�vel quando for para ambiente de produ��o
  NotaF.NFe.Ide.verProc   := '1.0.0.0'; //Vers�o do seu sistema
  NotaF.NFe.Ide.cUF       := 33;    //C�digo da cidade
  NotaF.NFe.Ide.cMunFG    := codcid;  //preciso alterar de acordo com o codigo de emissao de nota nfce para meu municipio
  NotaF.NFe.Ide.finNFe    := fnNormal;






  //DADOS DO EMITENTE

  NotaF.NFe.Emit.CNPJCPF           := cnpj;
  NotaF.NFe.Emit.IE                := ie;
  NotaF.NFe.Emit.xNome             := nome;
  NotaF.NFe.Emit.xFant             := fantasia;

  NotaF.NFe.Emit.EnderEmit.fone    := tel;
  NotaF.NFe.Emit.EnderEmit.CEP     := cep;
  NotaF.NFe.Emit.EnderEmit.xLgr    := logr;
  NotaF.NFe.Emit.EnderEmit.nro     := num;
  NotaF.NFe.Emit.EnderEmit.xCpl    := compl;
  NotaF.NFe.Emit.EnderEmit.xBairro := bairro;
  NotaF.NFe.Emit.EnderEmit.cMun    := codcid;
  NotaF.NFe.Emit.EnderEmit.xMun    := cidade;
  NotaF.NFe.Emit.EnderEmit.UF      := uf;
  NotaF.NFe.Emit.enderEmit.cPais   := 1058;
  NotaF.NFe.Emit.enderEmit.xPais   := 'BRASIL';

  NotaF.NFe.Emit.IEST              := '';
 // NotaF.NFe.Emit.IM                := '2648800'; // Preencher no caso de existir servi�os na nota
  //NotaF.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se � permitido


                             // a inclus�o de servi�os na NFe

  if tpemp = 'Simples Nacional' then
  begin
   NotaF.NFe.Emit.CRT := crtSimplesNacional;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
  end;

   if tpemp = 'Simples Nacional, excesso sublimite de receita bruta' then
  begin
   NotaF.NFe.Emit.CRT := crtSimplesExcessoReceita;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
  end;

   if tpemp = 'Regime Normal' then
  begin
   NotaF.NFe.Emit.CRT := crtRegimeNormal;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
  end;







  //DADOS DO DESTINAT�RIO

  // NotaF.NFe.Dest.CNPJCPF           := '05481336000137';
  //NotaF.NFe.Dest.IE                := '687138770110';
  //NotaF.NFe.Dest.ISUF              := '';
  //NotaF.NFe.Dest.xNome             := 'D.J. COM. E LOCA��O DE SOFTWARES LTDA - ME';

//
//  NotaF.NFe.Dest.EnderDest.Fone    := '1532599600';
//  NotaF.NFe.Dest.EnderDest.CEP     := 18270170;
//  NotaF.NFe.Dest.EnderDest.xLgr    := 'Rua Coronel Aureliano de Camargo';
//  NotaF.NFe.Dest.EnderDest.nro     := '973';
//  NotaF.NFe.Dest.EnderDest.xCpl    := '';
//  NotaF.NFe.Dest.EnderDest.xBairro := 'Centro';
//  NotaF.NFe.Dest.EnderDest.cMun    := 3554003;
//  NotaF.NFe.Dest.EnderDest.xMun    := 'Tatui';
//  NotaF.NFe.Dest.EnderDest.UF      := 'SP';
//  NotaF.NFe.Dest.EnderDest.cPais   := 1058;
//  NotaF.NFe.Dest.EnderDest.xPais   := 'BRASIL';



  //ITENS DA VENDA NA NOTA

  //RELACIONANDO OS ITENS COM A  VENDA
  item := 1;
  dm.query_det_vendas.Close;
  dm.query_det_vendas.SQL.Clear;
  dm.query_det_vendas.SQL.Add('select * from detalhes_vendas WHERE id_venda = :num order by id asc') ;
  dm.query_det_vendas.ParamByName('num').Value := idVenda;
  dm.query_det_vendas.Open;
   dm.query_det_vendas.First;

   while not dm.query_det_vendas.eof do
       begin
      Produto := NotaF.NFe.Det.New;
      Produto.Prod.nItem    := item; // N�mero sequencial, para cada item deve ser incrementado
      Produto.Prod.cProd    := '123456';
      Produto.Prod.cEAN     := '7896523206646';
      Produto.Prod.xProd    := dm.query_det_vendas.FieldByName('produto').Value;
      Produto.Prod.NCM      := '94051010'; // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
      Produto.Prod.EXTIPI   := '';
      Produto.Prod.CFOP     := '5101';
      Produto.Prod.uCom     := 'UN';
      Produto.Prod.qCom     := dm.query_det_vendas.FieldByName('quantidade').Value;
      Produto.Prod.vUnCom   := dm.query_det_vendas.FieldByName('valor').Value;
      Produto.Prod.vProd    := dm.query_det_vendas.FieldByName('total').Value;


      //INFORMA��ES DE IMPOSTOS SOBRE OS PRODUTOS
      Produto.Prod.cEANTrib  := '7896523206646';
      Produto.Prod.uTrib     := 'UN';
      Produto.Prod.qTrib     := 1;
      Produto.Prod.vUnTrib   := 100;

      Produto.Prod.vOutro    := 0;
      Produto.Prod.vFrete    := 0;
      Produto.Prod.vSeg      := 0;
      Produto.Prod.vDesc     := 0;

      Produto.Prod.CEST := '1111111';

      Produto.infAdProd := 'Informacao Adicional do Produto';


       // lei da transparencia nos impostos
      Produto.Imposto.vTotTrib := 0;
      Produto.Imposto.ICMS.CST          := cst00;
      Produto.Imposto.ICMS.orig    := oeNacional;
      Produto.Imposto.ICMS.modBC   := dbiValorOperacao;
      Produto.Imposto.ICMS.vBC     := 100;
      Produto.Imposto.ICMS.pICMS   := 18;
      Produto.Imposto.ICMS.vICMS   := 18;
      Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
      Produto.Imposto.ICMS.pMVAST  := 0;
      Produto.Imposto.ICMS.pRedBCST:= 0;
      Produto.Imposto.ICMS.vBCST   := 0;
      Produto.Imposto.ICMS.pICMSST := 0;
      Produto.Imposto.ICMS.vICMSST := 0;
      Produto.Imposto.ICMS.pRedBC  := 0;

           // partilha do ICMS e fundo de probreza
      Produto.Imposto.ICMSUFDest.vBCUFDest      := 0.00;
      Produto.Imposto.ICMSUFDest.pFCPUFDest     := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSUFDest    := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSInter     := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSInterPart := 0.00;
      Produto.Imposto.ICMSUFDest.vFCPUFDest     := 0.00;
      Produto.Imposto.ICMSUFDest.vICMSUFDest    := 0.00;
      Produto.Imposto.ICMSUFDest.vICMSUFRemet   := 0.00;



      item := item + 1;
      dm.query_det_vendas.Next;
   end;

   //totalizando

    NotaF.NFe.Total.ICMSTot.vBC     := 100;
  NotaF.NFe.Total.ICMSTot.vICMS   := 18;
  NotaF.NFe.Total.ICMSTot.vBCST   := 0;
  NotaF.NFe.Total.ICMSTot.vST     := 0;
  NotaF.NFe.Total.ICMSTot.vProd   := totalVenda;
  NotaF.NFe.Total.ICMSTot.vFrete  := 0;
  NotaF.NFe.Total.ICMSTot.vSeg    := 0;
  NotaF.NFe.Total.ICMSTot.vDesc   := strToFloat(edtDesconto.Text);
  NotaF.NFe.Total.ICMSTot.vII     := 0;
  NotaF.NFe.Total.ICMSTot.vIPI    := 0;
  NotaF.NFe.Total.ICMSTot.vPIS    := 0;
  NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
  NotaF.NFe.Total.ICMSTot.vOutro  := 0;
  NotaF.NFe.Total.ICMSTot.vNF     := totalcomDesconto;

    // lei da transparencia de impostos
  NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

  // partilha do icms e fundo de probreza
  NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;


  NotaF.NFe.Transp.modFrete := mfSemFrete;  //SEM FRETE

  // YA. Informa��es de pagamento

  InfoPgto := NotaF.NFe.pag.New;
  if pagamentoo = 'Cart�o' then
       begin
        InfoPgto.indPag := ipPrazo;
        InfoPgto.tPag := fpCartaoCredito
       end;

       if pagamentoo = 'Dinheiro' then
       begin
         InfoPgto.indPag := ipVista;
         InfoPgto.tPag := fpDinheiro;
       end;

  InfoPgto.vPag   := totalcomDesconto;

  //RECUPERAR O NUMERO DE SERIE DO CERTIFICADO
  nfce.Configuracoes.Certificados.NumeroSerie := certificadoDig;

  //ASSINAR

  nfce.NotasFiscais.Assinar;
  nfce.Enviar(Integer(idVenda));
  ShowMessage(nfce.WebServices.StatusServico.Msg);

end;

procedure TFrmVendas.imprimirCupom;
begin


      if messagedlg('Deseja imprimir o comprovante?',mtConfirmation, mbYESNO,0) = mrYes then
        begin


          //VERIFICANDO SE TEM VENDA DIRETA EMBUTIDA
          dm.query_det_vendas.Close;
          dm.query_det_vendas.SQL.clear;

          dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id and mov = :mov');
          dm.query_det_vendas.ParamByName('id').Value := idVenda;
           dm.query_det_vendas.ParamByName('mov').Value := 'Venda Direta';
          dm.query_det_vendas.Open;

         if not dm.query_det_vendas.IsEmpty then
           begin
             dm.query_vendas.Close;
             dm.query_vendas.SQL.clear;
             dm.query_vendas.SQL.Add('SELECT * FROM vendas where id = :id');
             dm.query_vendas.ParamByName('id').Value := idVenda;
              dm.query_vendas.Open;

            dm.query_det_vendas.Close;
            dm.query_det_vendas.SQL.clear;
            dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id');
             dm.query_det_vendas.ParamByName('id').Value := idVenda;

            dm.query_det_vendas.Open;

             dm.query_mov.Close;
            dm.query_mov.SQL.clear;
            dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where id_movimento = :id');
             dm.query_mov.ParamByName('id').Value := idVenda;

            dm.query_mov.Open;




             //CHAMAR O RELAT�RIO
             dm.rel_comprovante.LoadFromFile(GETCURRENTDIR + '/rel/agoravai.fr3');


              dm.rel_comprovante.PrintOptions.ShowDialog := false;
              dm.rel_comprovante.PrepareReport;
              dm.rel_comprovante.print;
           end
              ELSE
                BEGIN
                 dm.query_vendas.Close;
                 dm.query_vendas.SQL.clear;
                 dm.query_vendas.SQL.Add('SELECT * FROM vendas where id = :id');
                 dm.query_vendas.ParamByName('id').Value := idVenda;
                  dm.query_vendas.Open;

                 dm.query_det_vendas.Close;
                 dm.query_det_vendas.SQL.clear;
                 dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id');
                 dm.query_det_vendas.ParamByName('id').Value := idVenda;
                  dm.query_det_vendas.Open;


             dm.query_mov.Close;
            dm.query_mov.SQL.clear;
            dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where id_movimento = :id');
             dm.query_mov.ParamByName('id').Value := idVenda;

            dm.query_mov.Open;


                       //CHAMAR O RELAT�RIO
                 dm.rel_comprovante.LoadFromFile(GETCURRENTDIR + '/rel/comprovante.fr3');
                 //dm.rel_comprovante.Variables['nome'] := dm.query_det_vendas.FieldByName('produto').value;
                // dm.rel_comprovante.Variables['valor'] := dm.query_det_vendas.FieldByName('valor').value;
                // dm.rel_comprovante.Variables['quantidade'] := dm.query_det_vendas.FieldByName('quantidade').value;
                 //dm.rel_comprovante.Variables['total'] := dm.query_det_vendas.FieldByName('total').value;
                 //dm.rel_comprovante.ShowReport;

                  dm.rel_comprovante.PrintOptions.ShowDialog := false;
                  dm.rel_comprovante.PrepareReport;
                  dm.rel_comprovante.print;

                END;
        end;

         //dm.rel_comprovante.Variables['dataInicial'] := dataInicial.Date;
             //     dm.rel_comprovante.Variables['dataFinal'] := dataFinal.Date;


        //CHAMAR O RELAT�RIO
          // dm.rel_comprovante.LoadFromFile(GETCURRENTDIR + '/rel/comprovante.fr3');

        //dm.rel_comprovante.ShowReport;

      //  dm.rel_comprovante.PrintOptions.ShowDialog := false;
       // dm.rel_comprovante.PrepareReport;
      //  dm.rel_comprovante.print;
       // showMessage('Ap�s retirar o comprovante pressione enter para 2� via');

        //segVia := 'ok';

       (* if messageDlg('Deseja imprimir a 2� via?', mtInformation, mbYESNO,0) = mrYes then
        begin
          //VERIFICANDO SE TEM VENDA DIRETA EMBUTIDA
          dm.query_det_vendas.Close;
          dm.query_det_vendas.SQL.clear;

          dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id and mov = :mov');
          dm.query_det_vendas.ParamByName('id').Value := idVenda;
           dm.query_det_vendas.ParamByName('mov').Value := 'Venda Direta';
          dm.query_det_vendas.Open;

         if not dm.query_det_vendas.IsEmpty then
           begin
             dm.query_vendas.Close;
             dm.query_vendas.SQL.clear;
             dm.query_vendas.SQL.Add('SELECT * FROM vendas where id = :id');
             dm.query_vendas.ParamByName('id').Value := idVenda;
              dm.query_vendas.Open;

            dm.query_det_vendas.Close;
            dm.query_det_vendas.SQL.clear;
            dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id');
             dm.query_det_vendas.ParamByName('id').Value := idVenda;

            dm.query_det_vendas.Open;

               dm.query_mov.Close;
          dm.query_mov.SQL.clear;
          dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where id_movimento = :id');
           dm.query_mov.ParamByName('id').Value := idVenda;

          dm.query_mov.Open;





             //CHAMAR O RELAT�RIO
             dm.rel_comprovante.LoadFromFile(GETCURRENTDIR + '/rel/agoravai.fr3');


              dm.rel_comprovante.PrintOptions.ShowDialog := false;
              dm.rel_comprovante.PrepareReport;
              dm.rel_comprovante.print;
           end
              ELSE
                BEGIN
                 dm.query_vendas.Close;
                 dm.query_vendas.SQL.clear;
                 dm.query_vendas.SQL.Add('SELECT * FROM vendas where id = :id');
                 dm.query_vendas.ParamByName('id').Value := idVenda;
                  dm.query_vendas.Open;

                 dm.query_det_vendas.Close;
                 dm.query_det_vendas.SQL.clear;
                 dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id');
                 dm.query_det_vendas.ParamByName('id').Value := idVenda;
                  dm.query_det_vendas.Open;

                         dm.query_mov.Close;
              dm.query_mov.SQL.clear;
              dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where id_movimento = :id');
               dm.query_mov.ParamByName('id').Value := idVenda;

              dm.query_mov.Open;




                       //CHAMAR O RELAT�RIO
                 dm.rel_comprovante.LoadFromFile(GETCURRENTDIR + '/rel/comprovante.fr3');
                 //dm.rel_comprovante.Variables['nome'] := dm.query_det_vendas.FieldByName('produto').value;
                // dm.rel_comprovante.Variables['valor'] := dm.query_det_vendas.FieldByName('valor').value;
                // dm.rel_comprovante.Variables['quantidade'] := dm.query_det_vendas.FieldByName('quantidade').value;
                 //dm.rel_comprovante.Variables['total'] := dm.query_det_vendas.FieldByName('total').value;
                 //dm.rel_comprovante.ShowReport;

                  dm.rel_comprovante.PrintOptions.ShowDialog := false;
                  dm.rel_comprovante.PrepareReport;
                  dm.rel_comprovante.print;

                END;
        end; *)


end;

procedure TFrmVendas.iniciarNFCE;
var
caminhoNFCE :string;
begin
caminhoNFCE := ExtractFilePath(Application.ExeName) + 'nfe\';

nfce.Configuracoes.Arquivos.PathSchemas := caminhoNFCE;
end;

procedure TFrmVendas.limpar;
begin


 edtTotal.Text := '0';
 edtSubTotal.Text := '0';
 edtDesconto.Text := '0';
 edtTotalCompra.Text := '0';
 edtValorRecebido.Text := '0';
 edtTroco.Text := '0';

 limparFoto;
end;

procedure TFrmVendas.limparFoto;
var
caminhoImg : string;
begin
    caminhoImg := GetCurrentDir + '\img\sem-foto.jpg';
    // ExtractFileDir(GetCurrentDir) + '\Debug\img\sem-foto.jpg';
   imagem.Picture.LoadFromFile(caminhoImg);
end;

procedure TFrmVendas.limparProdutos;
begin

 edtProduto.text := '';
 edtDescricao.Text := '';
 edtPreco.text := '0';
 //edtQuantidade.Text := '1';
 edtEstoque.text := '';

 totalItem := 0;
 limparfoto;
end;



procedure TFrmVendas.listar;
begin
   dm.query_det_vendas.Close;
    dm.query_det_vendas.SQL.clear;
    dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = 0 and funcionario = :func order by id desc');
    dm.query_det_vendas.ParamByName('func').Value := nomeFunc; // informando os parametros a passar para cargo e o que comparar com id
       // passando parametro e esse id no final vem da variavel no inicio do cod
    // dm.query_det_vendas.ParamByName('id_venda').Value := idVenda;
    dm.query_det_vendas.Open;// inicia a query /abrir

DBGrid1.Columns[0].Alignment := taCenter;//ALINHAR O CAMPO QUANTIDADE DA GRID NO MEIO
DBGrid1.Columns[3].Alignment := taCenter;
DBGrid1.Columns[2].Alignment := taLeftJustify;
DBGrid1.Columns[4].Alignment := taLeftJustify;
end;



procedure TFrmVendas.salvarItens;
begin
if codexc = 0 then
begin
codexc := 1;
end;
//MediaPlayer1.close;
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
    dm.query_produtos.ParamByName('id').Value := idProdutoEst;
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
//edtProduto.Text := '';
if buscarstatus = '' then
  begin
    MediaPlayer1.FileName := GetCurrentDir + '\img\barCode.wav';
           //ExtractFileDir(GetCurrentDir) + '\Debug\img\barCode.wav';   //Pegando o audio
           MediaPlayer1.Open; //abrindo o audio
           MediaPlayer1.Play; // executando
//MessageDlg('Salvo com sucesso!',mtInformation, mbOKCancel,0);

 end;

  buscarstatus := '';




end;

procedure TFrmVendas.salvarVendas;
var
svDesc : double;
begin
 svDesc := strToFloat(edtDesconto.Text);
  associarCamposVenda;

      dm.tb_vendas.Post;



      //RELACIONAR O ID DA VENDA COM OS ID_VENDA DOS ITENS
        dm.query_vendas.Close;
        dm.query_vendas.SQL.clear;
        dm.query_vendas.SQL.Add('SELECT * FROM vendas  order by id desc');
        //dm.query_vendas.ParamByName('func').Value := nomeFunc;
        dm.query_vendas.Open;

        if not dm.query_vendas.IsEmpty then
          begin
            idVenda := dm.query_vendas['id'];
          end;

        dm.query_det_vendas.Close;
        dm.query_det_vendas.SQL.clear;
        dm.query_det_vendas.SQL.Add('Update detalhes_vendas set id_venda = :id where id_venda = 0 and funcionario = :funcionario');
        dm.query_det_vendas.ParamByName('id').Value := idVenda;
        dm.query_det_vendas.ParamByName('funcionario').Value := nomeFunc;
        dm.query_det_vendas.ExecSQL;





      //LAN�AR O VALOR DAS VENDAS NAS MOVIMENTA��ES[
        dm.query_mov.Close;
        dm.query_mov.SQL.clear;

        //PASSANDO VALOR PRA VARIAVEL PRA INSERIR EM MOV
        assocValorRecebido := strToFloat(edtValorRecebido.Text);

        //METODO INSERT (FICA ATENTO)
        //posso colocar curdate no lugar de data sem passar parametro
        dm.query_mov.SQL.Add('INSERT INTO movimentacoes (tipo, movimento, desconto, valor, metodo, status, valor_pago, troco, funcionario, data, id_movimento) VALUES(:tipo, :movimento, :desconto, :valor, :metodo, :status, :valor_pago, :troco, :funcionario, :data, :id_movimento)');
        dm.query_mov.ParamByName('tipo').Value := 'Entrada';
        dm.query_mov.ParamByName('movimento').Value := 'Venda';
        dm.query_mov.ParamByName('desconto').Value := svDesc;
        dm.query_mov.ParamByName('valor').Value := totalcomDesconto;
        dm.query_mov.ParamByName('metodo').Value := pagamentoo;
        dm.query_mov.ParamByName('status').Value := 'Conclu�da';
        dm.query_mov.ParamByName('valor_pago').Value := assocValorRecebido;
        dm.query_mov.ParamByName('troco').Value := troco;
        dm.query_mov.ParamByName('funcionario').Value := nomeFunc;
        dm.query_mov.ParamByName('data').AsDateTime := Now; // asdatetime e now para passar data e hora

        dm.query_mov.ParamByName('id_movimento').Value := idVenda;
        dm.query_mov.ExecSQL;

        //Passando a hora depois porque o parametro acima estava cheio.
        dm.query_mov.Close;
        dm.query_mov.SQL.clear;
         dm.query_mov.SQL.Add('Update movimentacoes set hora = :hora where id_movimento = :id_movimento');
            dm.query_mov.ParamByName('hora').Value := Time;
        dm.query_mov.ParamByName('id_movimento').Value := idVenda;
        dm.query_mov.ExecSQL;



      //Abrir a gaveta
        //abrirGaveta;

      //IMPRIMIR O CUPOM FISCAL

       //iniciarNFCE;
      // gerarNFCE;


      //IMPRIMIR O CUPOM NAO FISCAL
         imprimirCupom;







      //Final
      limpar;
      limparProdutos;
      edtQuantidade.Text := '1';
      edtQuantidade.SetFocus;
      totalcomDesconto := 0;
      totalVenda := 0;
      totalItememb := 0;
      estoque := 0;
      codexc := 0;
      totalItem := 0;
      troco := 0;
      valorZerado := 0;  //para troco
      verificaQtd := 0 ;
      pagamento := '';
      pagamentoo := '';
      listar;
      dm.query_det_vendas.Close;
            dm.query_det_vendas.open;
end;

procedure TFrmVendas.Timer1Timer(Sender: TObject);
begin
lblHora.Caption := timeToStr(Time);
end;

end.
