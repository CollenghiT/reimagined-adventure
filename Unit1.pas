unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DCPcrypt2, DCPblockciphers, DCPdes, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtChave: TEdit;
    Label3: TLabel;
    edtResultado: TEdit;
    dcp_3ds1: TDCP_3des;
    Label4: TLabel;
    edtChaveCompleta: TEdit;
    btnDecript3: TButton;

    procedure btnDecriptPwd2Click(Sender: TObject);
    function SubStr(const S: string; const Start, Count: Integer): string;
    procedure btnDecript3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function StrToHex(Dado: String): String;
var cTemp: String;
I: Integer;
begin
  cTemp := '';
  for i := 1 to Length(Dado) Do
    cTemp := cTemp + IntToHex(Ord(Dado[i]), 2);
  Result := cTemp;
end;

function HexToInt(s: string): Longword;
var
  b: Byte;
  c: Char;
begin
  Result := 0;
  s := UpperCase(s);
  for b := 1 to Length(s) do
    begin
      Result := Result * 16;
      c := s[b];
      case c of
        '0'..'9': Inc(Result, Ord(c) - Ord('0'));
        'A'..'F': Inc(Result, Ord(c) - Ord('A') + 10);
        else
          raise EConvertError.Create('No Hex-Number');
      end;
    end;
end;

function HexToAsc(Dado: String): String;
  var cTemp: String;
      I: Integer;
begin
  cTemp := '';
  for i := 1 to Length(Dado) Do
  Begin
    if Not Odd(i) Then
      Begin
        cTemp := cTemp + Chr(HexToInt(Copy(Dado, i - 1, 2)));
      End;
  End;
  Result := cTemp;
end;






procedure TForm1.btnDecriptPwd2Click(Sender: TObject);
  var
  Result,IV, Senha2, Chave1,  Texto : string;
  tamanhoChave, tamanhoSenha ,K: Integer;
begin

  Chave1 := HexToAsc(Self.edtChave.Text);


  IV     := StringOfChar(#0, 8);

  tamanhoSenha := Length(Senha2);

  Self.dcp_3ds1.Init(Chave1[1],128,@IV[1]);
  Self.dcp_3ds1.DecryptCBC(Senha2[1], Senha2[1], tamanhoSenha);
  Self.dcp_3ds1.Burn;

  for K := 1 To Length(Senha2) do
              Result := Result + Chr( Ord(Senha2[K]) );

            Result := StrToHex(Result);
  Self.edtResultado.Text := Self.edtResultado.Text +  Result;
end;

function TForm1.SubStr(const S: string; const Start, Count: Integer): string;
begin
  Result := Copy(S, Start, Count);
end;



procedure TForm1.btnDecript3Click(Sender: TObject);
  var
  Result,IV, Senha1,Senha2, Chave1,  Texto : string;
  tamanhoChave, tamanhoSenha ,K: Integer;
begin

  Chave1 := HexToAsc(Self.edtChave.Text);
  Senha1 := HexToAsc(SubStr(edtChaveCompleta.Text,0,16));
  Senha2 := HexToAsc(SubStr(edtChaveCompleta.Text,17,16));

  IV     := StringOfChar(#0, 8);

  tamanhoSenha := Length(Senha1);
  Self.dcp_3ds1.Init(Chave1[1],128,@IV[1]);
  Self.dcp_3ds1.DecryptCBC(Senha1[1], Senha1[1], tamanhoSenha);
  Self.dcp_3ds1.Burn;

  Self.dcp_3ds1.Init(Chave1[1],128,@IV[1]);
  Self.dcp_3ds1.DecryptCBC(Senha2[1], Senha2[1], tamanhoSenha);
  Self.dcp_3ds1.Burn;

  Senha1 := Senha1 + Senha2;
  for K := 1 To Length(Senha1)
  do
  begin
    Result := Result + Chr( Ord(Senha1[K]) );
  end;
  edtResultado.Text := StrToHex(Result);
end;
end.
