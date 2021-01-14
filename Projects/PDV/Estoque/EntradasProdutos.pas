unit EntradasProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, ACBrBase, ACBrDFe,
  ACBrNFe, Vcl.MPlayer, Vcl.Imaging.pngimage;

type
  TFrmEntradasProdutos = class(TForm)
    painelGrid: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    painelCentral: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    edtCodBarras: TEdit;
    Panel2: TPanel;
    edtProduto: TEdit;
    edtQuantidade: TEdit;
    nfce: TACBrNFe;
    Label10: TLabel;
    Label2: TLabel;
    procedure EdtQuantidadeChange(Sender: TObject);

    procedure edtCodBarrasChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }

    procedure limparProduto;
    procedure buscarProduto;
    procedure buscarProduto2;
    procedure salvarItens;
    procedure salvarEntrada;
    procedure limparFoto;
    procedure associarCamposEnt;
    procedure listar;


    procedure desabilitarCampos;

    procedure associarCamposDet;

  public
    { Public declarations }
  end;

var
  FrmEntradasProdutos: TFrmEntradasProdutos;
  total : double;
  id : string;
  estoque : double;
  idProdutoEst : string;
  codexc : double;
implementation

{$R *.dfm}

uses Modulo, Produtos, Fornecedores, BuscarProduto, CancelarItem, MENU,
  Funcionarios, Caixa;







procedure TFrmEntradasProdutos.associarCamposDet;
begin
dm.tb_det_entradas.fieldByName('id_entrada').Value := 0;
  dm.tb_det_entradas.fieldByName('cod_exc').Value := codexc;
 dm.tb_det_entradas.fieldByName('produto').Value := edtProduto.text;
 //dm.tb_det_entradas.fieldByName('valor').Value := edtPreco.text;
 dm.tb_det_entradas.fieldByName('quantidade').Value := edtQuantidade.text;
// dm.tb_det_entradas.fieldByName('total').Value := totalItem;
 dm.tb_det_entradas.fieldByName('id_produto').Value := idProduto;
 dm.tb_det_entradas.fieldByName('funcionario').Value := nomeFunc;
  dm.tb_det_entradas.fieldByName('data').Value := DateToStr(date);
  //dm.tb_det_entradas.fieldByName('mov').Value := 'normal';
 //estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
end;

procedure TFrmEntradasProdutos.associarCamposEnt;

begin



   dm.tb_entrada_pro.fieldByName('data').value := DateToStr(date); // asdatetime e now para passar data e hora
   dm.tb_entrada_pro.fieldByName('hora').value := TimeToStr(Time);
   dm.tb_entrada_pro.fieldByName('funcionario').Value := nomeFunc;


end;





procedure TFrmEntradasProdutos.buscarProduto;
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
        idProduto := dm.query_produtos.FieldByName('id').Value;
        edtProduto.Text := dm.query_produtos.FieldByName('nome').Value;
         //edtQuantidade.Text := dm.query_produtos.FieldByName('estoque').Value;


        (*//recuperando estoque
        estoque := dm.query_produtos.FieldByName('estoque').Value;

        //somando

        estoque := estoque + strToFloat(edtquantidade.Text);


        //atualizando estoque
       // dm.tb_entrada_pro.Edit;
            dm.tb_produtos.Edit;
        dm.query_produtos.close;
        dm.query_produtos.SQL.Clear;
        dm.query_produtos.SQL.Add('Update produtos set id = :id and estoque = :estoque');
                dm.query_produtos.ParamByName('id').Value := idProduto;
        dm.query_produtos.ParamByName('estoque').Value := estoque;
        dm.query_produtos.ExecSQL;

                *)

            dm.tb_produtos.Insert;

               dm.tb_det_entradas.Insert;
       // estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
        salvarItens;

      end


end;

procedure TFrmEntradasProdutos.buscarProduto2;
begin


     dm.query_produtos.Close;
     dm.query_produtos.SQL.Clear;
     dm.query_produtos.SQL.Add('select * from produtos where id = :id');
     dm.query_produtos.ParamByName('id').Value := idProduto;
     dm.query_produtos.Open;

      if idProduto <> '' then
      begin
         id := idProduto;
        edtProduto.Text := nomeProd;
        estoque := estoqueproddd;


       (*
        //recuperando estoque
        estoque := dm.query_produtos.FieldByName('estoque').Value;

        //somando

        estoque := estoque + strToFloat(edtquantidade.Text);


        //atualizando estoque
        dm.tb_entrada_pro.Edit;
        dm.query_produtos.close;
        dm.query_produtos.SQL.Clear;
        dm.query_produtos.SQL.Add('Update produtos set estoque = :estoque');
        dm.query_produtos.ParamByName('estoque').Value := estoque;
        dm.query_produtos.ExecSQL;    *)


              dm.tb_produtos.Insert;

               dm.tb_det_entradas.Insert;
            salvarItens;



              (*   if edtValorRecebido.Text = '0'  then
                  begin
                       valorZerado := 0;
                    edtTroco.Text := FormatFloat('R$ #,,,,0.00', valorZerado);
                    troco := valorZerado;
                  end;*)


        end

end;



procedure TFrmEntradasProdutos.desabilitarCampos;
begin
 
end;

