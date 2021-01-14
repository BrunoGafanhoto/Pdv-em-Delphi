unit ListaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmListaVendas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gridVendas: TDBGrid;
    dataFinal: TDateTimePicker;
    dataInicial: TDateTimePicker;
    cbEntradaSaida: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    lblVlrEntradas: TLabel;
    lblTotal: TLabel;
    BtnCancelar: TSpeedButton;
    BtnComprovante: TSpeedButton;
    BtnNotaFiscal: TSpeedButton;
    lblVlrCanceladas: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dataInicialChange(Sender: TObject);
    procedure dataFinalChange(Sender: TObject);
    procedure cbEntradaSaidaChange(Sender: TObject);
    procedure gridVendasCellClick(Column: TColumn);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnComprovanteClick(Sender: TObject);
    procedure BtnNotaFiscalClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscarData;
    procedure buscarTudo;
    procedure totalizarConcluidas;
    procedure totalizarCanceladas;
    procedure totalizar;
    procedure formatarGrid;
  public
    { Public declarations }
  end;

var
  FrmListaVendas: TFrmListaVendas;
  totConcluidas : real;
  totCanceladas: real;
  idListVendas : string;
  quantItem : Integer;
  id_produto : integer;
  estoque : integer;
estoqueP :integer;
implementation

{$R *.dfm}

uses Modulo;

{ TFrmListaVendas }

procedure TFrmListaVendas.BtnCancelarClick(Sender: TObject);
begin
 //messageDlg((idListVendas),mtInformation,mbOKCancel,0);
  if MessageDlg('Deseja realmente cancelar essa venda?',mtWarning, [mbYes,mbNo],0) = mrYes then

    begin

    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
    dm.query_mov.SQL.Add('UPDATE movimentacoes set status = :status where id_movimento = :id');
    dm.query_mov.ParamByName('status').Value := 'Cancelada';
    dm.query_mov.ParamByName('id').Value := idListVendas;
    dm.query_mov.ExecSQL;

    //Recuperar estoque da venda cancelada
      dm.query_mov.Close;
        dm.query_mov.SQL.clear;
        dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where id_movimento = :id');
        dm.query_mov.ParamByName('id').Value := idListVendas;
        dm.query_mov.Open;

        if dm.query_mov['movimento'] = 'Venda' then
        begin
        dm.query_det_vendas.Close;
        dm.query_det_vendas.SQL.clear;
        dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id');
        dm.query_det_vendas.ParamByName('id').Value := idListVendas;

        dm.query_det_vendas.Open;


         if not dm.query_det_vendas.IsEmpty then
             begin
               while not dm.query_det_vendas.Eof do
                 begin
                   id_produto := dm.query_det_vendas['id_produto'];
                   quantItem :=  dm.query_det_vendas['quantidade'];

                  //RECUPERAR VALOR ATUAL

                     dm.query_produtos.SQL.Clear;
                     dm.query_produtos.SQL.Add('SELECT * FROM produtos where id = :id');

                     dm.query_produtos.ParamByName('id').Value := id_produto;
                     dm.query_produtos.OPEN;

                     if not dm.query_produtos.IsEmpty then
                        begin
                        estoqueP := dm.query_produtos['estoque'];
                        end;
                  //ATUALIZAR O ESTOQUE

                      estoque := estoqueP + quantItem;

                     dm.query_produtos.Close;
                     dm.query_produtos.SQL.Clear;
                     dm.query_produtos.SQL.Add('UPDATE  produtos set estoque = :estoque where id = :id');
                     dm.query_produtos.ParamByName('estoque').Value := estoque;
                     dm.query_produtos.ParamByName('id').Value := id_produto;

                     dm.query_produtos.ExecSQL;






                   dm.query_det_vendas.Next;

                 end;
             end;
      end;

          if dm.query_mov['movimento'] = 'Venda Direta' then
           begin
            dm.query_det_vendas_dir.Close;
            dm.query_det_vendas_dir.SQL.clear;
            dm.query_det_vendas_dir.SQL.Add('SELECT * FROM detalhes_vendas_direta where id_venda = :id');
            dm.query_det_vendas_dir.ParamByName('id').Value := idListVendas;

            dm.query_det_vendas_dir.Open;


             if not dm.query_det_vendas_dir.IsEmpty then
                 begin
                   while not dm.query_det_vendas_dir.Eof do
                     begin
                       id_produto := dm.query_det_vendas_dir['id_produto'];
                       quantItem :=  dm.query_det_vendas_dir['quantidade'];


                            //RECUPERAR VALOR ATUAL

                         dm.query_produtos.SQL.Clear;
                         dm.query_produtos.SQL.Add('SELECT * FROM produtos where id = :id');

                         dm.query_produtos.ParamByName('id').Value := id_produto;
                         dm.query_produtos.OPEN;

                         if not dm.query_produtos.IsEmpty then
                            begin
                            estoqueP := dm.query_produtos['estoque'];
                            end;
                      //ATUALIZAR O ESTOQUE

                          estoque := estoqueP + quantItem;

                         dm.query_produtos.Close;
                         dm.query_produtos.SQL.Clear;
                         dm.query_produtos.SQL.Add('UPDATE  produtos set estoque = :estoque where id = :id');
                         dm.query_produtos.ParamByName('estoque').Value := estoque;
                         dm.query_produtos.ParamByName('id').Value := id_produto;

                         dm.query_produtos.ExecSQL;

                       dm.query_det_vendas_dir.Next;

                    end;
                end;



         end;





    //tarefas finais
    MessageDlg('Venda cancelada com sucesso!',mtInformation, mbOKCancel,0);
    buscarTudo;

    end;

