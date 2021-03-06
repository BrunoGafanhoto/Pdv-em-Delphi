unit Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFrmFornecedores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnEditar: TSpeedButton;
    EdtBuscarNome: TEdit;
    EdtNome: TEdit;
    EdtEnd: TEdit;
    EdtTelefone: TMaskEdit;
    grid_func: TDBGrid;
    EdtProd: TEdit;
    Label3: TLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure grid_funcCellClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtBuscarNomeChange(Sender: TObject);
    procedure grid_funcDblClick(Sender: TObject);
  private
    { Private declarations }
     procedure limpar;
     procedure habilitarCampos;
     procedure desabilitarCampos;


     procedure associarCampos;
    procedure listar;


    procedure buscarNome;


  public
    { Public declarations }
  end;

var
  FrmFornecedores: TFrmFornecedores;
  id : string;

implementation

{$R *.dfm}

uses Modulo;

{ TFrmFornecedores }

procedure TFrmFornecedores.associarCampos;
begin
dm.tb_forn.FieldByName('nome').Value := EdtNome.Text;
dm.tb_forn.FieldByName('produto').Value := EdtProd.Text;
dm.tb_forn.FieldByName('telefone').Value := EdtTelefone.Text;
dm.tb_forn.FieldByName('endereco').Value := EdtEnd.Text;
dm.tb_forn.FieldByName('data').Value := DateToStr(Date);
end;



procedure TFrmFornecedores.BtnEditarClick(Sender: TObject);
begin
//////// VALIDA��O DE CAMPOS///////////////

    if trim(EdtNome.Text) = '' then
      Begin
        MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
        EdtNome.SetFocus;
        exit;
      End;

    if Trim(EdtProd.text) = '' then
      begin
        MessageDlg('Preencha o campo do produto!',MtInformation , mbOKCancel,0);
        EdtProd.SetFocus;
        exit;
      end;

    if Trim(EdtEnd.Text) = '' then
      begin
        MessageDlg('Preencha o campo usu�rio!!',MtInformation ,mbOKCancel,0);
        EdtEnd.SetFocus;
        exit;
      end;

     if Trim(EdtTelefone.Text) = '' then
      begin
        MessageDlg('Preencha o campo de telefone!',mtInformation,mbOKCancel,0);
        EdtTelefone.SetFocus;
        exit;
      end;
