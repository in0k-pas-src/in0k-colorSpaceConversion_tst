unit Test__sRGB_2_XYZ;

{$mode objfpc}{$H+}

interface

uses
  cs_types,
  csc_sRGB_2_XYZ,
  Classes, SysUtils, fpcunit, testutils, testregistry;

type

  TTest__sRGB_2_XYZ=class(TTestCase)
  published
    procedure Test_000000;
  published
    procedure Test_FF0000;
    procedure Test_00FF00;
    procedure Test_0000FF;
  published
    procedure Test_FFFF00;
    procedure Test_00FFFF;
    procedure Test_FF00FF;
  published
    procedure Test_FFFFFF;
  end;

implementation

const
  cDelta=0.01;

procedure TTest__sRGB_2_XYZ.Test_000000;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$00; sG:=$00; sB:=$00;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X',      0,X,cDelta);
    AssertEquals('wrong Y',      0,Y,cDelta);
    AssertEquals('wrong Z',      0,Z,cDelta);
end;

//------------------------------------------------------------------------------

procedure TTest__sRGB_2_XYZ.Test_FF0000;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$FF; sG:=$00; sB:=$00;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 41.246,X,cDelta);
    AssertEquals('wrong Y', 21.267,Y,cDelta);
    AssertEquals('wrong Z',  1.933,Z,cDelta);
end;

procedure TTest__sRGB_2_XYZ.Test_00FF00;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$00; sG:=$FF; sB:=$00;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 35.758,X,cDelta);
    AssertEquals('wrong Y', 71.515,Y,cDelta);
    AssertEquals('wrong Z', 11.919,Z,cDelta);
end;

procedure TTest__sRGB_2_XYZ.Test_0000FF;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$00; sG:=$00; sB:=$FF;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 18.044,X,cDelta);
    AssertEquals('wrong Y',  7.217,Y,cDelta);
    AssertEquals('wrong Z', 95.030,Z,cDelta);
end;

//------------------------------------------------------------------------------

procedure TTest__sRGB_2_XYZ.Test_FFFF00;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$FF; sG:=$FF; sB:=$00;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 77.003,X,cDelta);
    AssertEquals('wrong Y', 92.783,Y,cDelta);
    AssertEquals('wrong Z', 13.853,Z,cDelta);
end;

procedure TTest__sRGB_2_XYZ.Test_00FFFF;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$00; sG:=$FF; sB:=$FF;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 53.801,X,cDelta);
    AssertEquals('wrong Y', 78.733,Y,cDelta);
    AssertEquals('wrong Z',106.950,Z,cDelta);
end;

procedure TTest__sRGB_2_XYZ.Test_FF00FF;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$FF; sG:=$00; sB:=$FF;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 59.289,X,cDelta);
    AssertEquals('wrong Y', 28.485,Y,cDelta);
    AssertEquals('wrong Z', 96.964,Z,cDelta);
end;

//------------------------------------------------------------------------------

procedure TTest__sRGB_2_XYZ.Test_FFFFFF;
var sR,sG,sB:t_sRGB_colorComp;
var X,Y,Z:t_XYZ_colorComp;
begin
    sR:=$FF; sG:=$FF; sB:=$FF;
    //
    sRGB_2_XYZ(sR,sG,sB, X,Y,Z);
    // test data taken from http://www.easyrgb.com/en/convert.php#inputFORM
    AssertEquals('wrong X', 95.047,X,cDelta);
    AssertEquals('wrong Y',100.000,Y,cDelta);
    AssertEquals('wrong Z',108.883,Z,cDelta);
end;

initialization
  RegisterTest(TTest__sRGB_2_XYZ);
end.

