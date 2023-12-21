unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    Label5: TLabel;
    edtCidade: TEdit;
    Label6: TLabel;
    edtUf: TEdit;
    Label7: TLabel;
    edtCep: TEdit;
    Label8: TLabel;
    edtCnpjCpf: TEdit;
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
    edtObservaçoes: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarCampos;
    procedure DesabilitarCampos;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.DesabilitarCampos;
begin
   edtId.Enabled := false;
  edtNome.Enabled := false;
  edtEndereco.Enabled := false;
  edtBairro.Enabled := false;
  edtCidade.Enabled := false;
  edtUf.Enabled := false;
  edtCep.Enabled := false;
  edtCnpjCpf := false;
  edtIe.Enabled := false;
  edtCelular := false;
  edtContato.Enabled := false;
  edtEmail.Enabled := false;
  edtSite.Enabled := false;
  edtObservaçoes := false;
end;

procedure TForm1.HabilitarCampos;
begin
  edtId.Enabled := false;
  edtNome.Enabled := true;
  edtEndereco.Enabled := true;
  edtBairro.Enabled := true;
  edtCidade.Enabled := true;
  edtUf.Enabled := true;
  edtCep.Enabled := true;
  edtCnpjCpf := true;
  edtIe.Enabled := true;
  edtCelular := true;
  edtContato.Enabled := true;
  edtEmail.Enabled := true;
  edtSite.Enabled := true;
  edtObservaçoes := true;

end;

end.
