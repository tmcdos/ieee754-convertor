unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    gb1: TGroupBox;
    e32n: TLabeledEdit;
    e64n: TLabeledEdit;
    e80n: TLabeledEdit;
    b32n: TButton;
    b64n: TButton;
    b80n: TButton;
    memOrder: TRadioGroup;
    numRes: TEdit;
    edGUID: TLabeledEdit;
    btnGUID: TButton;
    procedure b32nClick(Sender: TObject);
    procedure b64nClick(Sender: TObject);
    procedure b80nClick(Sender: TObject);
    procedure btnGUIDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tmp: String;

implementation

{$R *.dfm}

procedure TForm1.b32nClick(Sender: TObject);
var
  i32:Integer;
  r32:Single absolute i32;
begin
  if Length(e32n.Text)=8 Then
  Begin
    tmp:=e32n.Text;
    if memOrder.ItemIndex=1 Then
    Asm
      PUSH ESI
      MOV ESI,tmp
      MOV AX,[ESI]
      XCHG AX,[ESI+6]
      MOV [ESI],AX
      MOV AX,[ESI+2]
      XCHG AX,[ESI+4]
      MOV [ESI+2],AX
      POP ESI
    end;
    if TryStrToInt('$'+tmp,i32) then
      numRes.Text:=FloatToStr(r32)
    else numRes.Text:='ERROR';
  end
  else numRes.Text:='ERROR';
end;

procedure TForm1.b64nClick(Sender: TObject);
Var
  i64:Int64;
  r64:Double absolute i64;
begin
  if Length(e64n.Text)=16 Then
  Begin
    tmp:=e64n.Text;
    if memOrder.ItemIndex=1 Then
    Asm
      PUSH ESI
      MOV ESI,tmp
      MOV AX,[ESI]
      XCHG AX,[ESI+14]
      MOV [ESI],AX
      MOV AX,[ESI+2]
      XCHG AX,[ESI+12]
      MOV [ESI+2],AX
      MOV AX,[ESI+4]
      XCHG AX,[ESI+10]
      MOV [ESI+4],AX
      MOV AX,[ESI+6]
      XCHG AX,[ESI+8]
      MOV [ESI+6],AX
      POP ESI
    end;
    if TryStrToInt64('$'+tmp,i64) then
    begin
      if memOrder.ItemIndex=2 then numRes.Text:=DateTimeToStr(r64)
        else numRes.Text:=FloatToStr(r64);
    end
    else numRes.Text:='ERROR';
  end
  else numRes.Text:='ERROR';
end;

procedure TForm1.b80nClick(Sender: TObject);
Type
  ext_num = Record
    case Boolean of
      False:(
        Mantis:Int64;
        Expon:Integer;
        );
      True:(number:Extended);
  end;
Var
  tByte:ext_num;
begin
  if Length(e80n.Text)=20 Then
  Begin
    tmp:=e80n.Text;
    if memOrder.ItemIndex=1 Then
    Asm
      PUSH ESI
      MOV ESI,tmp
      MOV AX,[ESI]
      XCHG AX,[ESI+18]
      MOV [ESI],AX
      MOV AX,[ESI+2]
      XCHG AX,[ESI+16]
      MOV [ESI+2],AX
      MOV AX,[ESI+4]
      XCHG AX,[ESI+14]
      MOV [ESI+4],AX
      MOV AX,[ESI+6]
      XCHG AX,[ESI+12]
      MOV [ESI+6],AX
      MOV AX,[ESI+8]
      XCHG AX,[ESI+10]
      MOV [ESI+8],AX
      POP ESI
    end;
    if TryStrToInt64('$'+Copy(tmp,5,16),tByte.Mantis) and
      TryStrtoInt('$'+Copy(tmp,1,4),tByte.Expon) then
      numRes.Text:=FloatToStr(tByte.number)
    else numRes.Text:='ERROR';
  end
  else numRes.Text:='ERROR';
end;

procedure TForm1.btnGUIDClick(Sender: TObject);
var
  i,j:Integer;
  t1:packed Array[1..SizeOf(TGUID)] of Byte;
  t2:TGUID absolute t1;
begin
  if Length(edGUID.Text)=2*SizeOf(TGUID) Then
  Begin
    tmp:=edGUID.Text;
    if memOrder.ItemIndex=0 Then
    Asm
      PUSH ESI
      MOV ESI,tmp
      MOV AX,[ESI]
      XCHG AX,[ESI+30]
      MOV [ESI],AX
      MOV AX,[ESI+2]
      XCHG AX,[ESI+28]
      MOV [ESI+2],AX
      MOV AX,[ESI+4]
      XCHG AX,[ESI+26]
      MOV [ESI+4],AX
      MOV AX,[ESI+6]
      XCHG AX,[ESI+24]
      MOV [ESI+6],AX
      MOV AX,[ESI+8]
      XCHG AX,[ESI+22]
      MOV [ESI+8],AX
      MOV AX,[ESI+10]
      XCHG AX,[ESI+20]
      MOV [ESI+10],AX
      MOV AX,[ESI+12]
      XCHG AX,[ESI+18]
      MOV [ESI+12],AX
      MOV AX,[ESI+14]
      XCHG AX,[ESI+16]
      MOV [ESI+14],AX
      POP ESI
    end;
    for i:=Low(t1) to High(t1) Do
    Begin
      if TryStrToInt('$'+Copy(tmp,(i-1)*2+1,2),j) then t1[i]:=j
      Else
      Begin
        numRes.Text:='ERROR';
        Exit;
      end;
    end;
    numRes.Text:=GUIDToString(t2);
  End
  else numRes.Text:='ERROR';
end;

end.

