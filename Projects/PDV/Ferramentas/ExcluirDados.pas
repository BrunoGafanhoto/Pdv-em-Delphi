unit ExcluirDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TFrmExcluirDados = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BtnRelatorio: TSpeedButton;
    dataFinal: TDateTimePicker;
    dataInicial: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExcluirDados: TFrmExcluirDados;

implementation

{$R *.dfm}

uses VendaDireta, Vendas, Modulo;

procedure TFrmExcluirDados.BtnRelatorioClick(Sender: TObject);
begin

  //if messagedlg('Deseja realmente excluir os registros?',mtInformation , mbOKCancel,0) = mrYes then

     if excluir = 'Vendas' then
      begin

        if messagedlg('Deseja realmente excluir as vendas de ' + DateToStr(dataInicial.date) +  ' � ' + DateToStr(dataFinal.date) + '?',mtInformation , MbYESNO,0) = mrYes then
        begin
         //EXCLUINDO VENDA NORMAL
         dm.query_vendas.Close;
         dm.query_vendas.SQL.Clear;
         dm.query_vendas.SQL.Add('DELETE FROM vendas where data >= :dataInicial and data <= :dataFinal');
         dm.query_vendas.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
         dm.query_vendas.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
         dm.query_vendas.ExecSql;

         dm.query_det_vendas.Close;
         dm.query_det_vendas.SQL.Clear;
         dm.query_det_vendas.SQL.Add('DELETE FROM detalhes_vendas where data >= :dataInicial and data <= :dataFinal');
         dm.query_det_vendas.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
         dm.query_det_vendas.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
         dm.query_det_vendas.ExecSql;


         // EXCLUIDNO VENDA DIRETA
         dm.query_venda_dir.Close;
         dm.query_venda_dir.SQL.Clear;
         dm.query_venda_dir.SQL.Add('DELETE FROM vendas_direta where data >= :dataInicial and data <= :dataFinal');
         dm.query_venda_dir.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
         dm.query_venda_dir.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
         dm.query_venda_dir.ExecSql;

         dm.query_det_vendas_dir.Close;
         dm.query_det_vendas_dir.SQL.Clear;
         dm.query_det_vendas_dir.SQL.Add('DELETE FROM detalhes_vendas_direta where data >= :dataInicial and data <= :dataFinal ');
         dm.query_det_vendas_dir.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
         dm.query_det_vendas_dir.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
         dm.query_det_vendas_dir.ExecSql;

         showMessage('Excluido com sucesso!');
        end;
      end;



       if excluir = 'Caixa' then
          begin
                if messagedlg('Deseja realmente excluir os dados de caixas de ' + DateToStr(dataInicial.date) +  ' � ' + DateToStr(dataFinal.date) + '?',mtInformation , MbYESNO,0) = mrYes then
                 begin
                   dm.query_caixa.Close;
                   dm.query_caixa.SQL.Clear;
                   dm.query_caixa.SQL.Add('DELETE FROM caixa where data_abertura >= :dataInicial and data_abertura <= :dataFinal');
                   dm.query_caixa.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
                   dm.query_caixa.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
                   dm.query_caixa.ExecSql;
                   showMessage('Excluido com sucesso!');
                 end;

          end;



       if excluir = 'Movimentacoes' then
          begin
                if messagedlg('Deseja realmente excluir as Movimenta��es de ' + DateToStr(dataInicial.date) +  ' � ' + DateToStr(dataFinal.date) + '?',mtInformation , MbYESNO,0) = mrYes then
                  begin
                   dm.query_mov.Close;
                   dm.query_mov.SQL.Clear;
                   dm.query_mov.SQL.Add('DELETE FROM movimentacoes where data >= :dataInicial and data <= :dataFinal');
                   dm.query_mov.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
                   dm.query_mov.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
                   dm.query_mov.ExecSql;
                   showMessage('Excluido com sucesso!');
                  end;

          end;




end;

procedure TFrmExcluirDados.FormShow(Sender: TObject);
begin
dataInicial.Date := date;
dataFinal.Date := date;
end;

end.
