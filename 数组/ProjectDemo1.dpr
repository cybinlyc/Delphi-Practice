program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  MyArrayInt = array[0..4] of Integer;        // 静态数组

var
  MyArray1: MyArrayInt;
  Indexs: Integer;
  MyElem1: Integer;
  // 遍历数组

procedure ListMyarray1;
begin
  for Indexs := Low(MyArray1) to High(MyArray1) do
  begin
    Writeln(MyArray1[indexs]);
  end;
end;
// 遍历数组

procedure ListMyarry2;
begin
  for MyElem1 in MyArray1 do
  begin
    Writeln(MyElem1);
  end;
end;

begin
  MyArray1[0] := 10;
  MyArray1[1] := 20;
  MyArray1[2] := 30;
  MyArray1[3] := 40;
  MyArray1[4] := 50;

  ListMyarry2();
  Readln;
end.

