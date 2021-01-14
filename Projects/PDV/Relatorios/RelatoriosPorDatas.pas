unit RelatoriosPorDatas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrmRelDatas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dataFinal: TDateTimePicker;
    dataInicial: TDateTimePicker;
    BtnRelatorio: TSpeedButton;
    lblStatus: TLabel;
    cbStatus: TComboBox;
    Label3: TLabel;
    caixaFunc: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure dataInicialChange(Sender: TObject);
    procedure dataFinalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure dataBuscar;
    procedure carregarcombobox;
  public
    { Public declarations }
  end;

var
  FrmRelDatas: TFrmRelDatas;
  totEntradas : double;
  totSaidas : double;


implementation

{$R *.dfm}

uses Modulo;

procedure TFrmRelDatas.BtnRelatorioClick(Sender: TObject);
var
op :string;
begin



    if rel = 'Caixa' then
      begin

      //carregarcombobox;
      caixaFunc.Visible := true;
      label3.Visible := true;
        dm.query_caixa.Close;
        dm.query_caixa.SQL.Clear;
        dm.query_caixa.SQL.Add('SELECT * from caixa where operador = :func and data_abertura >= :datainicial and data_abertura <= :datafinal  ');
        op := caixaFunc.Text;
        dm.query_caixa.ParamByName('func').Value := op;
        dm.query_caixa.ParamByName('datainicial').Value := FormatDateTime('yyyy/mm/dd' ,datainicial.date);
        dm.query_caixa.ParamByName('datafinal').Value := FormatDateTime('yyyy/mm/dd' ,datafinal.date);
        dm.query_caixa.Prepare;
        dm.query_caixa.Open;
        dm.rel_caixa.LoadFromFile(GetCurrentDir + '/rel/novo2.fr3');
























        dm.rel_caixa.Variables['dataInicial'] := dataInicial.Date;
        dm.rel_caixa.Variables['dataFinal'] := dataFinal.Date;
        dm.rel_caixa.ShowReport();
        dm.rel_caixa.Print;


      end;

   if rel = 'Movimentacoes' then
      begin
      dm.query_mov.Close;
        dm.query_mov.SQL.Clear;
        dm.query_mov.SQL.Add('SELECT * from movimentacoes where data >= :datainicial and data <= :datafinal and status = "Cancelada" order by data asc');
        dm.query_mov.ParamByName('datainicial').Value := FormatDateTime('yyyy/mm/dd' ,datainicial.date);
        dm.query_mov.ParamByName('datafinal').Value := FormatDateTime('yyyy/mm/dd' ,datafinal.date);
        dm.query_mov.Open;


        if dm.query_mov.IsEmpty then
           begin
            dm.query_mov.Close;
            dm.query_mov.SQL.clear;
            dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= :datainicial and data <= :datafinal order by data asc');

            dm.query_mov.ParamByName('datainicial').value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
            dm.query_mov.ParamByName('datafinal').value := FormatDateTime('yyyy/mm/dd', dataFinal.Date);
            dm.query_mov.Prepare;
            dm.query_mov.Open;

            dm.rel_movimentacoes.LoadFromFile(GetCurrentDir + '/rel/reldatas.fr3');
            dm.rel_movimentacoes.Variables['dataInicial'] := dataInicial.Date;
            dm.rel_movimentacoes.Variables['dataFinal'] := dataFinal.Date;
            dm.rel_movimentacoes.Variables['totalEntradas'] := totEntradas;
            dm.rel_movimentacoes.Variables['totalSaidas'] := totSaidas;
                //dm.rel_movimentacoes.ShowReport();
            dm.rel_movimentacoes.PrintOptions.ShowDialog := false;
            dm.rel_movimentacoes.PrepareReport;
            dm.rel_movimentacoes.Print;

           end
             else
                begin
                  dm.query_mov.Close;
                  dm.query_mov.SQL.clear;
                  dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= :datainicial and data <= :datafinal and status = "Conclu�da" order by data asc');
                  dm.query_mov.ParamByName('datainicial').value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
                  dm.query_mov.ParamByName('datafinal').value := FormatDateTime('yyyy/mm/dd', dataFinal.Date);
                  dm.query_mov.Prepare;
                  dm.query_mov.Open;

                  dm.query_canc.Close;
                  dm.query_canc.SQL.clear;
                  dm.query_canc.SQL.Add('SELECT * FROM movimentacoes  where data >= :dataInicial and data <= :dataFinal and status = "Cancelada" order by data asc');
                  dm.query_canc.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
                  dm.query_canc.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd', dataFinal.Date);
                  dm.query_canc.Prepare;
                  dm.query_canc.Open;





                  dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/reldatascanc.fr3');
                  dm.rel_comprovante.Variables['dataInicial'] := dataInicial.Date;
                  dm.rel_comprovante.Variables['dataFinal'] := dataFinal.Date;
                  dm.rel_comprovante.Variables['totalEntradas'] := totEntradas;
                  dm.rel_comprovante.Variables['totalSaidas'] := totSaidas;
                      //dm.rel_movimentacoes.ShowReport();
                  dm.rel_comprovante.PrintOptions.ShowDialog := false;
                  dm.rel_comprovante.PrepareReport;
                  dm.rel_comprovante.Print;
                end;



      end;


       if rel = 'Vendas' then
      begin

        dm.query_mov.Close;
        dm.query_mov.SQL.Clear;
        dm.query_mov.SQL.Add('SELECT * from movimentacoes where data >= :datainicial and data <= :datafinal and status = :status order by data asc ');
        dm.query_mov.ParamByName('datainicial').Value := FormatDateTime('yyyy/mm/dd' ,datainicial.date);
        dm.query_mov.ParamByName('datafinal').Value := FormatDateTime('yyyy/mm/dd' ,datafinal.date);
        dm.query_mov.ParamByName('status').Value := cbStatus.Text;
        dm.query_mov.Open;
        dm.rel_mov_vendas.LoadFromFile(GetCurrentDir + '/rel/vendas.fr3');
        dm.rel_mov_vendas.Variables['datainicial'] := dataInicial.Date;
        dm.rel_mov_vendas.Variables['datafinal'] := dataFinal.Date;
        dm.rel_mov_vendas.Variables['status'] := '''' + cbStatus.Text + '''';
        //dm.rel_mov_vendas.ShowReport();
        dm.rel_caixa.Print;

      end;



