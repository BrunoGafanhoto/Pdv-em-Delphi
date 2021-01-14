unit SaidasProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmSaidasProdutos = class(TForm)
    Label2: TLabel;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnBuscarProd: TSpeedButton;
    BtnBuscarForn: TSpeedButton;
    EdtProduto: TEdit;
    grid_usu: TDBGrid;
    EdtQuantidade: TEdit;
    EdtMotivo: TEdit;
    Label1: TLabel;
    dataBuscar: TDateTimePicker;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnBuscarProdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure grid_usuCellClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure dataBuscarChange(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
      procedure limpar;
     procedure habilitarCampos;
     procedure desabilitarCampos;


     procedure associarCampos;
    procedure listar;


    procedure buscarData;
  public
    { Public declarations }
  end;

var
  FrmSaidasProdutos: TFrmSaidasProdutos;
  estoque : double;
  idProdutoEst : string;


implementation

{$R *.dfm}

uses Modulo, Produtos;

{ TFrmSaidasProdutos }

procedure TFrmSaidasProdutos.associarCampos;
begin
//dm.tb_entrada_pro.FieldByName('id').Value := idProduto;
 dm.tb_saida_pro.FieldByName('produto').Value := EdtProduto.Text;
 dm.tb_saida_pro.FieldByName('motivo').Value := EdtMotivo.Text;
dm.tb_saida_pro.FieldByName('quantidade').Value := EdtQuantidade.Text;
dm.tb_saida_pro.FieldByName('data').Value := DateToStr(Date);
dm.tb_saida_pro.FieldByName('id_produto').Value := idProduto;


end;

procedure TFrmSaidasProdutos.BtnBuscarProdClick(Sender: TObject);
begin
 chamada := 'Prod';
 FrmProdutos := TFrmProdutos.Create(self);
 FrmProdutos.Show;
end;

procedure TFrmSaidasProdutos.BtnExcluirClick(Sender: TObject);
begin
if messagedlg('Deseja realmente apagar esse registro?',mtConfirmation, mbYesNo,0) = mrYes then
  begin
    dm.tb_saida_pro.Delete;

      // RECUPERAR VALOR ATUAL

       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('SELECT * FROM produtos where id = :id');

       dm.query_produtos.ParamByName('id').Value := idProdutoEst;
       dm.query_produtos.OPEN;

       if not dm.query_produtos.IsEmpty then
          begin
          estoqueProduto := dm.query_produtos['estoque'];
          end;
    //ATUALIZAR O ESTOQUE

        estoque := estoqueProduto + strToFloat(edtQuantidade.Text);

       dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('UPDATE  produtos set estoque = :estoque where id = :id');
       dm.query_produtos.ParamByName('estoque').Value := estoque;
       dm.query_produtos.ParamByName('id').Value := idProduto;

       dm.query_produtos.ExecSQL;

    messagedlg('Excluido com sucesso!',mtInformation,MBOKCancel,0);
    limpar;
    listar;

  end;
end;

procedure TFrmSaidasProdutos.BtnNovoClick(Sender: TObject);
begin
habilitarCampos;
limpar;
dm.tb_saida_pro.Insert;
BtnSalvar.Enabled := true;
end;

procedure TFrmSaidasProdutos.BtnSalvarClick(Sender: TObject);
begin
 // Validaçãod de campos vazios
      if EdtProduto.Text = '' then
      begin
        MessageDlg('Escolha um Produto!',mtInformation,mbOKCancel,0);
        exit;

      end;

      if EdtMotivo.Text = '' then
      begin
        MessageDlg('Insira um Motivo!',mtInformation,mbOKCancel,0);

        exit;

      end;


    if EdtQuantidade.Text = '' then
      begin
        MessageDlg('Preencha o campo de quantidade!',mtInformation,mbOKCancel,0);
        EdtQuantidade.SetFocus;
        exit;

      end;

      if MessageDlg('Deseja salvar?',mtConfirmation, mbYesNo,0) = mrYes  then
        begin
        associarCampos;
        dm.tb_saida_pro.Post;
        // ATUALIZAR ESTOQUE

        estoque := estoqueProduto - strToFloat(edtQuantidade.Text);

        dm.query_produtos.Close;
        dm.query_produtos.SQL.Clear;
        dm.query_produtos.SQL.Add('UPDATE produtos set estoque = :estoque where id = :id');
        dm.query_produtos.ParamByName('estoque').Value := estoque;
        dm.query_produtos.ParamByName('id').Value := idProduto;
        dm.query_produtos.ExecSQL;

        MessageDlg('Saída registrada com sucesso!',mtInformation, mbOKCancel,0);
        btnSalvar.Enabled := false;
        btnNovo.Enabled := true;
        desabilitarCampos;
        limpar;
        listar;



        end;
end;

procedure TFrmSaidasProdutos.buscarData;
begin
     dm.query_saida_pro.Close;
     dm.query_saida_pro.SQL.Clear;
     dm.query_saida_pro.SQL.Add('SELECT * from saida_produtos where data = :data order by data asc');   // INNER JOIN é quando quero pegar dados de uma tabela diferente.
     dm.query_saida_pro.ParamByName('data').Value := FormatDateTime('yyyy/mm/dd' ,dataBuscar.date);
     dm.query_saida_pro.Open;
end;

procedure TFrmSaidasProdutos.dataBuscarChange(Sender: TObject);
begin
buscarData;

end;

procedure TFrmSaidasProdutos.desabilitarCampos;
begin
     EdtMotivo.Enabled := false;
   EdtQuantidade.Enabled := false;
     EdtProduto.Enabled := false;
   BtnBuscarProd.Enabled := false;
end;

procedure TFrmSaidasProdutos.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8,#27]) then
Key := '0';
end;

procedure TFrmSaidasProdutos.FormActivate(Sender: TObject);
begin
 EdtProduto.text := nomeProduto;
end;

procedure TFrmSaidasProdutos.FormShow(Sender: TObject);
begin
dm.tb_saida_pro.Active := true;
listar;
listar;
dataBuscar.date := date;
end;

procedure TFrmSaidasProdutos.grid_usuCellClick(Column: TColumn);
begin
  if dm.query_saida_pro.FieldByName('produto').Value <> null then
  begin
    EdtProduto.Text := dm.query_saida_pro.FieldByName('produto').Value;
    EdtMotivo.Text  := dm.query_saida_pro.FieldByName('motivo').Value;
    EdtQuantidade.Text := dm.query_saida_pro.FieldByName('quantidade').Value;

  id := dm.query_saida_pro.FieldByName('id').Value;
   idProdutoEst := dm.query_saida_pro.FieldByName('id_produto').Value;

    habilitarCampos;
    btnExcluir.Enabled := true;
  end;


end;

procedure TFrmSaidasProdutos.habilitarCampos;
begin
     EdtMotivo.Enabled := true;
   EdtQuantidade.Enabled := true;
      EdtProduto.Enabled := true;
   BtnBuscarProd.Enabled := true;
end;

procedure TFrmSaidasProdutos.limpar;
begin
      EdtMotivo.text := '';
   EdtQuantidade.text := '';
   EdtProduto.text := '';



end;

procedure TFrmSaidasProdutos.listar;
begin
     dm.query_saida_pro.Close;
     dm.query_saida_pro.SQL.Clear;
     dm.query_saida_pro.SQL.Add('SELECT * from saida_produtos order by data desc');   // INNER JOIN é quando quero pegar dados de uma tabela diferente.
     dm.query_saida_pro.Open;

end;

end.
