unit VendaDireta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.MPlayer, ACBrBase, ACBrDFe, ACBrNFe, ACBrUtil, ACBrNFeNotasFiscais, pcnConversao, pcnConversaoNFe,
  ACBrNFSe, pcnNFe, pnfsConversao, System.Math, Vcl.Imaging.pngimage;

type
  TFrmVendaDireta = class(TForm)
    PanelTitulo: TPanel;
    DBGrid1: TDBGrid;
    PanelCentral: TPanel;
    edtCodBarras: TEdit;
    edtDescricao: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    edtQuantidade: TEdit;
    Label3: TLabel;
    edtPreco: TEdit;
    edtEstoque: TEdit;
    Label2: TLabel;
    edtProduto: TEdit;
    Label5: TLabel;
    imagem: TImage;
    MediaPlayer1: TMediaPlayer;
    Panel5: TPanel;
    PanelPreco: TPanel;
    edtTotal: TEdit;
    Panel4: TPanel;
    Panel6: TPanel;
    edtSubTotal: TEdit;
    Panel8: TPanel;
    edtTotalCompra: TEdit;
    Panel7: TPanel;
    edtValorRecebido: TEdit;
    Panel9: TPanel;
    edtTroco: TEdit;
    nfce: TACBrNFe;
    Label7: TLabel;
    lblData: TLabel;
    lblHora: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    pnlEstoque: TPanel;
    lblEstoque: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtCodBarrasChange(Sender: TObject);
    procedure edtValorRecebidoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtPrecoChange(Sender: TObject);
    procedure edtValorRecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure limpar;
    procedure limparProdutos;
    procedure buscarProduto;
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
  FrmVendaDireta: TFrmVendaDireta;
  totalItem : double;
  totalVenda : double;
  estoque : double;
  valorZerado : double;
  troco : double;
  pagamento :string;
  idVenda : string;

  //Variaveis de assoc
  assocValorRecebido : double;



implementation

{$R *.dfm}

uses Modulo, CancelarItem, FormaPagamento;


//FUN��O PARA CONVERTER EM RGB

  function ConverterRBG(r, g, b: byte) : tColor;
   begin
     Result := RGB(r, g , b)
   end;

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

(*procedure TFrmVendaDireta.abrirGaveta;

var
F: textfile;
i: integer;
begin
    AssignFile(F,'\\' + nomePc + '\' + nomeCompartilhamento);
   // messageDlg(nomeCompartilhamento, mtInformation,mbOkcancel,0);
    Rewrite(F);
    Writeln(F,#027+ #112+ #000+ #010+ #100'');  //Abrir Gaveta;
    CloseFile(F);

end;*)

procedure TFrmVendaDireta.abrirGaveta;
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

procedure TFrmVendaDireta.associarCamposDet;
begin
  dm.tb_det_vendas_dir.FieldByName('id_venda').value := 0;
  dm.tb_det_vendas_dir.FieldByName('produto').value := edtProduto.Text;
  dm.tb_det_vendas_dir.FieldByName('valor').value := edtPreco.text;
  dm.tb_det_vendas_dir.FieldByName('quantidade').Value := edtQuantidade.Text;
  dm.tb_det_vendas_dir.FieldByName('total').Value := totalItem;
  dm.tb_det_vendas_dir.FieldByName('id_produto').Value := idProduto;
  dm.tb_det_vendas_dir.FieldByName('funcionario').Value := nomeFunc;
  dm.tb_det_vendas_dir.FieldByName('data').Value := DateToStr(date);
end;

procedure TFrmVendaDireta.associarCamposVenda;
begin


  dm.tb_venda_dir.FieldByName('valor').Value := totalVenda;
  dm.tb_venda_dir.FieldByName('funcionario').Value := nomeFunc;
  dm.tb_venda_dir.fieldByName('data').value := DateToStr(date); // asdatetime e now para passar data e hora
  dm.tb_venda_dir.fieldByName('hora').value := TimeToStr(Time);
  dm.tb_venda_dir.FieldByName('metodo').Value := pagamentodirr;
 // dm.tb_venda_dir.fieldByName('status').Value := 'Conclu�da';
 // dm.tb_venda_dir.fieldByName('valor_pago').Value := edtValorRecebido.Text;
 // dm.tb_venda_dir.fieldByName('troco').Value := troco


end;

procedure TFrmVendaDireta.buscarProduto;
begin
    //Buscar
     dm.query_produtos.Close;
     dm.query_produtos.SQL.Clear;
     dm.query_produtos.SQL.Add('select * from produtos where codigo = :codigo');
     dm.query_produtos.ParamByName('codigo').Value := edtCodBarras.Text;
     dm.query_produtos.Open;


     if not dm.query_produtos.IsEmpty then
      begin

        //edtQuantidade.Enabled := false;
        edtProduto.Text := dm.query_produtos.FieldByName('nome').Value;
        edtDescricao.Text := dm.query_produtos.FieldByName('descricao').Value;

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
        //totalcomDesconto := totalVenda;
        edtTotal.Text := formatFloat('R$ #,,,,0.00',totalItem);
        edtSubTotal.Text := formatFloat('R$ #,,,,0.00',totalVenda);
        edtTotalCompra.Text := formatFloat('R$ #,,,,0.00',totalVenda);
        dm.tb_det_vendas_dir.Insert;

        if edtEstoque.Text  > '0' then
        begin
        edtEstoque.Text := dm.query_produtos.FieldByName('estoque').Value - edtQuantidade.Text;
        end;

        estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
        salvarItens;
         if (trim(edtValorRecebido.text) <> '') or (edtValorRecebido.Text = '0')  then
            begin
               troco := strToFloat(edtValorRecebido.Text) - totalVenda;
               edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
            end;
             if (edtValorRecebido.text = '') or (edtValorRecebido.text = '0')then
                begin
                  valorZerado := 0;
                  edtTroco.Text := FormatFloat('R$ #,,,,0.00',valorZerado);

                end;



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

procedure TFrmVendaDireta.edtCodBarrasChange(Sender: TObject);
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

procedure TFrmVendaDireta.edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13]) then
Key := '0';
end;

