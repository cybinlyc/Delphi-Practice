program ProjectDemo1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
  1������
    1)����
    2)��ʼ��
  2�������
  3�����ʽ
}
var
  packPos:Int32;                    // ��ǰȡֵλ��
  tmpReadPosition:Integer;
  packPosOld:Int32;                 // ָʾǰһ��λ��7f 7f
  datPackSize:Int32;                // �Ӱ���ȡ�õĳ���
  ecgNumSize:Int32;

  ecgDataBuf:array of Byte;         // ��ȡecg�ļ��Ļ�����
  ecgFile:Textfile;                 // ����һ���ļ�����
  ecgStr:string;                    // �洢�ļ��е���������
  ecgStrTmp:string;
  strPos:Int32;                     // ���ʵ��ַ���λ��
  kk:Int32;
  fileName:string;                  // �ļ�����
  sysIdReadNext:Byte;               // ��ID
  sysIdRead:Byte;                   // �����ݰ���ȡ��ID
  lostIdCnt:Int32;                  // ����ID�������Ĵ���
  lostIdNum:Int32;                  // ����ID��ʧ�ĸ���
begin
  sysIdRead:=0;
  sysIdReadNext:=0;
  lostIdCnt:=0;
  lostIdNum:=0;
  try
    Writeln('�������ļ�����D:\xxx.txt');
    Readln(fileName);
  except
    Writeln('�ļ�������');
  end;
  
  AssignFile(ecgFile,fileName);   // ���ļ�������� F ����
  //AssignFile(ecgFile,'D:\ecgDataTest.txt'); // ���ļ�������� F ����
  Reset(ecgFile);                   // �򿪲���ȡ�ļ� F

  // ��ȡ�ļ�����������
  while not eof(ecgFile) do
  begin
    Readln(ecgFile,ecgStr);         // ��ȡ1���ı��ļ����ݵ�ecgStr��
  end;
  // �������鳤��ΪLength(ecgStr),����������,�±��0��ʼ
  SetLength(ecgDataBuf,( Length(ecgStr) div 3 ) );

  // ѭ����ȡ�ַ�������
  for strPos := 1 to Length(ecgStr) do
  begin
    if ecgStr[strPos]=' ' then
    begin
      ecgStrTmp:=Copy(ecgStr,strPos-2,2);
      ecgDataBuf[strPos div 3-1]:= StrToInt('$'+ecgStrTmp);
    end;
  end;

  // ѭ�����ecgDataBuf
  packPos := 0;
  // ��С�İ�FMT21Ϊ17Byte
  while ( packPos < ( Length(ecgDataBuf)-17+1 ) ) do
  begin
    // �ж���ͷ�Ƿ���ȷ
    // and������bool���ͣ������߼���
    if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
    begin
      datPackSize:=ecgDataBuf[packPos+2]+ecgDataBuf[packPos+3]*256;
      sysIdRead:=sysIdReadNext;
      sysIdReadNext:=ecgDataBuf[packPos+4];     // ��ȡ���ڸ�����ID
      // ��������
      if ((sysIdReadNext-sysIdRead)<>1)and((sysIdRead-sysIdReadNext)<>255) then
      begin
        Inc(lostIdCnt,1);
        Writeln('packPos='+IntToStr(packPos));
        if (sysIdReadNext-sysIdRead) > 0 then
        begin
          Inc(lostIdNum,sysIdReadNext-sysIdRead);
        end
        else
        begin
          Inc(lostIdNum,sysIdRead-sysIdReadNext);
        end;
      end;

      if ecgDataBuf[packPos+5]=22 then      // �ж�FMT��ʽ    22���ݰ�
      begin
        ecgNumSize:=0;
        for kk := 1 to ecgDataBuf[packPos+7+4] do
        begin
          tmpReadPosition:=  ecgNumSize+packPos+13;
          // ��ֹ����
          if( tmpReadPosition >= Length(ecgDataBuf) ) then
          begin
            Writeln('Data End.');
            Exit;
          end;
          // and�����������ͣ����ǰ�λ��
          if ecgDataBuf[ecgNumSize+packPos+13] and $07 = 0 then
          begin
            Inc(ecgNumSize,101);
          end
          else
          begin
            Inc(ecgNumSize,52);
          end;
        end;

        Inc(ecgNumSize,13);
        if(ecgNumSize<>datPackSize) then
        begin
          Writeln('ecgNumSize=',ecgNumSize);
          Writeln('datPackSize=',datPackSize);
          Writeln('packPos=',packPos);
          Writeln('FMT22 lost.');
          packPosOld:=packPos;
          while ( packPos < Length(ecgDataBuf) ) do
          begin
            Inc(packPos,1);
            if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
            begin
               Break;
            end;
          end;
          
          if (packPos-packPosOld)<datPackSize then
          begin
            Writeln('FMT22 error from lost data.');
          end;

          if(packPos>=(Length(ecgDataBuf)-1)) then
          begin
            Writeln('Data End.');
            Exit;
          end;

        end
        else
        begin
          Inc(packPos,ecgNumSize);          // ָʾ����һ�����ݰ�
          //Writeln(ecgNumSize);
        end;
      end
      else if ecgDataBuf[packPos+5]=20 then   // �ж�FMT��ʽ  20���а�
      begin
        ecgNumSize:=datPackSize;
        if ecgNumSize<>24 then
        begin
          Writeln('FMT20 lost.');
          Break;
        end;
        tmpReadPosition:= packPos+24+2;    // ��Ҫ�жϺ�����ֽ��Ƿ�Ϊ7f 7f���ж������Ƿ�����
        // ��ֹ����
        if( tmpReadPosition >= Length(ecgDataBuf) ) then
        begin
          Writeln('Data End0.');
          Exit;
        end;

        if ( ecgDataBuf[packPos+24] <> $7f )or(ecgDataBuf[packPos+24+1]<> $7f) then
        begin
          Writeln('FMT20 Dat Lost.');
          // ���²��ҿ�ʼ��ͷ��7f 7f
          while ( packPos < ( Length(ecgDataBuf)-1 ) ) do
          begin
            Inc(packPos,1);
            if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
            begin
               Break;
            end;
          end;

          // ������ȫ�����꣬û��ͷ��
           if(packPos>=(Length(ecgDataBuf)-1)) then
          begin
            Writeln('Data End0.');
            Exit;
          end;
        end
        else
        begin
          Inc(packPos,ecgNumSize);
        end;
      end
      else if ecgDataBuf[packPos+5]=21 then   // �ж�FMT��ʽ  21��Ϣ��
      begin
        ecgNumSize:=datPackSize;
        if ecgNumSize<>17 then
        begin
          Writeln('FMT21 lost.');
          Break;
        end;

        tmpReadPosition:= packPos+17+2;    // ��Ҫ�жϺ�����ֽ��Ƿ�Ϊ7f 7f���ж������Ƿ�����
        // ��ֹ����
        if( tmpReadPosition >= Length(ecgDataBuf) ) then
        begin
          Writeln('Data End1.');
          Exit;
        end;

        if ( ecgDataBuf[packPos+17] <> $7f )or(ecgDataBuf[packPos+17+1]<> $7f) then
        begin
          Writeln('FMT21 Dat Lost.');
          // ���²��ҿ�ʼ��ͷ��7f 7f
          while ( packPos < ( Length(ecgDataBuf)-1 ) ) do
          begin
            Inc(packPos,1);
            if ( ecgDataBuf[packPos]= $7f )and(ecgDataBuf[packPos+1]= $7f) then
            begin
               Break;
            end;
          end;

          // ������ȫ�����꣬û��ͷ��
           if(packPos>=(Length(ecgDataBuf)-1)) then
          begin
            Writeln('Data End1.');
            Exit;
          end;
        end
        else
        begin
          Inc(packPos,ecgNumSize);
        end;
      end
      else          // FMT��ʽ����
      begin
        Writeln('FMT error.');
        Break;
      end;

    end
    else          // ��ͷ����
    begin
      Writeln('Head error.');
    end;

  end;
  Writeln('lostIdCnt=',lostIdCnt-1);
  Writeln('lostIdNum=',lostIdNum);
  CloseFile(ecgFile);
  Readln;

end.


