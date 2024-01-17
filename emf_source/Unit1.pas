unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Math;

type
  TComplex = record
    Re, Im: Double;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    PaintBox1: TPaintBox;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private
    MaxIterations: Integer;
    Scale: Double;
    MandelbrotBitmap: TBitmap;
    procedure CalculateMandelbrot;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Panel1.Color := clRed;
  Panel1.Caption := 'Processing...';

  PaintBox1.Repaint;
  CalculateMandelbrot;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  if Assigned(MandelbrotBitmap) then
    PaintBox1.Canvas.StretchDraw(PaintBox1.ClientRect, MandelbrotBitmap);
end;

procedure TForm1.CalculateMandelbrot;
var
  X, Y: Integer;
  C, Z, ZTemp: TComplex;
  Iterations: Integer;
  ScaleValue: Double;
  MaxCount: Integer;
  IterationCount: array of array of Integer;
  ColorValue, ColorDistance: Integer;
  R, G, B: Byte;
begin
  MandelbrotBitmap := TBitmap.Create;
  MandelbrotBitmap.Canvas.Brush.Color := clBlack;
  MandelbrotBitmap.Width := PaintBox1.Width;
  MandelbrotBitmap.Height := PaintBox1.Height;

  ScaleValue := 0.002;
  MaxCount := StrToIntDef(Edit1.Text, 128);
  //MaxCount := 128;

  SetLength(IterationCount, MandelbrotBitmap.Width, MandelbrotBitmap.Height);

  for Y := 0 to MandelbrotBitmap.Height - 1 do
  begin
    for X := 0 to MandelbrotBitmap.Width - 1 do
    begin
      C.Re := (X - PaintBox1.Width / 2) * ScaleValue;
      C.Im := (Y - PaintBox1.Height / 2) * ScaleValue;

      Z.Re := 0;
      Z.Im := 0;

      Iterations := MaxCount;

      repeat
        ZTemp.Re := Z.Re * Z.Re - Z.Im * Z.Im + C.Re;
        ZTemp.Im := 2 * Z.Re * Z.Im + C.Im;

        Z := ZTemp;
        Dec(Iterations);
      until (Sqr(Z.Re) + Sqr(Z.Im) > 4) or (Iterations = 0);

      IterationCount[X, Y] := Iterations;
    end;
  end;

  for Y := 0 to MandelbrotBitmap.Height - 1 do
  begin
    for X := 0 to MandelbrotBitmap.Width - 1 do
    begin
      if IterationCount[X, Y] = MaxCount then
      begin
        R := 0;
        G := 0;
        B := 0;
      end
      else
      begin
        ColorValue := Trunc((IterationCount[X, Y] / MaxCount) * 255);

        if IterationCount[X, Y] > MaxCount div 2 then
        begin
          ColorDistance := MaxCount - IterationCount[X, Y];
          B := 0;
          G := ColorDistance * 255 div (MaxCount div 2);
          R := G;
        end
        else
        begin
          ColorDistance := MaxCount div 2 - IterationCount[X, Y];
          B := ColorDistance * 255 div (MaxCount div 2);
          G := B;
          R := 255;
        end;
      end;

      MandelbrotBitmap.Canvas.Pixels[X, Y] := RGB(R, G, B);
    end;

    if Y mod 32 = 0 then
    begin
      PaintBox1.Canvas.StretchDraw(PaintBox1.ClientRect, MandelbrotBitmap);
      Application.ProcessMessages;
    end;
  end;

  PaintBox1.Canvas.StretchDraw(PaintBox1.ClientRect, MandelbrotBitmap);
  Edit3.Text := IntToStr(MaxIterations);
  Panel1.Color := clGreen;
  Panel1.Caption := 'Finished';
end;

end.

