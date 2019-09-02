program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';

{*------------------------------------------------------------------------------
  1��ʲô�Ƕ�̬
    һ�������Զ�����̬���ڣ����綯��͹��࣬è��֮��Ĺ�ϵ
    ǰ�᣺������֮��߱��������̳У���ʵ�֣��ӿڣ������ֹ�ϵ
    �������֣�������ջ�ָ�����������
  2����̬��ʲô��
    ��ߴ���ĸ����ԣ��������ǶԴ�����н�������������֮�䲻Ҫ����ֱ�ӵ���������
  3����ôʹ��
-------------------------------------------------------------------------------}
var
  Animal: TAnimal;
  DogEat: IEat;
// ����ָ�򣬰�����Ķ�����������ת��Ϊ�˸������������

procedure ShowAnimalRun(Animal: TAnimal);
var
  Dog: TDog;
  Cat: TCat;
begin
{����ʱ����������}
  Animal.Run;
  {����ת�ͣ��Ѹ���Ķ������������ת��Ϊ�������������}
  // ǿ������ת��
  Writeln(Animal.ClassName);
  if Animal.ClassName = 'TDog' then
  begin
    Dog := TDog(Animal);
    Dog.LookDog;
  end;
  // is �ж�һ�������ͷź�һ�����ͼ���
  if Animal is TCat then
  begin
    Writeln('����ת��Ϊè');
    Cat:= Animal as TCat;
    // �ж϶����Ƿ�Ϊ��
    if Assigned(Cat) then
    begin
      Writeln('��');
    end
    else
    begin
      Cat.CatchMouse;
    end;

  end;

end;

begin
  Animal := TCat.Create;
  ShowAnimalRun(Animal);
  Readln;
end.