end;

procedure TFrmListaVendas.BtnComprovanteClick(Sender: TObject);
begin
    
    //VENDA NORMAL
    if dm.query_mov.FieldByName('movimento').Value = 'Venda' then

    begin
      dm.query_vendas.Close;
      dm.query_vendas.SQL.Clear;
      dm.query_vendas.SQL.Add('SELECT * FROM vendas where id = :id_movimento');
      dm.query_vendas.ParamByName('id_movimento').Value := idListVendas;
      dm.query_vendas.Open;

      dm.query_det_vendas.Close;
      dm.query_det_vendas.SQL.Clear;
      dm.query_det_vendas.SQL.Add('SELECT * FROM detalhes_vendas where id_venda = :id');
      dm.query_det_vendas.ParamByName('id').Value := idListVendas;
      dm.query_det_vendas.Open;
        //Chamando comprovante
      dm.rel_comprovante.LoadFromFile(GetCurrentDir + '/rel/comprovante.fr3');
      dm.rel_comprovante.ShowReport();
      dm.rel_comprovante.Print;
      buscarTudo;

    end;

    //VENDA DIRETA

    if dm.query_mov.FieldByName('movimento').Value = 'Venda Direta' then

    begin
      dm.query_venda_dir.Close;
      dm.query_venda_dir.SQL.Clear;
      dm.query_venda_dir.SQL.Add('SELECT * FROM vendas_direta where id = :id_movimento');
      dm.query_venda_dir.ParamByName('id_movimento').Value := idListVendas;
      dm.query_venda_dir.Open;

      dm.query_det_vendas_dir.Close;
      dm.query_det_vendas_dir.SQL.Clear;
      dm.query_det_vendas_dir.SQL.Add('SELECT * FROM detalhes_vendas_direta where id_venda = :id');
      dm.query_det_vendas_dir.ParamByName('id').Value := idListVendas;
      dm.query_det_vendas_dir.Open;
       //Chamando comprovante
      dm.rel_comprovantedir.LoadFromFile(GetCurrentDir + '/rel/comprovantedadosdir.fr3');
      dm.rel_comprovantedir.ShowReport();
      dm.rel_comprovantedir.Print;
      buscarTudo;

    end;

    BtnComprovante.Enabled := false;
    BtnNotaFiscal.Enabled := false;

