unit Gastos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFrmGastos = class(TForm)
    Label2: TLabel;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    EdtMotivo: TEdit;
    grid: TDBGrid;
    EdtValor: TEdit;
    Label1: TLabel;
    BtnExcluir: TSpeedButton;
    edtBuscarData: TDateTimePicker;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure edtBuscarDataChange(Sender: TObject);


  private
    { Private declarations }
    procedure associarCampos;
    procedure listar;
    procedure buscarData;


  public
    { Public declarations }
  end;

var
  FrmGastos: TFrmGastos;
  idGastos : string;
  valor : double;

implementation

{$R *.dfm}

uses Modulo;

procedure TFrmGastos.associarCampos;
begin
 valor := strToFloat(edtValor.Text);
 dm.tb_gastos.FieldByName('motivo').Value := edtMotivo.Text;
 dm.tb_gastos.FieldByName('valor').Value := valor;
 dm.tb_gastos.FieldByName('data').Value := DateToStr(Date);
 dm.tb_gastos.FieldByName('funcionario').Value := nomeFunc;
end;



procedure TFrmGastos.BtnExcluirClick(Sender: TObject);
begin

 //EXCLUIR NAS MOVIMENTA��ES
 dm.query_mov.Close;
 dm.query_mov.SQL.Clear;
 dm.query_mov.SQL.Add('Delete from movimentacoes where id_movimento = :id');
 dm.query_mov.ParamByName('id').Value := idGastos;
 dm.query_mov.ExecSQL;




if MessageDlg('Deseja Excluir o Registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
//Confirmation pq � uma pergunta. mbyes e mbno, s�o os dois botoes de escolha. mryes = resposta do usuario
  begin
    dm.tb_gastos.Delete; //Se sim ele vai deletar
    MessageDlg('Excluido com Sucesso!', mtInformation, mbOKCancel,0);
    edtMotivo.Text := '';
    edtValor.Text := '';
    BtnSalvar.Enabled := false;
    BtnExcluir.Enabled := false;
    listar;
  end;
end;

procedure TFrmGastos.BtnNovoClick(Sender: TObject);
begin
 BtnSalvar.Enabled := True;
    EdtMotivo.Enabled := True;
      EdtValor.Enabled := True;
    EdtMotivo.Text := '';
    EdtValor.Text := '';
    EdtMotivo.SetFocus;

    dm.tb_gastos.Insert;
end;

procedure TFrmGastos.BtnSalvarClick(Sender: TObject);
begin
    if trim(EdtMotivo.text) = '' then
    begin
      MessageDlg('Preencha o Campo' , mtInformation, mbOKCancel,0);
      EdtMotivo.SetFocus;
      exit;
    end;
       if trim(EdtValor.text) = '' then
    begin
      MessageDlg('Preencha o Campo' , mtInformation, mbOKCancel,0);
      EdtValor.SetFocus;
      exit;
    end;






      if MessageDlg('Deseja salvar?', mtConfirmation, mbYesNo, 0) = mrYes then
        begin



          //SALVANDO

          associarCampos;
          dm.tb_gastos.Post;

          //RECUPERAR ID DO ULTIMO GASTO REGISTRADO

          dm.query_gastos.Close;
          dm.query_gastos.SQL.Clear;
          dm.query_gastos.SQL.Add('SELECT * from gastos order by id desc');
          dm.query_gastos.Open;

           if not dm.query_gastos.IsEmpty then
            begin
               idGastos := dm.query_gastos.fieldbyname('id').Value;

              end;





         //SALVAR NAS GASTOS NAS MOVIMENTA�OES

           dm.query_mov.Close;
           dm.query_mov.SQL.Clear;
           dm.query_mov.SQL.Add('INSERT INTO movimentacoes (tipo, movimento, valor, funcionario, data, id_movimento) VALUES(:tipo, :movimento,  :valor, :funcionario, :data, :id_movimento)');
           dm.query_mov.ParamByName('tipo').Value := 'Saida';
           dm.query_mov.ParamByName('movimento').Value := 'Gasto';
           dm.query_mov.ParamByName('valor').Value := valor;
           dm.query_mov.ParamByName('funcionario').Value := nomeFunc;
           dm.query_mov.ParamByName('data').AsDateTime:= NOW; // asdatetime e now para passar data e hora
           dm.query_mov.ParamByName('id_movimento').Value := idGastos;
           dm.query_mov.ExecSQL;


          //TAREFAS FINAIS

          MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel,0);
          EdtMotivo.Text := '';
          EdtMotivo.Enabled := false;
          EdtValor.Text := '';
          edtValor.Enabled := false;
          BtnSalvar.Enabled := false;
          listar;
        end;

    //m de mensagem , t de text e information de informa��o, mb de messagem button, passar valores, variaveis etc



end;

procedure TFrmGastos.buscarData;
begin
   dm.query_gastos.Close;
   dm.query_gastos.SQL.Clear;
   dm.query_gastos.SQL.Add('Select * from gastos where data = :data order by id desc');
   dm.query_gastos.ParamByName('data').Value := FormatDateTime('yyyy/mm/dd', edtBuscarData.Date);
   dm.query_gastos.Open;

end;

procedure TFrmGastos.edtBuscarDataChange(Sender: TObject);
begin
buscarData;
end;

procedure TFrmGastos.FormShow(Sender: TObject);
begin
dm.tb_gastos.Active := true;
listar;
                 dm.tb_gastos.Insert;
edtBuscarData.date := date;
buscarData;
end;



procedure TFrmGastos.gridCellClick(Column: TColumn);
begin
 EdtMotivo.enabled := true;
 EdtValor.enabled := true;

BtnExcluir.Enabled := true;


 dm.tb_gastos.edit;
 // Chamando a tabela cargo e avisando que vai fazer uma edi��o

 if dm.query_gastos.FieldByName('motivo').Value <> null then
  begin

    EdtMotivo.Text := dm.query_gastos.FieldByName('motivo').Value;
    EdtValor.Text := dm.query_gastos.FieldByName('valor').Value;
    // o campo edtnome recebe o que tem dentro do datamodule na query de cargos e filtre pra mim pelo nome que esteja na coluna de cargo e traga o valor

    idGastos := dm.query_gastos.FieldByName('id').Value;
  end;



end;

procedure TFrmGastos.listar;
begin
  dm.query_gastos.Close;
  dm.query_gastos.SQL.Clear;
  dm.query_gastos.SQL.Add('select * from gastos order by data desc');
  dm.query_gastos.Open;
end;

end.
