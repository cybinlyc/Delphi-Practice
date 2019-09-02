program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{动态数组}

type
  MyArrayString = array of string;

var
  MyNameArray1: MyArrayString;
  MyNameArray2: MyArrayString;
  MyDatArray: MyArrayString;
  Indexs: Integer;
  MyElem1: string;
{动态数组初始化}

procedure InitArray;
begin
  // 第一种设定长度方法,设定动态数组长度为10
  SetLength(MyNameArray1, 10);
  Writeln(Length(MyNameArray1), ',', Low(MyNameArray1));
  // 第二种设定长度的方法
  MyNameArray1 := MyArrayString.Create('邓雅诗', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  Writeln(Length(MyNameArray1), ',', Low(MyNameArray1));
  MyNameArray1 := ['杨紫薇'];
  Writeln(Length(MyNameArray1), ',', Low(MyNameArray1));
end;
{遍历数组方式1}

procedure ListMyNameArray1;
begin
  MyNameArray1 := MyArrayString.Create('邓雅诗', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  for Indexs := Low(MyNameArray1) to High(MyNameArray1) do
  begin
    Writeln(MyNameArray1[Indexs]);
  end;
end;
{遍历数组方式2,Delphi7不支持 }

procedure ListMyNameArray2;
begin
  MyNameArray1 := MyArrayString.Create('邓雅诗', '罗笑颜', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  for MyElem1 in MyNameArray1 do
  begin
    Writeln(MyElem1)
  end;
end;  
{连接两个或多个动态数组}

procedure ArrayConcat;
begin
  MyNameArray1 := MyArrayString.Create('邓雅诗', '罗笑颜', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  MyNameArray2 := MyArrayString.Create('陈怡彬');
  MyDatArray := Concat(MyNameArray1, MyNameArray2);
  for Indexs := Low(MyDatArray) to High(MyDatArray) do
  begin
    Writeln(MyDatArray[Indexs]);
  end;
end;
{拷贝动态数组}
procedure ArrayCopy;
begin
  MyNameArray1 := MyArrayString.Create('邓雅诗', '罗笑颜', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  MyNameArray2:=Copy(MyNameArray1,Low(MyNameArray1),Length(MyNameArray1));
  for Indexs := Low(MyNameArray2) to High(MyNameArray2) do
  begin
    Writeln(MyNameArray2[Indexs]);
  end;
end;
{插入动态数组}
procedure ArrayInsert;
begin
  MyNameArray1 := MyArrayString.Create('邓雅诗', '罗笑颜', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  MyNameArray2 := MyArrayString.Create('陈怡彬');
  Insert(MyNameArray2,MyNameArray1,0);
  for Indexs := Low(MyNameArray1) to High(MyNameArray1) do
  begin
    Writeln(MyNameArray1[Indexs]);
  end;
end;  
{删除动态数组的元素}
procedure ArrayDelete;
begin
  MyNameArray1 := MyArrayString.Create('邓雅诗', '罗笑颜', '莫迪雄', '李彦辰', '林欢容', '郭月宝', '杨紫薇');
  Delete(MyNameArray1,0,1);
  for Indexs := Low(MyNameArray1) to High(MyNameArray1) do
  begin
    Writeln(MyNameArray1[Indexs]);
  end;  
end;

begin
  InitArray();
  Readln;
  ListMyNameArray1();
  Readln;
  ListMyNameArray2();
  Readln;
  ArrayConcat();
  Readln;
  ArrayCopy();
  Readln;
  ArrayInsert();
  Readln;
  ArrayDelete();
  Readln;
end.