end;

procedure TFrmListaVendas.BtnNotaFiscalClick(Sender: TObject);
begin
messagedlg('Configurar como nas vendas!',mtInformation,mbOKCancel,0);
BtnComprovante.Enabled := false;
BtnNotaFiscal.Enabled := false;
end;

procedure TFrmListaVendas.buscarData;
begin
 totalizarConcluidas;
    totalizarCanceladas;
    totalizar;




    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
  if cbEntradaSaida.Text = 'Concluída' then
    begin
      dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= :dataInicial and data <= :dataFinal and status = :status and tipo = :tipo order by id desc');
      dm.query_mov.ParamByName('tipo').Value := 'Entrada';
      dm.query_mov.ParamByName('status').Value := 'Concluída';
    end
     else
       begin
       dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= :dataInicial and data <= :dataFinal and status = :status and tipo = :tipo order by id desc');
        dm.query_mov.ParamByName('tipo').Value := 'Entrada';
        dm.query_mov.ParamByName('status').Value := 'Cancelada';
       end;

     dm.query_mov.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd' ,dataInicial.Date);
     dm.query_mov.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd' ,dataFinal.date);
     dm.query_mov.Open;

     formatarGrid;

    end;


procedure TFrmListaVendas.buscarTudo;
begin

    totalizarConcluidas;
    totalizarCanceladas;
        totalizar;


    dm.query_mov.Close;
    dm.query_mov.SQL.Clear;
    dm.query_mov.SQL.Add('SELECT * FROM movimentacoes where data >= curDate() and tipo = :tipo order by id desc');
    dm.query_mov.ParamByName('tipo').Value := 'Entrada';
    dm.query_mov.Open;
    TFloatField(dm.query_mov.FieldByName('valor')).DisplayFormat := 'R$ #,,,,0.00';
   TFloatField(dm.query_mov.FieldByName('desconto')).DisplayFormat := 'R$ #,,,,0.00';
    TFloatField(dm.query_mov.FieldByName('valor_pago')).displayFormat := 'R$ #,,,,0.00';
TFloatField(dm.query_mov.FieldByName('troco')).displayFormat := 'R$ #,,,,0.00';
   formatarGrid;
end;

procedure TFrmListaVendas.cbEntradaSaidaChange(Sender: TObject);
begin
buscarData;
TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
  TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';
TFloatField(dm.query_mov.FieldByName('valor_pago')).displayFormat := 'R$ #,,,,0.00';
TFloatField(dm.query_mov.FieldByName('troco')).displayFormat := 'R$ #,,,,0.00';

if cbEntradaSaida.Text = 'Cancelada' then
  begin
    lblVlrEntradas.Caption := '0';

  end;


 if cbEntradaSaida.Text = 'Concluída' then
  begin
    lblVlrCanceladas.Caption := '0';

  end;
end;

procedure TFrmListaVendas.dataFinalChange(Sender: TObject);
begin
buscarData;
TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
  TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';
TFloatField(dm.query_mov.FieldByName('valor_pago')).displayFormat := 'R$ #,,,,0.00';
TFloatField(dm.query_mov.FieldByName('troco')).displayFormat := 'R$ #,,,,0.00';
end;

procedure TFrmListaVendas.dataInicialChange(Sender: TObject);
begin
buscarData;
TFloatField(dm.query_mov.FieldByName('desconto')).displayFormat :='R$ #,,,,0.00';
  TFloatField(dm.query_mov.FieldByName('valor')).displayFormat := 'R$ #,,,,0.00';
 TFloatField(dm.query_mov.FieldByName('valor_pago')).displayFormat := 'R$ #,,,,0.00';
TFloatField(dm.query_mov.FieldByName('troco')).displayFormat := 'R$ #,,,,0.00';
end;

