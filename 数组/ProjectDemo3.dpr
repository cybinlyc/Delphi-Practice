program ProjectDemo3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  {��ά��̬����}
  TStringDynamicArray = array of array of string;
  {��ά��̬����}

  TStringStaticArray = array[0..1] of array[0..2] of string;

var
  StaticNameArray: TStringStaticArray;
  DynamicNameArray: TStringDynamicArray;
  Indexs: Integer;
  I: Integer;

begin
  DynamicNameArray := [['���', '�й�', 'ǿ��'], ['���', 'ʫʫ', '����']];
  StaticNameArray[0][0] := '��ޱ';
  for Indexs := Low(DynamicNameArray) to High(DynamicNameArray) do
  begin
    for I := Low(DynamicNameArray[Indexs]) to High(DynamicNameArray[Indexs]) do
    begin
      Writeln(DynamicNameArray[Indexs][I]);
    end;
  end;

  Writeln(StaticNameArray[0][0]);
  Readln;
end.