procedure TFrmVendaDireta.edtPrecoChange(Sender: TObject);
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

procedure TFrmVendaDireta.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13]) then
Key := '0';
end;

procedure TFrmVendaDireta.edtPrecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);


var  s: String;

begin
  if (Key in [96..107]) or (Key in [48..57]) then
     begin
      S := edtPreco.Text;
      S := StringReplace(S,',','',[rfReplaceAll]);
      S := StringReplace(S,'.','',[rfReplaceAll]);
      if Length(s) = 3 then
        begin
          s := Copy(s,1,1)+','+Copy(S,2,15);
          edtPreco.Text := S;
          edtPreco.SelStart := Length(S);
        end
      else
        if (Length(s) > 3) and (Length(s) < 6) then
          begin
            s := Copy(s,1,length(s)-2)+','+Copy(S,length(s)-1,15);
            edtPreco.Text := s;
            edtPreco.SelStart := Length(S);
          end
        else
          if (Length(s) >= 6) and (Length(s) < 9) then
            begin
              s := Copy(s,1,length(s)-5)+'.'+Copy(s,length(s)-4,3)+','+Copy(S,length(s)-1,15);
              edtPreco.Text := s;
              edtPreco.SelStart := Length(S);
            end
          else
            if (Length(s) >= 9) and (Length(s) < 12) then
              begin
                s := Copy(s,1,length(s)-8)+'.'+Copy(s,length(s)-7,3)+'.'+
                       Copy(s,length(s)-4,3)+','+Copy(S,length(s)-1,15);
                edtPreco.Text := s;
                edtPreco.SelStart := Length(S);
              end
            else
              if (Length(s) >= 12) and (Length(s) < 15)  then
                begin
                  s := Copy(s,1,length(s)-11)+'.'+Copy(s,length(s)-10,3)+'.'+
                          Copy(s,length(s)-7,3)+'.'+Copy(s,length(s)-4,3)+','+Copy(S,length(s)-1,15);
                  edtPreco.Text := s;
                  edtPreco.SelStart := Length(S);
                end;

end;
end;


procedure TFrmVendaDireta.edtQuantidadeChange(Sender: TObject);
begin
  if edtQuantidade.Text = '0' then
  begin
    edtQuantidade.text := '1';
  end;
end;

procedure TFrmVendaDireta.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13]) then
Key := '0';
end;

procedure TFrmVendaDireta.edtValorRecebidoChange(Sender: TObject);
begin
   if (trim(edtValorRecebido.text) <> '') or (edtValorRecebido.Text = '0')  then
    begin
       troco := strToFloat(edtValorRecebido.Text) - totalVenda;
       edtTroco.Text := FormatFloat('R$ #,,,,0.00',troco);
    end
      else
        begin
          valorZerado := 0;
          edtTroco.Text := FormatFloat('R$ #,,,,0.00',valorZerado);
        end;

   

