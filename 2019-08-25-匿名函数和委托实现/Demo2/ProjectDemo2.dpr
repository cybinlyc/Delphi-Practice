program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';
{ί��ʵ�֣��ؼ�֮implements �ӿ�}

var
  Dog: TDog;
  Cat: TCat;

begin
  Dog:=TDog.Create;
  Cat:=TCat.Create;
  {Cat�̳���IEat�ӿڣ�ԭ��IEat�ӿ��еķ�����Ҫ��Cat��ʵ�֣���������Cat�е�IEat�з�����Dog�е�
  ��һ�µģ�Ϊ�˱���������࣬��Cat�ж��������� implements IEatί�б����ʵ�֣������һ�����
  ί��TDog����ʵ��TCat���еĽӿڷ���   }
  Cat.Eat:=TDog.Create;
  Cat.Eat.Eating;
  Readln;
end.