procedure TFrmListaVendas.formatarGrid;
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
gridVendas.Columns.Items[4].Title.Caption := 'Valor';
gridVendas.Columns[4].Alignment := taLeftJustify;


gridVendas.Columns.Items[5].Title.Caption := 'Metodo';
gridVendas.Columns[5].Alignment := taCenter;

 gridVendas.Columns.Items[6].FieldName := 'status';
gridVendas.Columns.Items[6].Title.Caption := 'Status';
gridVendas.Columns.Items[6].Width := 70;

gridVendas.Columns.Items[7].FieldName := 'valor_pago';
gridVendas.Columns.Items[7].Title.Caption := 'Valor_Recebido';
GridVendas.Columns[7].Alignment := taLeftJustify;

gridVendas.Columns.Items[8].FieldName := 'troco';
gridVendas.Columns.Items[8].Title.Caption := 'Troco';

GridVendas.Columns[8].Alignment := taLeftJustify;


gridVendas.Columns.Items[9].FieldName := 'funcionario';
gridVendas.Columns.Items[9].Title.Caption := 'Funcionario';
gridVendas.Columns.Items[9].Width := 72;

gridVendas.Columns.Items[10].Title.Caption := 'Data';
gridVendas.Columns.Items[11].Title.Caption := 'Hora';
gridVendas.Columns.Items[12].Title.Caption := 'Num_Venda';
gridVendas.Columns[12].Alignment := taCenter;
end;

procedure TFrmListaVendas.FormShow(Sender: TObject);
begin
lblVlrCanceladas.Caption := formatFloat('R$ #,,,,0.00', strToFloat(lblVlrCanceladas.Caption));
lblVlrEntradas.Caption := formatFloat('R$ #,,,,0.00', strToFloat(lblVlrEntradas.Caption));
lblTotal.Caption := formatFloat('R$ #,,,,0.00', strToFloat(lblTotal.Caption));

cbEntradaSaida.ItemIndex := 0;

dm.tb_mov.Active := false;
dm.tb_mov.Active := true;

dataInicial.Date := date;
dataFinal.Date := date;

totalizarConcluidas;
totalizarCanceladas;
totalizar;
buscarTudo;
end;

procedure TFrmListaVendas.gridVendasCellClick(Column: TColumn);
begin


  dm.tb_mov.Edit;

  if  dm.query_mov.fieldByName('movimento').value <> null then
  begin
    idListVendas := dm.query_mov.FieldByName('id_movimento').Value;
    btnCancelar.Enabled := true;
    BtnComprovante.Enabled := true;
    BtnNotaFiscal.Enabled := true;
  end;





end;

procedure TFrmListaVendas.totalizar;
 var
tot : real;
begin

 tot := totConcluidas - totCanceladas;
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

procedure TFrmListaVendas.totalizarCanceladas;
var
tot: real;
begin
   dm.query_mov.Close;
  dm.query_mov.SQL.Clear;  //Sum faz soma no campo valor // se colocar * nao tem como fazer o sum...
  dm.query_mov.SQL.Add('Select sum(valor) as total from movimentacoes where data >= :dataInicial and data <= :dataFinal and status = "Cancelada" ');
  dm.query_mov.ParamByName('dataInicial').value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
  dm.query_mov.ParamByName('dataFinal').value := FormatDateTime('yyyy/mm/dd', dataFinal.Date);
  dm.query_mov.Prepare;
  dm.query_mov.Open;



  tot := dm.query_mov.FieldByName('total').AsFloat;
  totCanceladas := tot;
  lblVlrCanceladas.Caption := FormatFloat('R$ #,,,,0.00',tot);
end;

procedure TFrmListaVendas.totalizarConcluidas;
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
  totConcluidas := tot;
  lblVlrEntradas.Caption := FormatFloat('R$ #,,,,0.00',tot);
end;



end.
