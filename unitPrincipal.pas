unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnDeletar: TSpeedButton;
    Panel2: TPanel;
    edtId: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    Label5: TLabel;
    edtCidade: TEdit;
    edtUf: TEdit;
    Label6: TLabel;
    edtCep: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtCnpj: TEdit;
    Label9: TLabel;
    edtIe: TEdit;
    Label10: TLabel;
    edtCelular: TEdit;
    Label11: TLabel;
    edtContato: TEdit;
    Label12: TLabel;
    edtEmail: TEdit;
    Label13: TLabel;
    edtSite: TEdit;
    Label14: TLabel;
    edtObservacoes: TEdit;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    edtPesquisar: TEdit;
    Button1: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BotaoNovo;
    procedure BotaoSalvar;
    procedure BotaoEditar;
    procedure BotaoCancelar;
    procedure BotaoDeletar;
    procedure HabilitarEdits;
    procedure DesabilitarEdits;
    procedure LimparCampos;
    procedure InserirDados;
    procedure Update;
    procedure PopularEdits;
    procedure Pesquisar;
    procedure Deletar;
    procedure CancelarCampos;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o registro?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
  begin
     if trim(edtId.Text) = '' then
        InserirDados
     else
          Update;
          LimparCampos;
          DesabilitarEdits;
          Pesquisar;
          BotaoSalvar;
  end;


  LimparCampos;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Pesquisar;
end;

procedure TForm1.CancelarCampos;
begin

  edtNome.Text := '';
  edtEndereco.Text := '';
  edtBairro.Text := '';
  edtCidade.Text := '';
  edtUf.Text := '';
  edtCep.Text := '';
  edtCnpj.Text := '';
  edtIe.Text := '';
  edtCelular.Text := '';
  edtContato.Text := '';
  edtEmail.Text := '';
  edtSite.Text := '';
  edtObservacoes.Text := '';
end;

procedure TForm1.Deletar;
var
  lID : Integer;
begin
  lID := DM.QueryFornecedores.FieldByName('id').AsInteger;
   with DM.QueryFornecedores do
    begin
      close;
      SQL.Clear;
      SQL.Add('delete from fornecedores where id = :pid');
      ParamByName('pid').AsInteger :=  lID;
      ExecSQL;
      MessageDlg('Registro deletado com sucesso', mtInformation, [mbOK], 0);
    end;
end;

procedure TForm1.DesabilitarEdits;
begin
  edtNome.Enabled := false;
  edtEndereco.Enabled := false;
  edtBairro.Enabled := false;
  edtCidade.Enabled := false;
  edtUf.Enabled := false;
  edtCep.enabled := false;
  edtCnpj.Enabled := false;
  edtIe.Enabled := false;
  edtCelular.Enabled := false;
  edtContato.Enabled := false;
  edtEmail.Enabled := false;
  edtSite.Enabled := false;
  edtObservacoes.Enabled := false;
end;

procedure TForm1.HabilitarEdits;
begin
  edtNome.Enabled := true;
  edtEndereco.Enabled := true;
  edtBairro.Enabled := true;
  edtCidade.Enabled := true;
  edtUf.Enabled := true;
  edtCep.enabled := true;
  edtCnpj.Enabled := true;
  edtIe.Enabled := true;
  edtCelular.Enabled := true;
  edtContato.Enabled := true;
  edtEmail.Enabled := true;
  edtSite.Enabled := true;
  edtObservacoes.Enabled := true;
end;

procedure TForm1.InserirDados;
begin
  with DM.QueryFornecedores do
    begin
      close;
      SQL.Clear;
      SQL.Add('insert into fornecedores (nome, endereco, bairro, cidade, uf, cep, cnpj, ie,');
      SQL.Add('celular, contato, email, site, observacoes) values ');
      SQL.Add('(:pnome, :pendereco, :pbairro, :pcidade, :puf, :pcep, :pcnpj, :pie, :pcelular,');
      SQL.Add(':pcontato, :pemail, :psite, :pobservacoes)');
      ParamByName('pnome').AsString := edtNome.Text;
      ParamByName('pendereco').AsString := edtEndereco.Text;
      ParamByName('pbairro').AsString := edtBairro.Text;
      ParamByName('pcidade').AsString := edtCidade.Text;
      ParamByName('puf').AsString := edtUf.Text;
      ParamByName('pcep').AsString := edtCep.Text;
      ParamByName('pcnpj').AsString := edtCnpj.Text;
      ParamByName('pie').AsString := edtIe.Text;
      ParamByName('pcelular').AsString := edtCelular.Text;
      ParamByName('pcontato').AsString := edtContato.Text;
      ParamByName('pemail').AsString := edtEmail.Text;
      ParamByName('psite').AsString := edtSite.Text;
      ParamByName('pobservacoes').AsString := edtObservacoes.Text;
      ExecSQL;
      DesabilitarEdits;
      Pesquisar;
    end;
end;

procedure TForm1.LimparCampos;
begin
  edtId.Text := '';
  edtNome.Text := '';
  edtEndereco.Text := '';
  edtBairro.Text := '';
  edtCidade.Text := '';
  edtUf.Text := '';
  edtCep.Text := '';
  edtCnpj.Text := '';
  edtIe.Text := '';
  edtCelular.Text := '';
  edtContato.Text := '';
  edtEmail.Text := '';
  edtSite.Text := '';
  edtObservacoes.Text := '';
