unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    imgFundo: TImage;
    pnlLogin: TPanel;
    imgLogin: TImage;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    btn_login: TSpeedButton;
    lblRegistro: TLabel;
    lblDTVCTO: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btn_loginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure  centralizarPainel;
    procedure  login;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation


{$R *.dfm}

uses
MENU, Usuarios, Modulo, Caixa ,NomePossuidor, Onguard, OgUtil, uRegistro;

const
  EncryptionKey : TKey = ($E5, $1A, $84, $D6, $92, $C9, $DF, $D8,
                          $1A, $FC, $6F, $84, $AB, $FC, $DF, $B4);
function SerialNum(FDrive: String): String;
Var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: Array [0 .. 11] of Char;
begin
  Try
    GetVolumeInformation(PChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  Except
    Result := '';
  end;

end;


procedure TFrmLogin.btn_loginClick(Sender: TObject);
begin


login;



end;

procedure TFrmLogin.centralizarPainel;
begin
   pnlLogin.Top := (self.height div 2) - (pnlLogin.height div 2 );
    pnlLogin.Left := (self.Width div 2) - (pnlLogin.Width div 2) ;
end;

procedure TFrmLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    centralizarPainel;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin        //ATALHO PARA ACEITAR O "ENTER" NO LOGIN
   if key = 13 then //13 é a numeração da tecla "ENTER"
   begin
     login;
   end;


end;

procedure TFrmLogin.FormShow(Sender: TObject);
var
  Key : TKey;
  Code : TCode;
  Modifier : Longint;
  D : TDateTime;
begin

    hd := SerialNum('c');
//Verificar Registro do Sistema
   if dm.tb_registro.RecordCount > 0 then
   begin
      if dm.tb_registroultimo_acesso.value < 0 then
      begin
        if messagedlg('Deseja efetuar o registro do software?',mtInformation, mbYESNO,0) = mrYes then
        begin
          frmRegistro := TfrmRegistro.Create(self);
          try
          frmRegistro.ShowModal;
          finally
            frmRegistro.Release;
            frmRegistro := nil;
          end;

        end
         else
           begin
             application.Terminate;
           end;

      end;

       Key := EncryptionKey;
    Modifier := StringHashELF(dm.tb_registrocodigo.Text);
    ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
    HexToBuffer(dm.tb_registrocod_liberacao.Text, Code, SizeOf(Code));
    lblDTVCTO.caption := datetostr(GetExpirationDate(Key,Code));
    if IsRegCodeValid(Key, Code) then begin
      if IsRegCodeExpired(Key, Code) then
        lblRegistro.caption := 'Registro Expirado'
      else
        lblRegistro.caption := 'Registro Valido';
       lblRegistro.Font.Color := clGreen;
    end else
      lblRegistro.caption:= 'Registro Invalido';
   end
    else
      begin
       lblRegistro.caption:= 'Registro Invalido';
      end;


  if lblRegistro.Caption <> 'Registro Valido' then
    begin
      if messagedlg('Deseja efetuar o registro do software?',mtInformation, mbYESNO,0) = mrYes then
        begin
          frmRegistro := TfrmRegistro.Create(self);
          try
          frmRegistro.ShowModal;
          finally
            frmRegistro.Release;
            frmRegistro := nil;
          end;

        end
         else
           begin
             application.Terminate;
           end;
    end;





end;

procedure TFrmLogin.login;
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


//AQUI VIRÁ O CÓDIGO DE LOGIN

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
  nomeFunc := dm.query_usuarios['nome'];




  //VERIFICAR SE QUEM LOGOU FOI UM OPERADOR DE CAIXA
  if cargoUsuario = 'Operador de Caixa' then
    begin
         EdtSenha.Text := '';
         FrmCaixa := TFrmCaixa.Create(FrmLogin);
         statusCaixa := 'Abertura';

         FrmCaixa.ShowModal;
         FrmLogin.Close;
         exit;
    end;
  
  EdtSenha.Text := '';
  FrmMenu := TFrmMenu.Create(FrmLogin);
  FrmMenu.ShowModal;
  FrmLogin.Close;
  end
  else
    begin
      MessageDlg('Usuário ou senha incorreto!', mtError, mbOKCancel ,0);
      EdtUsuario.Text := '';
      EdtSenha.Text := '';
      EdtUsuario.SetFocus;
      exit;
    end;


end;

end.
