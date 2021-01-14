unit FluxoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmFluxoCaixa = class(TForm)
    BtnRelatorio: TSpeedButton;
    grid_usu: TDBGrid;
    dataBuscar: TDateTimePicker;
    Label1: TLabel;
    procedure dataBuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  procedure buscarData;
  procedure carregarComboBox;
  public
    { Public declarations }
  end;

var
  FrmFluxoCaixa: TFrmFluxoCaixa;

implementation

{$R *.dfm}

uses Modulo, RelatoriosPorDatas;

{ TFrmFluxoCaixa }

procedure TFrmFluxoCaixa.BtnRelatorioClick(Sender: TObject);
begin
 rel := 'Caixa';
 FrmRelDatas := TFrmRelDatas.create(self);
 FrmRelDatas.ShowModal;
end;

procedure TFrmFluxoCaixa.buscarData;
begin
     dm.query_caixa.Close;
     dm.query_caixa.SQL.Clear;
     dm.query_caixa.SQL.Add('SELECT * from caixa where data_abertura = :data');   // INNER JOIN � quando quero pegar dados de uma tabela diferente.
     dm.query_caixa.ParamByName('data').Value := FormatDateTime('yyyy/mm/dd' ,dataBuscar.date);
     dm.query_caixa.Open;
end;

procedure TFrmFluxoCaixa.carregarComboBox;
begin
 
end;

procedure TFrmFluxoCaixa.dataBuscarChange(Sender: TObject);
begin
buscarData;
end;

procedure TFrmFluxoCaixa.FormShow(Sender: TObject);
begin



dm.tb_caixa.Active := true;
dataBuscar.Date := date;
buscarData;



end;

end.
