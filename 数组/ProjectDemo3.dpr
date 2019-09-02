program ProjectDemo3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  {二维动态数组}
  TStringDynamicArray = array of array of string;
  {二维静态数组}

  TStringStaticArray = array[0..1] of array[0..2] of string;

var
  StaticNameArray: TStringStaticArray;
  DynamicNameArray: TStringDynamicArray;
  Indexs: Integer;
  I: Integer;

begin
  DynamicNameArray := [['你好', '中国', '强大'], ['你好', '诗诗', '胡歌']];
  StaticNameArray[0][0] := '紫薇';
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

