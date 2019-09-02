program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{��̬����}

type
  MyArrayString = array of string;

var
  MyNameArray1: MyArrayString;
  MyNameArray2: MyArrayString;
  MyDatArray: MyArrayString;
  Indexs: Integer;
  MyElem1: string;
{��̬�����ʼ��}

procedure InitArray;
begin
  // ��һ���趨���ȷ���,�趨��̬���鳤��Ϊ10
  SetLength(MyNameArray1, 10);
  Writeln(Length(MyNameArray1), ',', Low(MyNameArray1));
  // �ڶ����趨���ȵķ���
  MyNameArray1 := MyArrayString.Create('����ʫ', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
  Writeln(Length(MyNameArray1), ',', Low(MyNameArray1));
  MyNameArray1 := ['����ޱ'];
  Writeln(Length(MyNameArray1), ',', Low(MyNameArray1));
end;
{�������鷽ʽ1}

procedure ListMyNameArray1;
begin
  MyNameArray1 := MyArrayString.Create('����ʫ', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
  for Indexs := Low(MyNameArray1) to High(MyNameArray1) do
  begin
    Writeln(MyNameArray1[Indexs]);
  end;
end;
{�������鷽ʽ2,Delphi7��֧�� }

procedure ListMyNameArray2;
begin
  MyNameArray1 := MyArrayString.Create('����ʫ', '��Ц��', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
  for MyElem1 in MyNameArray1 do
  begin
    Writeln(MyElem1)
  end;
end;  
{��������������̬����}

procedure ArrayConcat;
begin
  MyNameArray1 := MyArrayString.Create('����ʫ', '��Ц��', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
  MyNameArray2 := MyArrayString.Create('������');
  MyDatArray := Concat(MyNameArray1, MyNameArray2);
  for Indexs := Low(MyDatArray) to High(MyDatArray) do
  begin
    Writeln(MyDatArray[Indexs]);
  end;
end;
{������̬����}
procedure ArrayCopy;
begin
  MyNameArray1 := MyArrayString.Create('����ʫ', '��Ц��', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
  MyNameArray2:=Copy(MyNameArray1,Low(MyNameArray1),Length(MyNameArray1));
  for Indexs := Low(MyNameArray2) to High(MyNameArray2) do
  begin
    Writeln(MyNameArray2[Indexs]);
  end;
end;
{���붯̬����}
procedure ArrayInsert;
begin
  MyNameArray1 := MyArrayString.Create('����ʫ', '��Ц��', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
  MyNameArray2 := MyArrayString.Create('������');
  Insert(MyNameArray2,MyNameArray1,0);
  for Indexs := Low(MyNameArray1) to High(MyNameArray1) do
  begin
    Writeln(MyNameArray1[Indexs]);
  end;
end;  
{ɾ����̬�����Ԫ��}
procedure ArrayDelete;
begin
  MyNameArray1 := MyArrayString.Create('����ʫ', '��Ц��', 'Ī����', '���峽', '�ֻ���', '���±�', '����ޱ');
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

