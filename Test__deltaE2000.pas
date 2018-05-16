unit Test__deltaE2000;

{$mode objfpc}{$H+}

interface

uses
  cs_types,
  cs_deltaE2000,
  Classes, SysUtils, fpcunit, testregistry;

type

TTest__deltaE2000=class(TTestCase)

 protected
   procedure test(const i:integer);
 published
   procedure Test_00;
   procedure Test_01;
   procedure Test_02;
   procedure Test_03;
   procedure Test_04;
   procedure Test_05;
   procedure Test_06;
   procedure Test_07;
   procedure Test_08;
   procedure Test_09;

   procedure Test_10;
   procedure Test_11;
   procedure Test_12;
   procedure Test_13;
   procedure Test_14;
   procedure Test_15;
   procedure Test_16;
   procedure Test_17;
   procedure Test_18;
   procedure Test_19;

   procedure Test_20;
   procedure Test_21;
   procedure Test_22;
   procedure Test_23;
   procedure Test_24;
   procedure Test_25;
   procedure Test_26;
   procedure Test_27;
   procedure Test_28;
   procedure Test_29;

   procedure Test_30;
   procedure Test_31;
   procedure Test_32;
   procedure Test_33;
end;




//------------------------------------------------------------------------------
// Тестовые данные
// http://www2.ece.rochester.edu/~gsharma/ciede2000/dataNprograms/ciede2000testdata.txt

type
  testData=array[0..6] of t_csIntermediateCalculations;

const
  D:array[0..33] of testData=(
  (  50.0000,  2.6772,-79.7751,    50.0000,  0.0000,-82.7485,     2.0425  ), //0
  (  50.0000,  3.1571,-77.2803,    50.0000,  0.0000,-82.7485,     2.8615  ),
  (  50.0000,  2.8361,-74.0200,    50.0000,  0.0000,-82.7485,     3.4412  ),
  (  50.0000, -1.3802,-84.2814,    50.0000,  0.0000,-82.7485,     1.0000  ),
  (  50.0000, -1.1848,-84.8006,    50.0000,  0.0000,-82.7485,     1.0000  ),
  (  50.0000, -0.9009,-85.5211,    50.0000,  0.0000,-82.7485,     1.0000  ),
  (  50.0000,  0.0000,  0.0000,    50.0000, -1.0000,  2.0000,     2.3669  ),
  (  50.0000, -1.0000,  2.0000,    50.0000,  0.0000,  0.0000,     2.3669  ),
  (  50.0000,  2.4900, -0.0010,    50.0000, -2.4900,  0.0009,     7.1792  ),
  (  50.0000,  2.4900, -0.0010,    50.0000, -2.4900,  0.0010,     7.1792  ),
  (  50.0000,  2.4900, -0.0010,    50.0000, -2.4900,  0.0011,     7.2195  ), //10
  (  50.0000,  2.4900, -0.0010,    50.0000, -2.4900,  0.0012,     7.2195  ),
  (  50.0000, -0.0010,  2.4900,    50.0000,  0.0009, -2.4900,     4.8045  ),
  (  50.0000, -0.0010,  2.4900,    50.0000,  0.0010, -2.4900,     4.8045  ),
  (  50.0000, -0.0010,  2.4900,    50.0000,  0.0011, -2.4900,     4.7461  ),
  (  50.0000,  2.5000,  0.0000,    50.0000,  0.0000, -2.5000,     4.3065  ),
  (  50.0000,  2.5000,  0.0000,    73.0000, 25.0000,-18.0000,    27.1492  ),
  (  50.0000,  2.5000,  0.0000,    61.0000, -5.0000, 29.0000,    22.8977  ),
  (  50.0000,  2.5000,  0.0000,    56.0000,-27.0000, -3.0000,    31.9030  ),
  (  50.0000,  2.5000,  0.0000,    58.0000, 24.0000, 15.0000,    19.4535  ),
  (  50.0000,  2.5000,  0.0000,    50.0000,  3.1736,  0.5854,     1.0000  ), //20
  (  50.0000,  2.5000,  0.0000,    50.0000,  3.2972,  0.0000,     1.0000  ),
  (  50.0000,  2.5000,  0.0000,    50.0000,  1.8634,  0.5757,     1.0000  ),
  (  50.0000,  2.5000,  0.0000,    50.0000,  3.2592,  0.3350,     1.0000  ),
  (  60.2574,-34.0099, 36.2677,    60.4626,-34.1751, 39.4387,     1.2644  ),
  (  63.0109,-31.0961, -5.8663,    62.8187,-29.7946, -4.0864,     1.2630  ),
  (  61.2901,  3.7196, -5.3901,    61.4292,  2.2480, -4.9620,     1.8731  ),
  (  35.0831,-44.1164,  3.7933,    35.0232,-40.0716,  1.5901,     1.8645  ),
  (  22.7233, 20.0904,-46.6940,    23.0331, 14.9730,-42.5619,     2.0373  ),
  (  36.4612, 47.8580, 18.3852,    36.2715, 50.5065, 21.2231,     1.4146  ),
  (  90.8027, -2.0831,  1.4410,    91.1528, -1.6435,  0.0447,     1.4441  ), //30
  (  90.9257, -0.5406, -0.9208,    88.6381, -0.8985, -0.7239,     1.5381  ),
  (   6.7747, -0.2908, -2.4247,     5.8714, -0.0985, -2.2286,     0.6377  ),
  (   2.0776,  0.0795, -1.1350,     0.9033, -0.0636, -0.5514,     0.9082  )  );


