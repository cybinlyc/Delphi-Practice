program ProjectDemo2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1�������   ��������� +,-,*,/(������),div��������,mod��ȡģ��
}
begin
  // д��������ָ̨��������
  Writeln(6/2);
  Writeln(6 div 4);
  Writeln(6 mod 4);

  // ���������
  Writeln(1=2);
  Writeln(1<>2);
  Writeln(not(1<>2));
  // �ӿ���̨��ȡһ�����ݣ������ڵ���Ҫ��������ͣ�ȴ����ȴ����ǰ��»س���
  readln;
end.
