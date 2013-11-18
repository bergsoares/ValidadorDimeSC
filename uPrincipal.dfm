object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 
    'Validador da Dime - Declara'#231#227'o do ICMS e do Mov. Econ'#244'mico de Sa' +
    'nta Catarina'
  ClientHeight = 398
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 604
    Top = 22
    Width = 23
    Height = 23
    Hint = 'Selecione o arquivo para valida'#231#227'o'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 99
    Height = 13
    Caption = 'Caminho do arquivo:'
  end
  object bbtValidar: TButton
    Left = 555
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Validar (F9)'
    TabOrder = 0
    OnClick = bbtValidarClick
  end
  object mmoRetorno: TMemo
    Left = 8
    Top = 63
    Width = 619
    Height = 299
    Enabled = False
    Lines.Strings = (
      
        'Este mecanismo foi projetado para agilizar o processo de homolog' +
        'a'#231#227'o '#8220'em vez de realiz'#225'-lo de forma manual como no caso do '
      'envio de arquivos de DIME no ambiente de produ'#231#227'o do SAT.'
      ''
      'Onde est'#225' dispon'#237'vel?'
      ''
      
        'O Web Service de valida'#231#227'o para homologa'#231#227'o da DIME est'#225' dispon'#237 +
        'vel no endere'#231'o:'
      
        '<http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDi' +
        'me.asmx>'
      ''
      
        'O documento de descri'#231#227'o do Servi'#231'o em WSDL est'#225' dispon'#237'vel no e' +
        'ndere'#231'o:'
      
        '<http://webservices.sathomologa.sef.sc.gov.br/wsDime/ValidadorDi' +
        'me.asmx?WSDL> '
      ''
      'Fortes Inform'#225'tica Ltda.')
    TabOrder = 1
  end
  object detCaminhoArquivo: TEdit
    Left = 8
    Top = 23
    Width = 597
    Height = 22
    TabOrder = 2
  end
  object odlMain: TOpenDialog
    Filter = 'Arquivos Dime (*.TXT)|*.TXT'
    Left = 568
    Top = 16
  end
  object ActionList1: TActionList
    Left = 520
    Top = 16
    object Action1: TAction
      Caption = 'F9'
      ShortCut = 120
      OnExecute = Action1Execute
    end
  end
end
