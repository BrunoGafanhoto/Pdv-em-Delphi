unit EstoqueBaixo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TFrmEstoqueBaixo = class(TForm)
    grid_usu: TDBGrid;
    EdtBuscarNome: TEdit;
    Label1: TLabel;
    BtnComprovante: TSpeedButton;
    procedure EdtBuscarNomeChange(Sender: TObject);
    procedure grid_usuDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnComprovanteClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscarNome;
     procedure listar;
  public
    { Public declarations }
  end;

var
  FrmEstoqueBaixo: TFrmEstoqueBaixo;

implementation

{$R *.dfm}

uses Produtos, Modulo, EntradasProdutos;

{ TFrmEstoqueBaixo }

procedure TFrmEstoqueBaixo.BtnComprovanteClick(Sender: TObject);
begin
 if messageDlg('Deseja imprimir os produtos com estoque baixo?',mtInformation, mbYESNO,0) = mrYES then
   begin
   dm.query_produtos.Close;
   dm.query_produtos.SQL.Clear;
   dm.query_produtos.SQL.Add('SELECT * from produtos where estoque <= estoque_min order by nome asc');
   dm.query_produtos.Open;

   if not dm.query_produtos.IsEmpty then
     begin
         dm.query_produtos.Close;
         dm.query_produtos.SQL.Clear;
         dm.query_produtos.SQL.Add('SELECT * from produtos where estoque <= estoque_min order by nome asc');
         dm.query_produtos.Open;

         dm.rel_Estoque.LoadFromFile(GetCurrentDir + '/rel/estoquebaixo.fr3');
            dm.rel_Estoque.PrintOptions.ShowDialog := false;
              dm.rel_Estoque.ShowReport();
            //dm.rel_Estoque.PrepareReport;

            dm.rel_Estoque.Print;
     end
      else
        begin
           ShowMessage('N�o tem nenhum produto com estoque baixo!');
        end;



   end;

end;

procedure TFrmEstoqueBaixo.buscarNome;
begin
dm.query_produtos.Close;
    dm.query_produtos.SQL.Clear;
    dm.query_produtos.SQL.Add('select * from produtos  where nome LIKE :nome and estoque <= 5 order by nome asc');

    dm.query_produtos.ParamByName('nome').Value := EdtBuscarNome.Text + '%';
    dm.query_produtos.Open;

end;

procedure TFrmEstoqueBaixo.EdtBuscarNomeChange(Sender: TObject);
begin
   if EdtBuscarNome.Text = '' then
      begin
        listar;
      end
        else
          begin
            buscarNome;
          end;
end;

procedure TFrmEstoqueBaixo.FormActivate(Sender: TObject);
begin
listar;
end;

procedure TFrmEstoqueBaixo.FormShow(Sender: TObject);
begin
listar;
end;

procedure TFrmEstoqueBaixo.grid_usuDblClick(Sender: TObject);
begin
  idProduto := dm.query_produtos.FieldByName('id').Value;
  nomeProduto := dm.query_produtos.FieldByName('nome').Value;
  estoqueProduto := dm.query_produtos.FieldByName('estoque').Value;
 chamada := 'Ent';
 FrmEntradasProdutos := TFrmEntradasProdutos.Create(self);
 FrmEntradasProdutos.ShowModal;
 listar;
end;

procedure TFrmEstoqueBaixo.listar;
begin
       dm.query_produtos.Close;
       dm.query_produtos.SQL.Clear;
       dm.query_produtos.SQL.Add('SELECT * from produtos where estoque <= estoque_min order by nome asc');
       dm.query_produtos.Open;
end;

end.
