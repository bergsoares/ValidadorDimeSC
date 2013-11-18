// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDime.asmx?WSDL
//  >Import : http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDime.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (13/11/2013 12:41:02 - - $Rev: 56641 $)
// ************************************************************************ //

unit ValidadorDime;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  DtoErro              = class;                 { "http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS"[GblCplx] }
  DtoRetorno           = class;                 { "http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS"[GblCplx] }



  // ************************************************************************ //
  // XML       : DtoErro, global, <complexType>
  // Namespace : http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS
  // ************************************************************************ //
  DtoErro = class(TRemotable)
  private
    FLinha: Integer;
    FMensagem: string;
    FMensagem_Specified: boolean;
    procedure SetMensagem(Index: Integer; const Astring: string);
    function  Mensagem_Specified(Index: Integer): boolean;
  published
    property Linha:    Integer  Index (IS_NLBL) read FLinha write FLinha;
    property Mensagem: string   Index (IS_OPTN) read FMensagem write SetMensagem stored Mensagem_Specified;
  end;

  ArrayOfDtoErro = array of DtoErro;            { "http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS"[GblCplx] }


  // ************************************************************************ //
  // XML       : DtoRetorno, global, <complexType>
  // Namespace : http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS
  // ************************************************************************ //
  DtoRetorno = class(TRemotable)
  private
    FStatus: string;
    FStatus_Specified: boolean;
    FErros: ArrayOfDtoErro;
    FErros_Specified: boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetErros(Index: Integer; const AArrayOfDtoErro: ArrayOfDtoErro);
    function  Erros_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Status: string          Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property Erros:  ArrayOfDtoErro  Index (IS_OPTN) read FErros write SetErros stored Erros_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS
  // soapAction: http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS/ValidarDime
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : ValidadorDimeSoap
  // service   : ValidadorDime
  // port      : ValidadorDimeSoap
  // URL       : http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDime.asmx
  // ************************************************************************ //
  ValidadorDimeSoap = interface(IInvokable)
  ['{394AD3D1-B78C-B027-772A-860A660F8441}']
    function  ValidarDime(const pDime: string; const pUsuario: string): DtoRetorno; stdcall;
  end;

function GetValidadorDimeSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ValidadorDimeSoap;


implementation
  uses SysUtils;

function GetValidadorDimeSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ValidadorDimeSoap;
const
  defWSDL = 'http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDime.asmx?WSDL';
  defURL  = 'http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDime.asmx';
  defSvc  = 'ValidadorDime';
  defPrt  = 'ValidadorDimeSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ValidadorDimeSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure DtoErro.SetMensagem(Index: Integer; const Astring: string);
begin
  FMensagem := Astring;
  FMensagem_Specified := True;
end;

function DtoErro.Mensagem_Specified(Index: Integer): boolean;
begin
  Result := FMensagem_Specified;
end;

destructor DtoRetorno.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErros)-1 do
    SysUtils.FreeAndNil(FErros[I]);
  System.SetLength(FErros, 0);
  inherited Destroy;
end;

procedure DtoRetorno.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function DtoRetorno.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure DtoRetorno.SetErros(Index: Integer; const AArrayOfDtoErro: ArrayOfDtoErro);
begin
  FErros := AArrayOfDtoErro;
  FErros_Specified := True;
end;

function DtoRetorno.Erros_Specified(Index: Integer): boolean;
begin
  Result := FErros_Specified;
end;

initialization
  { ValidadorDimeSoap }
  InvRegistry.RegisterInterface(TypeInfo(ValidadorDimeSoap), 'http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ValidadorDimeSoap), 'http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS/ValidarDime');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ValidadorDimeSoap), ioDocument);
  { ValidadorDimeSoap.ValidarDime }
  InvRegistry.RegisterMethodInfo(TypeInfo(ValidadorDimeSoap), 'ValidarDime', '',
                                 '[ReturnName="ValidarDimeResult"]', IS_OPTN);
  RemClassRegistry.RegisterXSClass(DtoErro, 'http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS', 'DtoErro');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDtoErro), 'http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS', 'ArrayOfDtoErro');
  RemClassRegistry.RegisterXSClass(DtoRetorno, 'http://webservices.sathomologa.sef.sc.gov.br/Sat.Declaracao.Dime.Validador.WS', 'DtoRetorno');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DtoRetorno), 'Erros', '[ArrayItemName="DtoErro"]');

end.