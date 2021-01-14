unit BuscarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TFrmBuscarProduto = class(TForm)
    edtBuscarProduto: TEdit;
    Label1: TLabel;
    grid_func: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure edtBuscarProdutoChange(Sender: TObject);
    procedure grid_funcDblClick(Sender: TObject);
    procedure grid_funcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure buscarProduto;
    procedure listarProduto;

  public
    { Public declarations }
  end;

var
  FrmBuscarProduto: TFrmBuscarProduto;

implementation

{$R *.dfm}

uses Modulo;

{ TFrmBuscarProduto }

procedure TFrmBuscarProduto.buscarProduto;
begin
dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('SELECT * from produtos where nome LIKE :nome order by nome asc');
       dm.query_produtos.ParamByName('nome').Value :=  '%' + EdtBuscarProduto.Text + '%';
       dm.query_produtos.Open;
end;

procedure TFrmBuscarProduto.edtBuscarProdutoChange(Sender: TObject);
begin
 buscarProduto;
end;

procedure TFrmBuscarProduto.FormDestroy(Sender: TObject);
begin
 confirm := '';

 FrmBuscarProduto.Close;
end;

procedure TFrmBuscarProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 27 then
  begin
    close;
  end;
end;

procedure TFrmBuscarProduto.FormShow(Sender: TObject);
begin
  edtBuscarProduto.text := dadosProdutos;
  buscarProduto;
  grid_func.SelectedIndex := 2;
end;

procedure TFrmBuscarProduto.grid_funcDblClick(Sender: TObject);
begin
      if buscarProd = 'produto' then
  begin
  confirm := 'ok';
  idProduto := dm.query_produtos.FieldByName('id').Value;
  nomeProd := dm.query_produtos.FieldByName('nome').Value;
  descProd := dm.query_produtos.FieldByName('descricao').Value;
  valorProd := dm.query_produtos.FieldByName('valor').Value;
  estoqueProd := dm.query_produtos.FieldByName('estoque').Value;
  estoqueproddd := dm.query_produtos.FieldByName('estoque').Value;
  close;
  buscarProd := '';
  end;


  if buscarProd = 'entproduto' then
  begin
  confirm := 'ok';
  idProduto := dm.query_produtos.FieldByName('id').Value;
  nomeProd := dm.query_produtos.FieldByName('nome').Value;
  estoqueProd := dm.query_produtos.FieldByName('estoque').Value;
  close;
  buscarProd := '';
  end;




  if buscarProd = 'produtodir' then
  begin
  confirm := 'ok';
  idProduto := dm.query_produtos.FieldByName('id').Value;
  nomeProd := dm.query_produtos.FieldByName('nome').Value;
  descProd := dm.query_produtos.FieldByName('descricao').Value;
  valorProd := dm.query_produtos.FieldByName('valor').Value;
  estoqueProd := dm.query_produtos.FieldByName('estoque').Value;
  close;
  buscarProd := '';
  end;



end;

procedure TFrmBuscarProduto.grid_funcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 begin
    if buscarProd = 'produto' then
  begin
  confirm := 'ok';
  idProduto := dm.query_produtos.FieldByName('id').Value;
  nomeProd := dm.query_produtos.FieldByName('nome').Value;
  descProd := dm.query_produtos.FieldByName('descricao').Value;
  valorProd := dm.query_produtos.FieldByName('valor').Value;
  estoqueProd := dm.query_produtos.FieldByName('estoque').Value;
  close;
  buscarProd := '';
  end;


   
 end;

 if key = 9 then
  begin
    edtBuscarProduto.SetFocus;
  end;


end;

procedure TFrmBuscarProduto.listarProduto;
begin
       dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('SELECT * from produtos order by nome asc');
       dm.query_produtos.Open;
end;

end.