end;

procedure TFrmVendaDireta.edtValorRecebidoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9','A'..'Z',#8,#27,#13,#44]) then
Key := '0';
end;



procedure TFrmVendaDireta.FormActivate(Sender: TObject);
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

end;


procedure TFrmVendaDireta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MediaPlayer1.Destroy;
end;

procedure TFrmVendaDireta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 27 then
  begin
    vdChamada := 'direta';
    FrmCancelarItem := TFrmCancelarItem.create(self);
    FrmCancelarItem.show;
  end;

  if key = 13 then
  begin
    chamadaPagamento := 'FormaDireta';
    FrmPagamento := TFrmPagamento.create(self);
    FrmPagamento.ShowModal;



    if pagamentodirr <> '' then
    begin
    dm.tb_venda_dir.Insert;

        if totalVenda <> 0 then
        begin
                 if edtValorRecebido.Text = '' then
                      begin
                        edtValorRecebido.Text := '0';
                      end;

                     salvarVendas;


      
        end;


    end;


  end;


end;

procedure TFrmVendaDireta.FormShow(Sender: TObject);
begin
limparProdutos;

//dtPreco.Text := FormatFloat('R$ #,,,,0.00', StrToFloat(edtPreco.Text));dm.tb_venda_dir.Active := false;



 dm.tb_venda_dir.Active := true;
 dm.tb_venda_dir.Insert;
dm.tb_det_vendas_dir.Active := true;




   limpar;

      edtQuantidade.Text := '1';

      totalVenda := 0;
      estoque := 0;
      totalItem := 0;
      troco := 0;
      valorZerado := 0;  //para troco
     // verificaQtd := 0 ;
        lblHora.Caption := TimeToStr(time);
    lblData.Caption := DateToStr(date);

      pnlEstoque.Visible := false;
              lblEstoque.Visible := false;

end;

procedure TFrmVendaDireta.gerarNFCE;
Var
NotaF: NotaFiscal;
item : integer;
Produto: TDetCollectionItem;
InfoPgto: TpagCollectionItem;

