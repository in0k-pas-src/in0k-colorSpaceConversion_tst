unit Test__W3WCAG_contrastRatio;

{$mode objfpc}{$H+}

interface

uses
  Graphics,
  cs_W3_WCAG_contrastRatio,
  Classes, SysUtils, fpcunit, testregistry;

type

  TTest__W3WCAG_contrastRatio=class(TTestCase)
  published
    procedure Test_xx0000;
    procedure Test_00xx00;
    procedure Test_0000xx;
    procedure Test_xxxxxx;
  published
    procedure Test_ratio21_00_FF;
    procedure Test_ratio21_FF_00;
  published
    procedure Test_ratio_xx0000_00;
    procedure Test_ratio_00xx00_00;
    procedure Test_ratio_0000xx_00;
    procedure Test_ratio_xxxxxx_00;
  published
    procedure Test_ratio_xx0000_FF;
    procedure Test_ratio_00xx00_FF;
    procedure Test_ratio_0000xx_FF;
    procedure Test_ratio_xxxxxx_FF;
  end;

implementation

procedure TTest__W3WCAG_contrastRatio.Test_xx0000;
var i:byte;
    c:TColor;
    r:tCS_W3WCAG_contrastRatio;
begin
    for i:=$00 to $FF do begin
        c:=RGBToColor(i,0,0);
        r:=cs_W3WCAG_contrastRatio(C,C);
        AssertEquals('fail',1,r);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_00xx00;
var i:byte;
    c:TColor;
    r:tCS_W3WCAG_contrastRatio;
begin
    for i:=$00 to $FF do begin
        c:=RGBToColor(0,i,0);
        r:=cs_W3WCAG_contrastRatio(C,C);
        AssertEquals('fail',1,r);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_0000xx;
var i:byte;
    c:TColor;
    r:tCS_W3WCAG_contrastRatio;
begin
    for i:=$00 to $FF do begin
        c:=RGBToColor(0,0,i);
        r:=cs_W3WCAG_contrastRatio(C,C);
        AssertEquals('fail',1,r);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_xxxxxx;
var i:byte;
    c:TColor;
    r:tCS_W3WCAG_contrastRatio;
begin
    for i:=$00 to $FF do begin
        c:=RGBToColor(i,i,i);
        r:=cs_W3WCAG_contrastRatio(C,C);
        AssertEquals('fail',1,r);
    end;
end;

//------------------------------------------------------------------------------

procedure TTest__W3WCAG_contrastRatio.Test_ratio21_00_FF;
var C0:TColor;
    CF:TColor;
    r :tCS_W3WCAG_contrastRatio;
begin
    c0:=RGBToColor($00,$00,$00);
    cF:=RGBToColor($FF,$FF,$FF);
    r:=cs_W3WCAG_contrastRatio(C0,CF);
    AssertEquals('fail',21,r);
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio21_FF_00;
var C0:TColor;
    CF:TColor;
    r :tCS_W3WCAG_contrastRatio;
begin
    c0:=RGBToColor($00,$00,$00);
    cF:=RGBToColor($FF,$FF,$FF);
    r:=cs_W3WCAG_contrastRatio(CF,C0);
    AssertEquals('fail',21,r);
end;

//------------------------------------------------------------------------------

procedure TTest__W3WCAG_contrastRatio.Test_ratio_xx0000_00;
var i:byte;
    c :TColor;
    c0:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    c0:=RGBToColor($00,$00,$00);
    for i:=$00 to $FF do begin
        c:=RGBToColor(i,0,0);
        r1:=cs_W3WCAG_contrastRatio(C,c0);
        r2:=cs_W3WCAG_contrastRatio(c0,C);
        AssertEquals('fail',r1,r2);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio_00xx00_00;
var i:byte;
    c :TColor;
    c0:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    c0:=RGBToColor($00,$00,$00);
    for i:=$00 to $FF do begin
        c:=RGBToColor(0,i,0);
        r1:=cs_W3WCAG_contrastRatio(C,c0);
        r2:=cs_W3WCAG_contrastRatio(c0,C);
        AssertEquals('fail',r1,r2);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio_0000xx_00;
var i:byte;
    c :TColor;
    c0:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    c0:=RGBToColor($00,$00,$00);
    for i:=$00 to $FF do begin
        c:=RGBToColor(0,0,i);
        r1:=cs_W3WCAG_contrastRatio(C,c0);
        r2:=cs_W3WCAG_contrastRatio(c0,C);
        AssertEquals('fail',r1,r2);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio_xxxxxx_00;
var i:byte;
    c :TColor;
    c0:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    c0:=RGBToColor($00,$00,$00);
    for i:=$00 to $FF do begin
        c:=RGBToColor(i,i,i);
        r1:=cs_W3WCAG_contrastRatio(C,c0);
        r2:=cs_W3WCAG_contrastRatio(c0,C);
        AssertEquals('fail',r1,r2);
    end;
end;

//------------------------------------------------------------------------------

procedure TTest__W3WCAG_contrastRatio.Test_ratio_xx0000_FF;
var i:byte;
    c :TColor;
    cF:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    cF:=RGBToColor($FF,$FF,$FF);
    for i:=$00 to $FF do begin
        c:=RGBToColor(i,0,0);
        r1:=cs_W3WCAG_contrastRatio(C,cF);
        r2:=cs_W3WCAG_contrastRatio(cF,C);
        AssertEquals('fail',r1,r2);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio_00xx00_FF;
var i:byte;
    c :TColor;
    cF:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    cF:=RGBToColor($FF,$FF,$FF);
    for i:=$00 to $FF do begin
        c:=RGBToColor(0,i,0);
        r1:=cs_W3WCAG_contrastRatio(C,cF);
        r2:=cs_W3WCAG_contrastRatio(cF,C);
        AssertEquals('fail',r1,r2);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio_0000xx_FF;
var i:byte;
    c :TColor;
    cF:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    cF:=RGBToColor($FF,$FF,$FF);
    for i:=$00 to $FF do begin
        c:=RGBToColor(0,0,i);
        r1:=cs_W3WCAG_contrastRatio(C,cF);
        r2:=cs_W3WCAG_contrastRatio(cF,C);
        AssertEquals('fail',r1,r2);
    end;
end;

procedure TTest__W3WCAG_contrastRatio.Test_ratio_xxxxxx_FF;
var i:byte;
    c :TColor;
    cF:TColor;
    r1:tCS_W3WCAG_contrastRatio;
    r2:tCS_W3WCAG_contrastRatio;
begin
    cF:=RGBToColor($FF,$FF,$FF);
    for i:=$00 to $FF do begin
        c:=RGBToColor(i,i,i);
        r1:=cs_W3WCAG_contrastRatio(C,cF);
        r2:=cs_W3WCAG_contrastRatio(cF,C);
        AssertEquals('fail',r1,r2);
    end;
end;

initialization
  RegisterTest(TTest__W3WCAG_contrastRatio);
end.

