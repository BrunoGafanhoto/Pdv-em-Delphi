unit AreaAdm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmAreaAdm = class(TForm)
    pnlLogin: TPanel;
    imgLogin: TImage;
    btn_login: TSpeedButton;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    procedure btn_loginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure loginAdmin;
  public
    { Public declarations }
  end;

var

  FrmAreaAdm: TFrmAreaAdm;

implementation

{$R *.dfm}

uses Modulo, MENU;

procedure TFrmAreaAdm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then //13 é a numeração da tecla "ENTER"
     begin
       loginAdmin;
     end;
end;




procedure TFrmAreaAdm.btn_loginClick(Sender: TObject);
begin
   loginAdmin;

end;



procedure TFrmAreaAdm.loginAdmin;
begin
 //VALIDAÇÃO DE CAMPOS

      if trim (EdtUsuario.text) = '' then
      begin
        MessageDlg('Preencha o Usuário', mtWarning, mbOKCancel, 0); //m de mensagem , t de text e information de informação, mb de messagem button, passar valores, variaveis etc
        EdtUsuario.SetFocus;
        exit;
      end;


      if trim (EdtSenha.text) = '' then
      begin
        MessageDlg('Preencha a Senha', mtWarning, mbOKCancel, 0);
        EdtSenha.SetFocus;
        exit;
      end;




    if areaAdministrativa = 'Gerenciar' then
    begin
       //LOGIN
        dm.query_usuarios.close;
        dm.query_usuarios.sql.clear;
        dm.query_usuarios.SQL.Add('SELECT * FROM usuarios where usuario = :usuario and senha = :senha');
        dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
        dm.query_usuarios.ParamByName('senha').Value := EdtSenha.Text;
        dm.query_usuarios.open;

        if not dm.query_usuarios.IsEmpty then
        begin

        nomeUsuario := dm.query_usuarios['usuario'];
        cargoUsuario := dm.query_usuarios['cargo'];


         if (cargoUsuario = 'Admin') or (cargoUsuario = 'Gerente') then
            begin

              EdtSenha.Text := '';
              FrmMenu := TFrmMenu.Create(self);
              FrmMenu.ShowModal;
             // areaAdministrativa := '';
              FrmAreaAdm.Close;

            end
              else
          begin
            MessageDlg('Você não tem permissão!', mtError, mbOKCancel ,0);
            EdtUsuario.Text := '';
            EdtSenha.Text := '';
            EdtUsuario.SetFocus;

            exit;
          end;

        end;

    end;
end;

end.