end;

procedure TFrmRelDatas.carregarcombobox;
begin
dm.query_func.close;
 dm.query_func.open;

   if not dm.query_func.IsEmpty then
   begin
     while not dm.query_func.Eof do
       begin
         caixaFunc.Items.Add(dm.query_func.FieldByName('nome').AsString);
         dm.query_func.Next;

       end;
   end;
end;

procedure TFrmRelDatas.dataBuscar;
begin
dm.query_caixa.Close;
        dm.query_caixa.SQL.Clear;
        dm.query_caixa.SQL.Add('SELECT * from caixa where data_abertura >= :datainicial and data_abertura <= :datafinal order by data_abertura desc');
        dm.query_caixa.ParamByName('datainicial').Value := FormatDateTime('yyyy/mm/dd' ,datainicial.date);
        dm.query_caixa.ParamByName('datafinal').Value := FormatDateTime('yyyy/mm/dd' ,datafinal.date);
        dm.query_caixa.Open;
end;

procedure TFrmRelDatas.dataFinalChange(Sender: TObject);
begin
dataBuscar;
end;

procedure TFrmRelDatas.dataInicialChange(Sender: TObject);
begin
dataBuscar;
end;

procedure TFrmRelDatas.FormCreate(Sender: TObject);
begin
carregarcombobox;
end;

procedure TFrmRelDatas.FormShow(Sender: TObject);
begin
dataInicial.Date := date;
dataFinal.Date := date;

      if rel = 'Vendas' then
      begin
      cbStatus.ItemIndex := 0;
       lblStatus.Visible := true;
        cbStatus.Visible := true;

      end;
 caixaFunc.Visible := false;
      label3.Visible := false;

      if rel = 'Caixa' then
       begin
          caixaFunc.Visible := true;
           label3.Visible := true;
       end;


end;

end.
