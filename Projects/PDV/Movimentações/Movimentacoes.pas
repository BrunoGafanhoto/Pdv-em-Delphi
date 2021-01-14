unit Movimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmMovimentacoes = class(TForm)
    gridVendas: TDBGrid;
    Label1: TLabel;
    dataFinal: TDateTimePicker;
    dataInicial: TDateTimePicker;
    Label2: TLabel;
    cbEntradaSaida: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblVlrEntradas: TLabel;
    lblVlrSaidas: TLabel;
    lblTotal: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dataInicialChange(Sender: TObject);
    procedure dataFinalChange(Sender: TObject);
    procedure cbEntradaSaidaChange(Sender: TObject);
  private
    { Private declarations }
    procedure buscarData;
    procedure buscarTudo;
    procedure totalizarEntradas;
    procedure totalizarSaidas;
    procedure totalizar;
    procedure formatarGrid;

  public
    { Public declarations }
  end;

var
  FrmMovimentacoes: TFrmMovimentacoes;
  totEntradas : real;
  totSaidas: real;



implementation

{$R *.dfm}

uses Modulo, MENU;

procedure TFrmMovimentacoes.buscarData;
begin
    totalizarEntradas;
    totalizarSaidas;
    totalizar;




    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
  if cbEntradaSaida.Text = 'Tudo' then
    begin
      dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= :dataInicial and data <= :dataFinal order by id desc');
    end
     else
       begin
       dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= :dataInicial and data <= :dataFinal and tipo = :tipo order by id desc');
       dm.query_mov.ParamByName('tipo').Value := cbEntradaSaida.Text;
       end;

     dm.query_mov.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
     dm.query_mov.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
     dm.query_mov.Open;

     formatarGrid;

    end;








procedure TFrmMovimentacoes.buscarTudo;
begin
    totalizarEntradas;
    totalizarSaidas;
    totalizar;


    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
    dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= curDate() order by id desc');
    dm.query_mov.Open;
    TFloatField(dm.query_mov.FieldByName('valor')).DisplayFormat := 'R$ #,,,,0.00';
   TFloatField(dm.query_mov.FieldByName('desconto')).DisplayFormat := 'R$ #,,,,0.00';
   formatarGrid;


end;


procedure TFrmMovimentacoes.cbEntradaSaidaChange(Sender: TObject);
begin
buscarData;
TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
  TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';

 if cbEntradaSaida.Text = 'Saida' then
  begin
    lblVlrEntradas.Caption := '0';

  end;


 if cbEntradaSaida.Text = 'Entrada' then
  begin
    lblVlrSaidas.Caption := '0';
    
  end;

end;

procedure TFrmMovimentacoes.dataFinalChange(Sender: TObject);
begin
buscarData;
TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
  TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';

end;

procedure TFrmMovimentacoes.dataInicialChange(Sender: TObject);
begin
buscarData;
TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
  TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';

end;

procedure TFrmMovimentacoes.formatarGrid;
begin
gridVendas.Columns.Items[0].Title.Caption := 'Id';
gridVendas.Columns.Items[0].Visible := false;

gridVendas.Columns.Items[1].FieldName := 'tipo';
gridVendas.Columns.Items[1].Title.caption := 'Tipo';
gridVendas.Columns.Items[1].Width := 70;

gridVendas.Columns.Items[2].FieldName := 'movimento';
gridVendas.Columns.Items[2].Title.Caption := 'Movimento';
GridVendas.Columns[2].Alignment := taCenter;
//gridVendas.Columns.Items[2].Width := 60;


gridVendas.Columns[3].Alignment := taLeftJustify;  //Alinhar
gridVendas.Columns.Items[3].Title.Caption := 'Desconto';
gridVendas.Columns.Items[3].Width := 80;


//gridVendas.Columns.Items[3].FieldName := 'valor';
gridVendas.Columns.Items[4].Title.Caption := 'ValorComDesc';
gridVendas.Columns[4].Alignment := taLeftJustify;