implementation

procedure TTest__deltaE2000.test(const i:integer);
var r:t_csIntermediateCalculations;
begin
  r:=deltaE2000(d[i,0], d[i,1], d[i,2],  d[i,3],d[i,4],d[i,5] ,1,1,1);
  AssertEquals('fail',d[i,6],r);
end;

//------------------------------------------------------------------------------

procedure TTest__deltaE2000.Test_00; begin test(00); end;
procedure TTest__deltaE2000.Test_01; begin test(01); end;
procedure TTest__deltaE2000.Test_02; begin test(02); end;
procedure TTest__deltaE2000.Test_03; begin test(03); end;
procedure TTest__deltaE2000.Test_04; begin test(04); end;
procedure TTest__deltaE2000.Test_05; begin test(05); end;
procedure TTest__deltaE2000.Test_06; begin test(06); end;
procedure TTest__deltaE2000.Test_07; begin test(07); end;
procedure TTest__deltaE2000.Test_08; begin test(08); end;
procedure TTest__deltaE2000.Test_09; begin test(09); end;

procedure TTest__deltaE2000.Test_10; begin test(10); end;
procedure TTest__deltaE2000.Test_11; begin test(11); end;
procedure TTest__deltaE2000.Test_12; begin test(12); end;
procedure TTest__deltaE2000.Test_13; begin test(13); end;
procedure TTest__deltaE2000.Test_14; begin test(14); end;
procedure TTest__deltaE2000.Test_15; begin test(15); end;
procedure TTest__deltaE2000.Test_16; begin test(16); end;
procedure TTest__deltaE2000.Test_17; begin test(17); end;
procedure TTest__deltaE2000.Test_18; begin test(18); end;
procedure TTest__deltaE2000.Test_19; begin test(19); end;

procedure TTest__deltaE2000.Test_20; begin test(20); end;
procedure TTest__deltaE2000.Test_21; begin test(21); end;
procedure TTest__deltaE2000.Test_22; begin test(22); end;
procedure TTest__deltaE2000.Test_23; begin test(23); end;
procedure TTest__deltaE2000.Test_24; begin test(24); end;
procedure TTest__deltaE2000.Test_25; begin test(25); end;
procedure TTest__deltaE2000.Test_26; begin test(26); end;
procedure TTest__deltaE2000.Test_27; begin test(27); end;
procedure TTest__deltaE2000.Test_28; begin test(28); end;
procedure TTest__deltaE2000.Test_29; begin test(29); end;

procedure TTest__deltaE2000.Test_30; begin test(30); end;
procedure TTest__deltaE2000.Test_31; begin test(31); end;
procedure TTest__deltaE2000.Test_32; begin test(32); end;
procedure TTest__deltaE2000.Test_33; begin test(33); end;

initialization
  RegisterTest(TTest__deltaE2000);

end.

