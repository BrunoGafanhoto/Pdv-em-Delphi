unit RetiradaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TFrmRetiradaCaixa = class(TForm)
    Label1: TLabel;
    edtValor: TEdit;
    edtMotivo: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    grid_retirada: TDBGrid;
    BtnExcluir: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure grid_retiradaCellClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure associarCampos;
    procedure limpar;
    procedure listar;
  end;

var
  FrmRetiradaCaixa: TFrmRetiradaCaixa;
  id : string;

implementation

{$R *.dfm}

uses Modulo;

{ TFrmRetiradaCaixa }

procedure TFrmRetiradaCaixa.associarCampos;
begin
   dm.tb_retirada.fieldbyname('funcionario').Value := nomeFunc;
   dm.tb_retirada.fieldbyname('valor').Value := edtValor.Text;
   dm.tb_retirada.fieldByName('motivo').Value := edtMotivo.Text;
   dm.tb_retirada.fieldByName('data').value := DateToStr(date); // asdatetime e now para passar data e hora
   dm.tb_retirada.fieldByName('hora').value := TimeToStr(Time);

end;

procedure TFrmRetiradaCaixa.BtnExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja excluir esse registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
 dm.query_retirada.Close;
 dm.query_retirada.SQL.Clear;
 dm.query_retirada.sql.Add('DELETE FROM retirada_caixa where id = :id');
 dm.query_retirada.ParamByName('id').Value := id;
 dm.query_retirada.Execute;
 Messagedlg('Excluido com Sucesso!', mtInformation, mbOKCancel ,0);
 limpar;
 end;
 // DELETAR TAMB�M O USU�RIO ASSOCIADO A ELE
end;

procedure TFrmRetiradaCaixa.Button1Click(Sender: TObject);
begin
      if trim(EdtValor.text) = '' then
    begin
      MessageDlg('Preencha o Valor' , mtInformation, mbOKCancel,0);
      EdtValor.SetFocus;
      exit;
    end;

       if trim(edtMotivo.text) = '' then
    begin
      MessageDlg('Preencha o Motivo' , mtInformation, mbOKCancel,0);
      edtMotivo.SetFocus;
      exit;
    end;

   dm.tb_retirada.Insert;
     if MessageDlg('Deseja realmente retirar?', mtConfirmation, mbYesNo, 0) = mrYes then
        begin

          associarCampos;
          dm.tb_retirada.Post;
          MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel,0);
          limpar;
         
          listar;
        end;



end;

procedure TFrmRetiradaCaixa.FormActivate(Sender: TObject);
begin
dm.tb_retirada.Insert;
end;

procedure TFrmRetiradaCaixa.FormShow(Sender: TObject);
begin
dm.tb_retirada.Active := true;
dm.tb_retirada.Insert;
listar;
end;

procedure TFrmRetiradaCaixa.grid_retiradaCellClick(Column: TColumn);
begin

  edtValor.Text := dm.query_retirada.FieldByName('valor').Value;
  edtMotivo.Text := dm.query_retirada.FieldByName('motivo').Value;


  id := dm.query_retirada.FieldByName('id').Value;
  BtnExcluir.Enabled := true;
end;

procedure TFrmRetiradaCaixa.limpar;
begin
 edtValor.text := '';
    edtMotivo.Text := '';
end;

procedure TFrmRetiradaCaixa.listar;
begin
   dm.query_retirada.Close;
   dm.query_retirada.SQL.Clear;
   dm.query_retirada.SQL.Add('Select * from retirada_caixa where data = curDate() and funcionario = :func order by hora asc');
   dm.query_retirada.ParamByName('func').Value := nomeFunc;
   dm.query_retirada.Open;
end;

end.