begin
nfce.NotasFiscais.Clear;
NotaF := nfce.NotasFiscais.Add;


    //Buscando dados dsos emitentes e para nota fiscal
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

  NotaF.NFe.Ide.natOp     := 'VENDA DIRETA';
  if pagamentodirr = 'Cart�o' then
       begin
       NotaF.NFe.Ide.indPag := ipPrazo;
       end;

       if pagamentodirr = 'Dinheiro' then
       begin
        NotaF.NFe.Ide.indPag := ipVista;
       end;

  NotaF.NFe.Ide.modelo    := 65;
  NotaF.NFe.Ide.serie     := 1;
  NotaF.NFe.Ide.nNF       := StrToInt(idVenda);
  NotaF.NFe.Ide.dEmi      := Date;
  NotaF.NFe.Ide.dSaiEnt   := Date;
  NotaF.NFe.Ide.hSaiEnt   := Now;
  NotaF.NFe.Ide.tpNF      := tnSaida;
  NotaF.NFe.Ide.tpEmis    := teNormal;
  NotaF.NFe.Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta vari�vel quando for para ambiente de produ��o
  NotaF.NFe.Ide.verProc   := '1.0.0.0'; //Vers�o do seu sistema
  NotaF.NFe.Ide.cUF       := 33;
  NotaF.NFe.Ide.cMunFG    := codcid;
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

   NotaF.NFe.Dest.CNPJCPF           := '05481336000137';
  NotaF.NFe.Dest.IE                := '687138770110';
  NotaF.NFe.Dest.ISUF              := '';
  NotaF.NFe.Dest.xNome             := 'D.J. COM. E LOCA��O DE SOFTWARES LTDA - ME';

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
  dm.query_det_vendas_dir.Close;
  dm.query_det_vendas_dir.SQL.Clear;
  dm.query_det_vendas_dir.SQL.Add('select * from detalhes_vendas_direta WHERE id_venda = :num order by id asc') ;
  dm.query_det_vendas_dir.ParamByName('num').Value := idVenda;
  dm.query_det_vendas_dir.Open;
   dm.query_det_vendas_dir.First;

   while not dm.query_det_vendas_dir.eof do
       begin
      Produto := NotaF.NFe.Det.New;
      Produto.Prod.nItem    := item; // N�mero sequencial, para cada item deve ser incrementado
      Produto.Prod.cProd    := '123456';
      Produto.Prod.cEAN     := '7896523206646';
      Produto.Prod.xProd    := dm.query_det_vendas_dir.FieldByName('produto').Value;
      Produto.Prod.NCM      := '94051010'; // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
      Produto.Prod.EXTIPI   := '';
      Produto.Prod.CFOP     := '5101';
      Produto.Prod.uCom     := 'UN';
      Produto.Prod.qCom     := dm.query_det_vendas_dir.FieldByName('quantidade').Value;
      Produto.Prod.vUnCom   := dm.query_det_vendas_dir.FieldByName('valor').Value;
      Produto.Prod.vProd    := dm.query_det_vendas_dir.FieldByName('total').Value;


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
      dm.query_det_vendas_dir.Next;
   end;

   //totalizando


    NotaF.NFe.Total.ICMSTot.vBC     := 100;
  NotaF.NFe.Total.ICMSTot.vICMS   := 18;
  NotaF.NFe.Total.ICMSTot.vBCST   := 0;
  NotaF.NFe.Total.ICMSTot.vST     := 0;
  NotaF.NFe.Total.ICMSTot.vProd   := totalVenda;
  NotaF.NFe.Total.ICMSTot.vFrete  := 0;
  NotaF.NFe.Total.ICMSTot.vSeg    := 0;
  NotaF.NFe.Total.ICMSTot.vDesc   := 0;
  NotaF.NFe.Total.ICMSTot.vII     := 0;
  NotaF.NFe.Total.ICMSTot.vIPI    := 0;
  NotaF.NFe.Total.ICMSTot.vPIS    := 0;
  NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
  NotaF.NFe.Total.ICMSTot.vOutro  := 0;
  NotaF.NFe.Total.ICMSTot.vNF     := totalVenda;

    // lei da transparencia de impostos
  NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

  // partilha do icms e fundo de probreza
  NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;


  NotaF.NFe.Transp.modFrete := mfSemFrete;  //SEM FRETE

  // YA. Informa��es de pagamento

  InfoPgto := NotaF.NFe.pag.New;
    InfoPgto := NotaF.NFe.pag.New;
  if pagamentodirr = 'Cart�o' then
       begin
        InfoPgto.indPag := ipPrazo;
        InfoPgto.tPag := fpCartaoCredito
       end;

       if pagamentodirr = 'Dinheiro' then
       begin
         InfoPgto.indPag := ipVista;
         InfoPgto.tPag := fpDinheiro;
       end;
  InfoPgto.vPag   := totalVenda;


  //RECUPERAR O NUMERO DE SERIE DO CERTIFICADO
  nfce.Configuracoes.Certificados.NumeroSerie := certificadoDig;

  //ASSINAR

  nfce.NotasFiscais.Assinar;
  nfce.Enviar(Integer(idVenda));
  ShowMessage(nfce.WebServices.StatusServico.Msg);

end;

procedure TFrmVendaDireta.imprimirCupom;
begin
         dm.query_venda_dir.Close;
        dm.query_venda_dir.SQL.clear;
        dm.query_venda_dir.SQL.Add('SELECT * FROM vendas_direta where id = :id');
        dm.query_venda_dir.ParamByName('id').Value := idVenda;
        dm.query_venda_dir.Open;

        dm.query_det_vendas_dir.Close;
        dm.query_det_vendas_dir.SQL.clear;
        dm.query_det_vendas_dir.SQL.Add('SELECT * FROM detalhes_vendas_direta where id_venda = :id');
        dm.query_det_vendas_dir.ParamByName('id').Value := idVenda;
        dm.query_det_vendas_dir.Open;

        //BUSCANDO CUPOM
        dm.rel_comprovantedir.LoadFromFile(GetCurrentDir + '/rel/comprovantedadosdir.fr3');
        //dm.rel_comprovantedir.showReport();
        dm.rel_comprovantedir.PrintOptions.ShowDialog := false;
        dm.rel_comprovantedir.PrepareReport;
        dm.rel_comprovantedir.Print;
        showMessage('Ap�s retirar o comprovante pressione enter para 2� via');

      //  segVia := 'ok';
         if messageDlg('Deseja imprimir a 2� via?', mtInformation, mbYESNO,0) = mrYes then
         begin
          dm.query_venda_dir.Close;
          dm.query_venda_dir.SQL.clear;
          dm.query_venda_dir.SQL.Add('SELECT * FROM vendas_direta where id = :id');
          dm.query_venda_dir.ParamByName('id').Value := idVenda;
          dm.query_venda_dir.Open;

          dm.query_det_vendas_dir.Close;
          dm.query_det_vendas_dir.SQL.clear;
          dm.query_det_vendas_dir.SQL.Add('SELECT * FROM detalhes_vendas_direta where id_venda = :id');
          dm.query_det_vendas_dir.ParamByName('id').Value := idVenda;
          dm.query_det_vendas_dir.Open;

          //CHAMAR O RELAT�RIO
          dm.rel_comprovantedir.LoadFromFile(GETCURRENTDIR + '/rel/comprovantedadosdir.fr3');

          //dm.rel_comprovante.ShowReport;

          dm.rel_comprovantedir.PrintOptions.ShowDialog := false;
          dm.rel_comprovantedir.PrepareReport;
          dm.rel_comprovantedir.print;


         end;
