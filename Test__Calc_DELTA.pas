unit Test__Calc_DELTA;

{$mode objfpc}{$H+}

interface

uses
  Graphics,
  csCalc_Delta,
  Classes, SysUtils, fpcunit, testregistry;

type

 TTest__Calc_DELTA=class(TTestCase)
  published
    procedure Equal_F00000;
    procedure Equal_0F0000;
    procedure Equal_00F000;
    procedure Equal_000F00;
    procedure Equal_0000F0;
    procedure Equal_00000F;
  end;


implementation

procedure TTest__Calc_DELTA.Equal_F00000;
var c1,c2:TColor;
    r:Single;
begin
    c1:=RGBToColor($F0,$00,$00);
    c2:=c1;
    r :=delta(c1,c2);
    //--
    AssertEquals('wrong Delta:'+IntToHex(Red(c1),2)+IntToHex(Green(c1),2)+IntToHex(Blue(c1),2),r,0);
end;

procedure TTest__Calc_DELTA.Equal_0F0000;
var c1,c2:TColor;
    r:Single;
begin
    c1:=RGBToColor($0F,$00,$00);
    c2:=c1;
    r :=delta(c1,c2);
    //--
    AssertEquals('wrong Delta:'+IntToHex(Red(c1),2)+IntToHex(Green(c1),2)+IntToHex(Blue(c1),2),r,0);
end;

procedure TTest__Calc_DELTA.Equal_00F000;
var c1,c2:TColor;
    r:Single;
begin
    c1:=RGBToColor($00,$F0,$00);
    c2:=c1;
    r :=delta(c1,c2);
    //--
    AssertEquals('wrong Delta:'+IntToHex(Red(c1),2)+IntToHex(Green(c1),2)+IntToHex(Blue(c1),2),r,0);
end;

procedure TTest__Calc_DELTA.Equal_000F00;
var c1,c2:TColor;
    r:Single;
begin
    c1:=RGBToColor($00,$0F,$00);
    c2:=c1;
    r :=delta(c1,c2);
    //--
    AssertEquals('wrong Delta:'+IntToHex(Red(c1),2)+IntToHex(Green(c1),2)+IntToHex(Blue(c1),2),r,0);
end;

procedure TTest__Calc_DELTA.Equal_0000F0;
var c1,c2:TColor;
    r:Single;
begin
    c1:=RGBToColor($00,$00,$F0);
    c2:=c1;
    r :=delta(c1,c2);
    //--
    AssertEquals('wrong Delta:'+IntToHex(Red(c1),2)+IntToHex(Green(c1),2)+IntToHex(Blue(c1),2),r,0);
end;

procedure TTest__Calc_DELTA.Equal_00000F;
var c1,c2:TColor;
    r:Single;
begin
    c1:=RGBToColor($00,$00,$0F);
    c2:=c1;
    r :=delta(c1,c2);
    //--
    AssertEquals('wrong Delta:'+IntToHex(Red(c1),2)+IntToHex(Green(c1),2)+IntToHex(Blue(c1),2),r,0);
end;

initialization
  RegisterTest(TTest__Calc_DELTA);

end.