end;

procedure TForm1.Pesquisar;
  var
  lID : Integer;
begin
  lID := DM.QueryFornecedores.FieldByName('id').AsInteger;
  DM.QueryFornecedores.Close;
  DM.QueryFornecedores.SQL.Clear;

  DM.QueryFornecedores.SQL.Text := 'select * from fornecedores where nome like ' +  QuotedStr('%' + edtPesquisar.Text + '%') ;
  DM.QueryFornecedores.Open();
end;

procedure TForm1.PopularEdits;
begin
  edtId.Text        := DM.QueryFornecedores.FieldByName('ID').AsString;
  edtNome.Text      := DM.QueryFornecedores.FieldByName('NOME').AsString;
  edtEndereco.text  := DM.QueryFornecedores.FieldByName('ENDERECO').AsString;
  edtBairro.Text    := DM.QueryFornecedores.FieldByName('BAIRRO').AsString;
  edtCidade.Text    := DM.QueryFornecedores.FieldByName('CIDADE').AsString;
  edtUf.Text        := DM.QueryFornecedores.FieldByName('UF').AsString;
  edtCep.Text       := DM.QueryFornecedores.FieldByName('CEP').AsString;
  edtCnpj.Text      := DM.QueryFornecedores.FieldByName('CNPJ').AsString;
  edtIe.text        := DM.QueryFornecedores.FieldByName('IE').AsString;
  edtCelular.Text   := DM.QueryFornecedores.FieldByName('CELULAR').AsString;
  edtContato.Text   := DM.QueryFornecedores.FieldByName('CONTATO').AsString;
  edtEmail.Text     := DM.QueryFornecedores.FieldByName('EMAIL').AsString;
  edtSite.Text      := DM.QueryFornecedores.FieldByName('SITE').AsString;
  edtObservacoes.Text := DM.QueryFornecedores.FieldByName('OBSERVACOES').AsString;
end;

procedure TForm1.Update;
begin
    with DM.QueryFornecedores do
    begin
      close;
      SQL.Clear;
      SQL.Add('update fornecedores               ' +
        '       set nome     = :pnome,          ' +
			  '       endereco     = :pendereco,      ' +
			  '       bairro       = :pbairro,        ' +
			  '       cidade       = :pcidade,        ' +
			  '       uf           = :puf,           ' +
			  '       cep          = :pcep,           ' +
        '       cnpj         = :pcnpj,          ' +
        '         ie         = :pie,            ' +
        '       celular      = :pcelular,       ' +
        '       contato      = :pcontato ,      ' +
        '       email        = :pemail ,        ' +
        '       site         = :psite,          ' +
        '       observacoes = :pobservacoes    ' +
			  ' where id       = :pid        ');

    ParamByName('pid').AsInteger      :=  StrtoInt(edtId.Text);
	  ParamByName('pnome').AsString     :=  edtNome.Text;
	  ParamByName('pendereco').AsString :=  edtEndereco.Text;
	  ParamByName('pbairro').AsString   :=  edtBairro.Text;
	  ParamByName('pcidade').AsString   :=  edtCidade.Text;
	  ParamByName('puf').AsString       :=  edtUf.Text;
    ParamByName('pcep').AsString      :=  edtCep.Text;
    ParamByName('pcnpj').AsString     :=  edtCnpj.Text;
    ParamByName('pie').AsString       :=  edtIe.Text;
    ParamByName('pcelular').AsString  :=  edtCelular.Text;
    ParamByName('pcontato').AsString  :=  edtContato.Text;
    ParamByName('pemail').AsString    :=  edtEmail.Text;
    ParamByName('psite').AsString    :=  edtSite.Text;
    ParamByName('pobservacoes').AsString :=  edtObservacoes.Text;
      try
        ExecSQL;
          ShowMessage('Altera��o feita com sucesso');
      except on E: Exception do
        raise Exception.Create('Erro na Altera��o do registro!' + E.Message);
      end;
    LimparCampos;
    end;

end;

procedure TForm1.BotaoCancelar;
begin
  btnNovo.Enabled := true;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := false;
  btnCancelar.Enabled := true;
  btnDeletar.Enabled := false;
end;

procedure TForm1.BotaoDeletar;
begin
  btnNovo.Enabled := true;
  btnSalvar.Enabled := false;
  btnEditar.Enabled := false;
  btnCancelar.Enabled := false;
  btnDeletar.Enabled  := true;
end;

procedure TForm1.BotaoEditar;
begin
  btnNovo.Enabled := false;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnDeletar.Enabled := false;
end;

procedure TForm1.BotaoNovo;
begin
  btnNovo.Enabled := false;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := false;
  btnCancelar.Enabled := true;
  btnDeletar.Enabled  := true;
end;

procedure TForm1.BotaoSalvar;
begin
 btnNovo.Enabled := true;
 btnSalvar.Enabled := true;
 btnEditar.Enabled := true;
 btnCancelar.Enabled := true;
 btnDeletar.Enabled := false;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  CancelarCampos;
  BotaoCancelar;
end;

procedure TForm1.btnDeletarClick(Sender: TObject);
begin
Deletar;
DesabilitarEdits;
BotaoDeletar;
Pesquisar;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
if MessageDlg('Deseja editar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
HabilitarEdits;
PopularEdits;
BotaoEditar;

end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
  BotaoNovo;
  HabilitarEdits;
end;

end.