end;
procedure TFrmVendaDireta.iniciarNFCE;
var
caminhoNFCE :string;
begin
caminhoNFCE := ExtractFilePath(Application.ExeName) + 'nfe\';

nfce.Configuracoes.Arquivos.PathSchemas := caminhoNFCE;
end;


procedure TFrmVendaDireta.limpar;
begin
 edtTotal.Text := '0';
 edtSubTotal.Text := '0';
 edtTotalCompra.Text := '0';
 edtValorRecebido.Text := '0';
 edtTroco.Text := '0';

 limparFoto;
end;

procedure TFrmVendaDireta.limparFoto;
var
caminhoImg : string;
begin
   caminhoImg := GetCurrentDir + '\img\sem-foto.jpg';
   //ExtractFileDir(GetCurrentDir) + '\Debug\img\sem-foto.jpg';
   imagem.Picture.LoadFromFile(caminhoImg);
end;

procedure TFrmVendaDireta.limparProdutos;
begin
 edtProduto.text := '';
 edtDescricao.Text := '';
 //edtPreco.text := '0';
 //edtQuantidade.Text := '1';
 edtEstoque.text := '0';

 totalItem := 0;
 limparfoto;
end;

procedure TFrmVendaDireta.listar;
begin
   dm.query_det_vendas_dir.Close;
    dm.query_det_vendas_dir.SQL.clear;
    dm.query_det_vendas_dir.SQL.Add('SELECT * FROM detalhes_vendas_direta where id_venda = 0 and funcionario = :func order by id desc');
    dm.query_det_vendas_dir.ParamByName('func').Value := nomeFunc; // informando os parametros a passar para cargo e o que comparar com id
       // passando parametro e esse id no final vem da variavel no inicio do cod
    // dm.query_det_vendas.ParamByName('id_venda').Value := idVenda;
    dm.query_det_vendas_dir.Open;// inicia a query /abrir

//DBGrid1.Columns[0].Alignment := taCenter;//ALINHAR O CAMPO QUANTIDADE DA GRID NO MEIO
//DBGrid1.Columns[3].Alignment := taCenter;
//DBGrid1.Columns[2].Alignment := taLeftJustify;
//DBGrid1.Columns[4].Alignment := taLeftJustify;
end;

procedure TFrmVendaDireta.salvarItens;
begin

   edtquantidade.enabled := true;

    // VERIFICANDO CAMPO VAZIO
 if (trim(EdtQuantidade.text) = '') or (EdtQuantidade.text = '0') then
    begin
      MessageDlg('Preencha o campo quantidade!' , mtInformation, mbOKCancel,0);
      EdtQuantidade.SetFocus;
      edtCodBarras.Text := '';
      exit;
    end;

   if (trim(EdtPreco.text) = '') or (EdtPreco.text = '0') then
    begin
      MessageDlg('Preencha o campo Pre�o!' , mtInformation, mbOKCancel,0);
      EdtQuantidade.SetFocus;
      edtCodBarras.Text := '';
      exit;
    end;


    //ASSOCIANDO E SALVANDO
    associarCamposDet;
    dm.tb_det_vendas_dir.Post;


    // ATUALIZAR ESTOQUE

    estoque := estoqueProduto - strToFloat(edtQuantidade.Text);

    dm.tb_produtos.Close;
    dm.tb_produtos.SQL.Clear;
    dm.tb_produtos.SQL.Add('UPDATE produtos set estoque = :estoque where id = :id_produto');
    dm.tb_produtos.ParamByName('estoque').Value := estoque;
    dm.tb_produtos.ParamByName('id_produto').Value := IdProduto;
    dm.tb_produtos.ExecSQL;

    listar;

    edtCodBarras.Text := '';
    edtCodBarras.Enabled := false;
    edtPreco.SetFocus;
    edtQuantidade.Text := '1';
    edtPreco.Text := '' ;

    MediaPlayer1.FileName := GetCurrentDir + '\img\barCode.wav';
    //ExtractFileDir(GetCurrentDir) + '\Debug\img\barCode.wav';
        MediaPlayer1.open;
    MediaPlayer1.play;