if MessageDlg('Deseja editar esse registro?', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
          associarCampos;
      dm.query_forn.Close;
      dm.query_forn.SQL.Clear;
      dm.query_forn.SQL.Add('UPDATE fornecedores set nome = :nome, produto = :produto, telefone = :telefone, endereco = :endereco  where id = :id');// ('UPDATE funcionarios set cpf = :cpf');
      dm.query_forn.ParamByName('nome').value := EdtNome.Text;
      dm.query_forn.ParamByName('produto').value := EdtProd.Text;
      dm.query_forn.ParamByName('telefone').value := EdtTelefone.Text;
      dm.query_forn.ParamByName('endereco').Value := EdtEnd.Text;
      dm.query_forn.ParamByName('id').Value := id;
      dm.query_forn.ExecSQL;


      MessageDlg('Editado com Sucesso', mtInformation, mbOKCancel, 0);
      desabilitarCampos;
      BtnSalvar.Enabled := false;
      BtnEditar.Enabled := false;
      BtnExcluir.Enabled := false;
      limpar;
      listar;
   end;


end;

procedure TFrmFornecedores.BtnExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja excluir esse registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
 dm.tb_forn.Delete;
 Messagedlg('Excluido com Sucesso!', mtInformation, mbOKCancel ,0);
 limpar;
 /////
 desabilitarCampos;
 listar;
 BtnEditar.Enabled := false;
 BtnSalvar.Enabled := false;
 BtnExcluir.Enabled := false;
 end;
end;

procedure TFrmFornecedores.BtnNovoClick(Sender: TObject);

begin
    habilitarCampos;
    dm.tb_forn.Insert;
    BtnEditar.Enabled := false;
    BtnExcluir.Enabled := false;
    BtnSalvar.Enabled := true;
    EdtNome.SetFocus;


end;

procedure TFrmFornecedores.BtnSalvarClick(Sender: TObject);
var
nome : string;

begin
 //////// VALIDA��O DE CAMPOS///////////////

    if trim(EdtNome.Text) = '' then
      Begin
        MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
        EdtNome.SetFocus;
        exit;
      End;

    if Trim(EdtProd.text) = '' then
      begin
        MessageDlg('Preencha o campo do produto!',MtInformation , mbOKCancel,0);
        EdtProd.SetFocus;
        exit;
      end;

    if Trim(EdtEnd.Text) = '' then
      begin
        MessageDlg('Preencha o campo usu�rio!!',MtInformation ,mbOKCancel,0);
        EdtEnd.SetFocus;
        exit;
      end;

     if Trim(EdtTelefone.Text) = '' then
      begin
        MessageDlg('Preencha o campo de telefone!',mtInformation,mbOKCancel,0);
        EdtTelefone.SetFocus;
        exit;
      end;

      //Verifica��o de fornecedor existente
      dm.query_forn.Close;
      dm.query_forn.SQL.Clear;
      dm.query_forn.SQL.Add('SELECT * FROM fornecedores where nome = ' + QuotedStr(trim(EdtNome.Text)));
      dm.query_forn.open;

      if not dm.query_forn.IsEmpty then
        begin
          nome := dm.query_forn['nome'];
          MessageDlg('Esse Fornecedor' + nome + 'j� est� cadastrado!',mtInformation,mbOKCancel,0);
          limpar;
          EdtNome.Text := '';
          BtnEditar.Enabled := false;
          BtnExcluir.Enabled := false;
          listar;
          exit;
        end;

         if MessageDlg('Deseja salvar?', mtConfirmation, mbYesNo, 0) = mrYes then
        begin
        associarCampos;
        dm.tb_forn.Post;
        MessageDlg('Fornecedor cadastrado com sucesso!!',mtInformation,mbOKCancel,0);
        limpar;
        desabilitarCampos;
        BtnSalvar.Enabled := false;
        listar;
        end;
end;

procedure TFrmFornecedores.buscarNome;
begin
   dm.query_forn.Close;
   dm.query_forn.SQL.Clear;
   dm.query_forn.SQL.Add('Select * from fornecedores where nome LIKE :nome order by nome asc'); //LIKE PRA BUSCAR FE FORMA APROXIMADA
   dm.query_forn.ParamByName('nome').Value := EdtBuscarNome.Text + '%';  // PORCENTAGEM PQ TO USANDO LIKE
   dm.query_forn.Open;
end;

procedure TFrmFornecedores.desabilitarCampos;
begin
     EdtNome.Enabled := false;
      EdtTelefone.Enabled := false;
      EdtProd.enabled := false;
      EdtEnd.enabled := false;
end;

procedure TFrmFornecedores.EdtBuscarNomeChange(Sender: TObject);
begin
    if trim(EdtBuscarNome.Text) <> '' then
    begin
    buscarNome;
    end
    else
    begin
    listar;
    end;
end;

procedure TFrmFornecedores.FormCreate(Sender: TObject);
begin
dm.tb_forn.Active := true;
listar;
end;

procedure TFrmFornecedores.grid_funcCellClick(Column: TColumn);
begin
habilitarCampos;

  BtnEditar.enabled := true;
  BtnExcluir.enabled := true;

  dm.tb_forn.Edit; // Abrir edi��o


  if  dm.query_forn.FieldByName('nome').Value <> null then  // qualquer campo q n seja nulo

  EdtNome.Text := dm.query_forn.FieldByName('nome').Value;
  EdtProd.Text := dm.query_forn.FieldByName('produto').Value;


  if  dm.query_forn.FieldByName('telefone').Value <> null then
  EdtTelefone.Text := dm.query_forn.FieldByName('telefone').Value;

  if  dm.query_forn.FieldByName('endereco').Value <> null then
  EdtEnd.Text := dm.query_forn.FieldByName('endereco').Value;


  id := dm.query_forn.FieldByName('id').Value;




end;

procedure TFrmFornecedores.grid_funcDblClick(Sender: TObject);
begin

if chamada = 'forn' then
    begin
      idFornecedor := dm.query_forn.FieldByName('id').Value;
      nomeFornecedor := dm.query_forn.FieldByName('nome').Value;
      close;
      chamada := '';
    end;
end;

procedure TFrmFornecedores.habilitarCampos;
begin
      EdtNome.Enabled := true;
      EdtTelefone.Enabled := true;
      EdtProd.enabled := true;
      EdtEnd.enabled := true;

end;

procedure TFrmFornecedores.limpar;
begin
      EdtNome.Text := '';
      EdtTelefone.Text := '';
      EdtProd.Text := '';
      EdtEnd.Text := '';
end;

procedure TFrmFornecedores.listar;
begin
   dm.query_forn.Close;
   dm.query_forn.SQL.Clear;
   dm.query_forn.SQL.Add('Select * from fornecedores order by nome asc');
   dm.query_forn.Open;
end;

end.
