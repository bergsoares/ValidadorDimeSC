unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    bbtValidar: TButton;
    mmoRetorno: TMemo;
    detCaminhoArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    odlMain: TOpenDialog;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    procedure bbtValidarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ValidadorDime;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if odlMain.Execute then
  begin
    detCaminhoArquivo.Text := odlMain.FileName;
    detCaminhoArquivo.Text := detCaminhoArquivo.Text;
    bbtValidar.SetFocus;
  end;
end;

procedure TForm1.Action1Execute(Sender: TObject);
begin
  bbtValidarClick(nil);
end;

procedure TForm1.bbtValidarClick(Sender: TObject);
var
  WS: ValidadorDimeSoap;
  DimeRetor: DtoRetorno;
  I: integer;
  ArquivoDimeSelecionado: TStringList;
begin
   WS := GetValidadorDimeSoap(true);
   ArquivoDimeSelecionado:= TStringList.Create;
   try
     try
       ArquivoDimeSelecionado.LoadFromFile(detCaminhoArquivo.Text);
       DimeRetor := WS.ValidarDime(ArquivoDimeSelecionado.GetText,'');
       mmoRetorno.Lines.Clear;
       mmoRetorno.Lines.Add('');
       mmoRetorno.Lines.Add('************************************ Status da Validação: '+DimeRetor.Status+' **************************************');
       mmoRetorno.Lines.Add('');
       for I := Low(DimeRetor.Erros) to High(DimeRetor.Erros) do
       begin
         mmoRetorno.Lines.Add('Linha: ' + inttostr(DimeRetor.Erros[i].Linha) + ' - Erro: '+DimeRetor.Erros[i].Mensagem);
       end;
     except
       on E : exception do
         mmoRetorno.Lines.Add(E.message);
     end;
   finally
     FreeAndNil(ArquivoDimeSelecionado);
   end;

end;

end.