end;

procedure TFrmVendaDireta.salvarVendas;
begin

      associarCamposVenda;

      dm.tb_venda_dir.Post;



      //RELACIONAR O ID DA VENDA COM OS ID_VENDA DOS ITENS
        dm.query_venda_dir.Close;
        dm.query_venda_dir.SQL.clear;
        dm.query_venda_dir.SQL.Add('SELECT * FROM vendas_direta  order by id desc');
        //dm.query_vendas.ParamByName('func').Value := nomeFunc;
        dm.query_venda_dir.Open;

        if not dm.query_venda_dir.IsEmpty then
          begin
            idVenda := dm.query_venda_dir['id'];
          end;

        dm.query_det_vendas_dir.Close;
        dm.query_det_vendas_dir.SQL.clear;
        dm.query_det_vendas_dir.SQL.Add('Update detalhes_vendas_direta set id_venda = :id where id_venda = 0 and funcionario = :funcionario');
        dm.query_det_vendas_dir.ParamByName('id').Value := idVenda;
        dm.query_det_vendas_dir.ParamByName('funcionario').Value := nomeFunc;
        dm.query_det_vendas_dir.ExecSQL;





      //LAN�AR O VALOR DAS VENDAS NAS MOVIMENTA��ES[
        dm.query_mov.Close;
        dm.query_mov.SQL.clear;

       //PASSANDO VALOR PRA VARIAVEL PRA INSERIR EM MOV
        assocValorRecebido := strToFloat(edtValorRecebido.Text);

        //METODO INSERT (FICA ATENTO)
        //posso colocar curdate no lugar de data sem passar parametro
        dm.query_mov.SQL.Add('INSERT INTO movimentacoes (tipo, movimento, valor, metodo, status, valor_pago, troco, funcionario, data, hora, id_movimento) VALUES(:tipo, :movimento, :valor, :metodo, :status, :valor_pago, :troco, :funcionario, :data, :hora, :id_movimento)');
        dm.query_mov.ParamByName('tipo').Value := 'Entrada';
        dm.query_mov.ParamByName('movimento').Value := 'Venda Direta';
        dm.query_mov.ParamByName('valor').Value := totalVenda;
        dm.query_mov.ParamByName('metodo').Value := pagamentodirr;
         dm.query_mov.ParamByName('status').Value := 'Conclu�da';
        dm.query_mov.ParamByName('valor_pago').Value := assocValorRecebido;
        dm.query_mov.ParamByName('troco').Value := troco;
        dm.query_mov.ParamByName('funcionario').Value := nomeFunc;
        dm.query_mov.ParamByName('data').AsDateTime := Now; // asdatetime e now para passar data e hora
        dm.query_mov.ParamByName('hora').Value := Time;
        dm.query_mov.ParamByName('id_movimento').Value := idVenda;
        dm.query_mov.ExecSQL;


      //ABRIR GAVETA
       // abrirGaveta;


      //IMPRIMIR O CUPOM FISCAL

           // iniciarNFCE;
           // gerarNFCE;


      //IMPRIMIR O CUPOM NAO FISCAL  BASEADO NA NOTA FISCAL

        imprimirCupom;



      //Abrir a gaveta




      //Final
      limpar;
      limparProdutos;
      edtQuantidade.Text := '1';

      totalVenda := 0;
      estoque := 0;
      totalItem := 0;
      troco := 0;
      valorZerado := 0;  //para troco
      edtPreco.SetFocus;
      pagamentodirr := '';
      listar;
      //dm.query_det_vendas.Close;

end;

procedure TFrmVendaDireta.Timer1Timer(Sender: TObject);
begin
lblHora.Caption := timeToStr(Time);
end;

end.