procedure TFrmEntradasProdutos.edtCodBarrasChange(Sender: TObject);
begin




   if edtQuantidade.Text = '' then
   begin
     edtQuantidade.Text := '1';

   end;


        // if length(edtCodBarras.Text) = 13 then
   // begin
       buscarProduto;
    //end;


end;

procedure TFrmEntradasProdutos.EdtQuantidadeChange(Sender: TObject);
begin
  if edtQuantidade.text = '' then
   begin
      edtCodBarras.enabled := false;
    end;

   if edtQuantidade.text = '0' then
   begin
      edtCodBarras.enabled := false;
    end;

end;





procedure TFrmEntradasProdutos.FormActivate(Sender: TObject);
begin
listar;
end;

procedure TFrmEntradasProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 119 then
   begin
            buscarProd := 'entproduto';
             begin
             FrmBuscarProduto := TFrmBuscarProduto.create(self);
             FrmBuscarProduto.showModal;
             end;


          if confirm <> '' then
          begin
            buscarProduto2;
            confirm := '';
          end;
   end;


  if key = 27 then
  begin
    entradaChamada := 'entradaa';
    FrmCancelarItem := TFrmCancelarItem.create(self);
    FrmCancelarItem.show;
  end;


    if key = 113 then
  begin
   if messagedlg('Deseja adicionar esses produtos ao estoque?', mtInformation, mbYESNO,0) = mryes then
      begin
        salvarEntrada;
        showmessage('ADICIONADO COM SUCESSO!');

      end;

    end;


 end;
procedure TFrmEntradasProdutos.FormShow(Sender: TObject);
begin
      dm.tb_det_entradas.Active := false;
   dm.tb_det_entradas.Active := true;
     dm.tb_entrada_pro.Active := false;
  dm.tb_entrada_pro.Active := true;
    dm.tb_produtos.Active := false;
    dm.tb_produtos.Active := true;
end;

procedure TFrmEntradasProdutos.limparFoto;
begin

end;

procedure TFrmEntradasProdutos.limparproduto;
begin
 edtProduto.text := '';
 
 edtQuantidade.Text := '1';
end;

procedure TFrmEntradasProdutos.listar;
begin
    dm.query_det_entradas.Close;
    dm.query_det_entradas.SQL.clear;
    dm.query_det_entradas.SQL.Add('SELECT * FROM detalhes_entradas where id_entrada = 0 and funcionario = :func order by id desc');
    dm.query_det_entradas.ParamByName('func').Value := nomeFunc; // informando os parametros a passar para cargo e o que comparar com id
       // passando parametro e esse id no final vem da variavel no inicio do cod
    // dm.query_det_vendas.ParamByName('id_venda').Value := idVenda;
    dm.query_det_entradas.Open;// inici
end;

procedure TFrmEntradasProdutos.salvarEntrada;
var
idEntrada : string;
begin


       dm.tb_entrada_pro.Insert;

 associarCamposEnt;

      dm.tb_entrada_pro.Post;



      //RELACIONAR O ID DA VENDA COM OS ID_VENDA DOS ITENS
        dm.query_entrada_pro.Close;
        dm.query_entrada_pro.SQL.clear;
        dm.query_entrada_pro.SQL.Add('SELECT * FROM entrada_produtos order by id desc');
        //dm.query_vendas.ParamByName('func').Value := nomeFunc;
        dm.query_entrada_pro.Open;

        if not dm.query_entrada_pro.IsEmpty then
          begin
            idEntrada := dm.query_entrada_pro['id'];
          end;

        dm.query_det_entradas.Close;
        dm.query_det_entradas.SQL.clear;
        dm.query_det_entradas.SQL.Add('Update detalhes_entradas set id_entrada = :id where id_entrada = 0 and funcionario = :funcionario');
        dm.query_det_entradas.ParamByName('id').Value := idEntrada;
        dm.query_det_entradas.ParamByName('funcionario').Value := nomeFunc;
        dm.query_det_entradas.ExecSQL;

         listar;
      dm.query_det_entradas.Close;
      dm.query_det_entradas.open;

end;

procedure TFrmEntradasProdutos.salvarItens;
begin
     if codexc = 0 then
begin
codexc := 1;
end;

 if (trim(EdtQuantidade.text) = '') or (EdtQuantidade.text = '0') then
    begin
      MessageDlg('Preencha o campo quantidade!' , mtInformation, mbOKCancel,0);
      edtQuantidade.SetFocus;
      edtQuantidade.Text := '';
      exit;
    end;


   associarCamposDet;


      dm.tb_det_entradas.Post;

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


    //Atualização de estoque

    estoque := estoqueProduto + strToFloat(edtQuantidade.Text);

    dm.query_produtos.Close;
    dm.query_produtos.SQL.Clear;
    dm.query_produtos.SQL.Add('UPDATE produtos set estoque = :estoque where id = :id');
    dm.query_produtos.ParamByName('estoque').Value := estoque;
    dm.query_produtos.ParamByName('id').Value := idProduto;

    dm.query_produtos.ExecSQL;


listar;


















      //Final
     (* limpar;
      limparProdutos;
      edtQuantidade.Text := '1';

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
      pagamentoo := '';   *)
      edtQuantidade.Text := '';
      edtQuantidade.SetFocus;

      edtCodBarras.Text := '';
      edtCodBarras.enabled := true;
      edtProduto.Text := '';
      listar;


end;



end.