gridVendas.Columns.Items[5].Title.Caption := 'Metodo';
gridVendas.Columns[5].Alignment := taCenter;

 gridVendas.Columns.Items[6].Title.Caption := 'Status';
gridVendas.Columns.Items[6].Visible := false;

gridVendas.Columns.Items[7].Title.Caption := 'valor_pago';
gridVendas.Columns.Items[7].Visible := false;

gridVendas.Columns.Items[8].Title.Caption := 'troco';
gridVendas.Columns.Items[8].Visible := false;


gridVendas.Columns.Items[9].FieldName := 'funcionario';
gridVendas.Columns.Items[9].Title.Caption := 'Funcionario';
gridVendas.Columns.Items[9].Width := 72;

gridVendas.Columns.Items[10].Title.Caption := 'Data';
gridVendas.Columns.Items[11].Title.Caption := 'Hora';
gridVendas.Columns.Items[12].Title.Caption := 'Num_Venda';
gridVendas.Columns[12].Alignment := taCenter;

//gridVendas.Columns.Items[4].FieldName := 'funcionario';
//gridVendas.Columns.Items[4].Title.Caption := 'Funcionario';

//gridVendas.Columns.Items[5].FieldName := 'data';
//gridVendas.Columns.Items[5].Title.Caption := 'Data';

//gridVendas.Columns.Items[6].Visible := False;
end;

procedure TFrmMovimentacoes.FormShow(Sender: TObject);
begin

lblVlrSaidas.Caption := formatFloat('R$ #,,,,0.00', strToFloat(lblVlrSaidas.Caption));
lblVlrEntradas.Caption := formatFloat('R$ #,,,,0.00', strToFloat(lblVlrEntradas.Caption));
lblTotal.Caption := formatFloat('R$ #,,,,0.00', strToFloat(lblTotal.Caption));

cbEntradaSaida.ItemIndex := 0;

dm.tb_mov.Active := false;
dm.tb_mov.Active := true;

dataInicial.Date := date;
dataFinal.Date := date;

totalizarEntradas;
totalizarSaidas;
totalizar;
buscarTudo;

end;

procedure TFrmMovimentacoes.totalizar;
var
tot : real;
begin
 tot := totEntradas - totSaidas;
 if tot >= 0 then
  begin
    lblTotal.Font.Color := clGreen; //COR DA FONTE
    end
      else
        begin
        lblTotal.Font.Color := clRed; //COR DA FONTE
        end;

   lblTotal.Caption := formatFloat('R$ #,,,,0.00',tot);
end;

procedure TFrmMovimentacoes.totalizarEntradas;
var
tot:real;
begin

  dm.query_mov.Close;
  dm.query_mov.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
  dm.query_mov.SQL.Add('Select sum(valor) as total from movimentacoes where data >= :dataInicial and data <= :dataFinal and tipo = "Entrada" ');
  dm.query_mov.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
  dm.query_mov.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd', dataFinal.Date);
  dm.query_mov.Prepare;
  dm.query_mov.Open;



  tot := dm.query_mov.FieldByName('total').AsFloat;
  totEntradas := tot;
  lblVlrEntradas.Caption := FormatFloat('R$ #,,,,0.00',tot);


end;

procedure TFrmMovimentacoes.totalizarSaidas;
var
tot:real;
begin
dm.query_mov.Close;
dm.query_mov.SQL.Clear;
dm.query_mov.SQL.Add('Select sum(valor) as total from movimentacoes where data >= :dataInicial and data <= :dataFinal and tipo = "Saida" ');
dm.query_mov.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
dm.query_mov.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd',dataFinal.date);
dm.query_mov.Prepare; //Prepare para que o servidor de banco de dados remoto aloque recursos para a consulta e execute otimizações adicionais.
dm.query_mov.Open;
tot := dm.query_mov.FieldByName('total').AsFloat;
totSaidas := tot;
lblVlrSaidas.Caption := formatFloat('R$ #,,,,0.00', tot);


end;

end.
