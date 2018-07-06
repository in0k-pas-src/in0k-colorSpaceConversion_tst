unit Test__W3WCAG_relativeLuminance;

{$mode objfpc}{$H+}

interface

uses
  Graphics,
  cs_W3_WCAG_relativeLuminance,
  Classes, SysUtils, fpcunit, testregistry;

type

  TTest__W3WCAG_relativeLuminance=class(TTestCase)
  published
    procedure Test_000000;
    procedure Test_FFFFFF;
  end;

implementation

procedure TTest__W3WCAG_relativeLuminance.Test_000000;
var c:tColor;
    r:tCS_W3WCAG_relativeLuminance;
begin
    c:=$00000000;
    r:=cs_W3WCAG_relativeLuminance(C);
    //
    AssertEquals('fail',0,r);
end;

procedure TTest__W3WCAG_relativeLuminance.Test_FFFFFF;
var c:tColor;
    r:tCS_W3WCAG_relativeLuminance;
begin
    c:=$00FFFFFF;
    r:=cs_W3WCAG_relativeLuminance(C);
    //
    AssertEquals('fail',1,r);
end;

initialization
  RegisterTest(TTest__W3WCAG_relativeLuminance);
end.

