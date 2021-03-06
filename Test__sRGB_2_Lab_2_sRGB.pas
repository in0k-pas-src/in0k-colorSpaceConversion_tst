unit Test__sRGB_2_Lab_2_sRGB;


{$mode objfpc}{$H+}

interface

uses
  cs_types,
  csc_sRGB_2_Lab,
  csc_Lab_2_sRGB,
  Classes, SysUtils, fpcunit, testregistry;

type

  TTest__sRGB_2_Lab_2_sRGB=class(TTestCase)
  published
    procedure Test_xx;
  published
    procedure Test_xx0000;
    procedure Test_00xx00;
    procedure Test_0000xx;
  published
    //procedure Test_xxxxxx;
  end;

implementation

procedure TTest__sRGB_2_Lab_2_sRGB.Test_xx;
var sR,sG,sB:t_sRGB_colorComp;
var L,a,b:t_Lab_colorComp;
var rR,rG,rB:t_sRGB_colorComp;
begin
        for sB:=0 to $00 do begin
            sR:=sB;
            sG:=sB;
            //
            sRGB_2_Lab(sR,sG,sB, L,a,b);
            Lab_2_sRGB(L,a,b, rR,rG,rB);
            //
            AssertEquals('wrong R:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sR,rR);
            AssertEquals('wrong G:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sG,rG);
            AssertEquals('wrong B:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sB,rB);
        end;
end;

//------------------------------------------------------------------------------

procedure TTest__sRGB_2_Lab_2_sRGB.Test_xx0000;
var sR,sG,sB:t_sRGB_colorComp;
var L,a,b:t_Lab_colorComp;
var rR,rG,rB:t_sRGB_colorComp;
begin
    for sR:=0 to $FF do
      for sG:=0 to $00 do
        for sB:=0 to $00 do begin
            sRGB_2_Lab(sR,sG,sB, L,a,b);
            Lab_2_sRGB(L,a,b, rR,rG,rB);
            //
            AssertEquals('wrong R:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sR,rR);
            AssertEquals('wrong G:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sG,rG);
            AssertEquals('wrong B:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sB,rB);
        end;
end;

procedure TTest__sRGB_2_Lab_2_sRGB.Test_00xx00;
var sR,sG,sB:t_sRGB_colorComp;
var L,a,b:t_Lab_colorComp;
var rR,rG,rB:t_sRGB_colorComp;
begin
    for sR:=0 to $00 do
      for sG:=0 to $FF do
        for sB:=0 to $00 do begin
            sRGB_2_Lab(sR,sG,sB, L,a,b);
            Lab_2_sRGB(L,a,b, rR,rG,rB);
            //
            AssertEquals('wrong R:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sR,rR);
            AssertEquals('wrong G:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sG,rG);
            AssertEquals('wrong B:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sB,rB);
        end;
end;

procedure TTest__sRGB_2_Lab_2_sRGB.Test_0000xx;
var sR,sG,sB:t_sRGB_colorComp;
var L,a,b:t_Lab_colorComp;
var rR,rG,rB:t_sRGB_colorComp;
begin
    for sR:=0 to $00 do
      for sG:=0 to $00 do
        for sB:=0 to $FF do begin
            sRGB_2_Lab(sR,sG,sB, L,a,b);
            Lab_2_sRGB(L,a,b, rR,rG,rB);
            //
            AssertEquals('wrong R:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sR,rR);
            AssertEquals('wrong G:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sG,rG);
            AssertEquals('wrong B:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sB,rB);
        end;
end;

//------------------------------------------------------------------------------

// test passes, but VERY long time
{procedure TTest__sRGB_2_Lab_2_sRGB.Test_xxxxxx;
var sR,sG,sB:t_sRGB_colorComp;
var L,a,b:t_Lab_colorComp;
var rR,rG,rB:t_sRGB_colorComp;
begin
    for sR:=0 to $FF do
      for sG:=0 to $FF do
        for sB:=0 to $FF do begin
            sRGB_2_Lab(sR,sG,sB, L,a,b);
            Lab_2_sRGB(L,a,b, rR,rG,rB);
            //
            AssertEquals('wrong R:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sR,rR);
            AssertEquals('wrong G:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sG,rG);
            AssertEquals('wrong B:'+IntToHex(sR,2)+IntToHex(sG,2)+IntToHex(sB,2),sB,rB);
        end;
end;}

initialization
  RegisterTest(TTest__sRGB_2_Lab_2_sRGB);
end.

