program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1�����ʽ ��������ͺϷ��ı�ʶ����ɵ�����
  ���֣����������������ͣ�1<2 1+1

  2����� �ɹؼ��ֺͲ���ָ�����
  ����
    ѡ����� -if��� case���
    ѭ�����
}
begin
  // if����ʽ
  // ��׼��ʽ
  if 1<2 then
  begin
    // ���ж���������ʱ��ִ�еĴ���
    Writeln('̨���һ��Ů');
  end;
  Readln;
  // ��д��ʽ��ǰ����ֻ��ִ��һ�д���
  if 1<2 then
    Writeln('�й���һ��Ů');
  // ���..����
  if True then
  begin
    Writeln('̨���һ��Ů����Ǿ');
  end     // �����зֺţ��ֺű�ʾ����
  else
  begin
    Writeln('̨���һ��Ů����־��');
  end;
  // ��д
  if True then
    Writeln('1:̨���һ��Ů����Ǿ')   // �����зֺţ��ֺű�ʾ����
  else
    Writeln('1:̨���һ��Ů����־��');

end.
