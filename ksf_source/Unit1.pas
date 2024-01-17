unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Menus;

type
  TComplex = record
    Re, Im: Double;
  end;

  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Button2: TButton;
    UpDown1: TUpDown;
    Image1: TImage;
    Image2: TImage;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Label2: TLabel;
    Button4: TButton;
    Button5: TButton;
    PopupMenu1: TPopupMenu;
    Standart1: TMenuItem;
    Hell1: TMenuItem;
    ChromaKey1: TMenuItem;
    ransparent1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ransparent1Click(Sender: TObject);
    procedure ChromaKey1Click(Sender: TObject);
    procedure Hell1Click(Sender: TObject);
    procedure Standart1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    MaxIterations: Integer;
    KochBitmap: TBitmap;
    SaveDialog1: TSaveDialog;
    procedure CalculateKochSnowflake;
    procedure CalculateOuterSnowflake;
    procedure DrawKochSegment(X1, Y1, X2, Y2, Level: Integer);
    procedure DrawOuterSnowflake(X1, Y1, X2, Y2, Level: Integer);
    procedure CountCorners(X1, Y1, X2, Y2, Level: Integer;
      var CornerCount: Integer);
    procedure CallCounted;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  UpDown1.Position := StrToIntDef(Edit1.Text, 0);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  GroupBox1.Visible := not GroupBox1.Visible;
  if GroupBox2.Visible = true then
    GroupBox2.Visible := false;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  GroupBox2.Visible := not GroupBox2.Visible;
  if GroupBox1.Visible = true then
    GroupBox1.Visible := false;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  if Assigned(KochBitmap) then
    PaintBox1.Canvas.Draw(0, 0, KochBitmap);
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
    Edit1.Text := IntToStr(StrToIntDef(Edit1.Text, 0) + 1)
  else if Button = btPrev then
    Edit1.Text := IntToStr(Max(1, StrToIntDef(Edit1.Text, 0) - 1));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MaxIterations := StrToIntDef(Edit1.Text, 2);
  CalculateKochSnowflake;
  PaintBox1.Repaint;
  CallCounted;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MaxIterations := StrToIntDef(Edit1.Text, 4);
  CalculateOuterSnowflake;
  PaintBox1.Repaint;
  CallCounted;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SaveDialog1 = nil then
  begin
    SaveDialog1 := TSaveDialog.Create(Self);
    SaveDialog1.Filter := 'Image files (*.png)|*.png';
    SaveDialog1.DefaultExt := 'png';
  end;
  if SaveDialog1.Execute then
  begin
    KochBitmap.SaveToFile(SaveDialog1.FileName);
    ShowMessage(SaveDialog1.FileName + ' saved.');
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Assigned(KochBitmap) then
    KochBitmap.Free;

  KochBitmap := TBitmap.Create;
  KochBitmap.Width := PaintBox1.Width;
  KochBitmap.Height := PaintBox1.Height;
  PaintBox1.Repaint;
end;

procedure TForm1.CalculateKochSnowflake;
var
  SideLength: Integer;
  X1, Y1, X2, Y2, X3, Y3: Integer;
begin
  KochBitmap.Free;
  KochBitmap := TBitmap.Create;
  KochBitmap.Width := PaintBox1.Width;
  KochBitmap.Height := PaintBox1.Height;
  SideLength := 400;
  X1 := PaintBox1.Width div 2 - SideLength div 2;
  Y1 := Round(PaintBox1.Height / 1.5);
  X2 := X1 + SideLength;
  Y2 := Y1;
  X3 := X1 + SideLength div 2;
  Y3 := Round(Y1 - SideLength * Sqrt(3) / 2);
  if Standart1.Checked = true then
    KochBitmap.Canvas.Brush.Color := $00353535;
  if Hell1.Checked = true then
    KochBitmap.Canvas.Brush.Color := $00E4E4E4;
  if ChromaKey1.Checked = true then
    KochBitmap.Canvas.Brush.Color := clLime;
  if ransparent1.Checked = true then
    KochBitmap.Canvas.Brush.Color := $00000000;
  KochBitmap.Canvas.FillRect(Rect(0, 0, KochBitmap.Width, KochBitmap.Height));
  KochBitmap.Canvas.Pen.Color := clWhite;
  DrawKochSegment(X1, Y1, X2, Y2, MaxIterations);
  DrawKochSegment(X2, Y2, X3, Y3, MaxIterations);
  DrawKochSegment(X3, Y3, X1, Y1, MaxIterations);
  PaintBox1.Canvas.Draw(0, 0, KochBitmap);
end;

procedure TForm1.CalculateOuterSnowflake;
var
  SideLength: Integer;
  X1, Y1, X2, Y2, X3, Y3: Integer;
begin
  KochBitmap.Free;
  KochBitmap := TBitmap.Create;
  KochBitmap.Width := PaintBox1.Width;
  KochBitmap.Height := PaintBox1.Height;
  SideLength := 400;
  X1 := PaintBox1.Width div 2 - SideLength div 2;
  Y1 := Round(PaintBox1.Height / 1.5);
  X2 := X1 + SideLength;
  Y2 := Y1;
  X3 := X1 + SideLength div 2;
  Y3 := Round(Y1 - SideLength * Sqrt(3) / 2);
  if Standart1.Checked = true then
    KochBitmap.Canvas.Brush.Color := $00353535;
  if Hell1.Checked = true then
    KochBitmap.Canvas.Brush.Color := $00E4E4E4;
  if ChromaKey1.Checked = true then
    KochBitmap.Canvas.Brush.Color := clLime;
  if ransparent1.Checked = true then
    KochBitmap.Canvas.Brush.Color := $00000000;
  KochBitmap.Canvas.FillRect(Rect(0, 0, KochBitmap.Width, KochBitmap.Height));
  KochBitmap.Canvas.Pen.Color := clWhite;
  DrawOuterSnowflake(X1, Y1, X2, Y2, MaxIterations);
  DrawOuterSnowflake(X2, Y2, X3, Y3, MaxIterations);
  DrawOuterSnowflake(X3, Y3, X1, Y1, MaxIterations);
  PaintBox1.Canvas.Draw(0, 0, KochBitmap);
end;

procedure TForm1.DrawKochSegment(X1, Y1, X2, Y2, Level: Integer);
var
  Xs, Ys, Xt, Yt, Xu, Yu: Integer;
begin
  if Level = 0 then
  begin
    KochBitmap.Canvas.MoveTo(X1, Y1);
    KochBitmap.Canvas.LineTo(X2, Y2);
  end
  else
  begin
    Xs := X1 + (X2 - X1) div 3;
    Ys := Y1 + (Y2 - Y1) div 3;
    Xt := X1 + 2 * (X2 - X1) div 3;
    Yt := Y1 + 2 * (Y2 - Y1) div 3;
    Xu := Round((Xs + Xt) / 2 + (Yt - Ys) * Sqrt(3) / 2);
    Yu := Round((Ys + Yt) / 2 + (Xs - Xt) * Sqrt(3) / 2);
    DrawKochSegment(X1, Y1, Xs, Ys, Level - 1);
    DrawKochSegment(Xs, Ys, Xu, Yu, Level - 1);
    DrawKochSegment(Xu, Yu, Xt, Yt, Level - 1);
    DrawKochSegment(Xt, Yt, X2, Y2, Level - 1);
  end;
end;

procedure TForm1.DrawOuterSnowflake(X1, Y1, X2, Y2, Level: Integer);
var
  Xs1, Ys1, Xs2, Ys2, Xs3, Ys3: Integer;
begin
  if Level = 0 then
  begin
    KochBitmap.Canvas.MoveTo(X1, Y1);
    KochBitmap.Canvas.LineTo(X2, Y2);
  end
  else
  begin
    Xs1 := X1 + (X2 - X1) div 3;
    Ys1 := Y1 + (Y2 - Y1) div 3;
    Xs2 := X1 + 2 * (X2 - X1) div 3;
    Ys2 := Y1 + 2 * (Y2 - Y1) div 3;
    Xs3 := Round((Xs1 + Xs2) / 2 - (Ys2 - Ys1) * Sqrt(3) / 2);
    Ys3 := Round((Ys1 + Ys2) / 2 - (Xs1 - Xs2) * Sqrt(3) / 2);
    DrawOuterSnowflake(X1, Y1, Xs1, Ys1, Level - 1);
    DrawOuterSnowflake(Xs1, Ys1, Xs3, Ys3, Level - 1);
    DrawOuterSnowflake(Xs3, Ys3, Xs2, Ys2, Level - 1);
    DrawOuterSnowflake(Xs2, Ys2, X2, Y2, Level - 1);
  end;
end;

procedure TForm1.CountCorners(X1, Y1, X2, Y2, Level: Integer;
  var CornerCount: Integer);
var
  Xs1, Ys1, Xs2, Ys2, Xs3, Ys3: Integer;
  Angle: Double;
begin
  if Level = 0 then
  begin
    //
  end
  else
  begin
    Xs1 := X1 + (X2 - X1) div 3;
    Ys1 := Y1 + (Y2 - Y1) div 3;
    Xs2 := X1 + 2 * (X2 - X1) div 3;
    Ys2 := Y1 + 2 * (Y2 - Y1) div 3;
    Xs3 := Round((Xs1 + Xs2) / 2 - (Ys2 - Ys1) * Sqrt(3) / 2);
    Ys3 := Round((Ys1 + Ys2) / 2 - (Xs1 - Xs2) * Sqrt(3) / 2);
    Angle := ArcTan2(Ys3 - Ys1, Xs3 - Xs1) - ArcTan2(Ys2 - Ys1, Xs2 - Xs1);
    while Angle < 0 do
      Angle := Angle + 2 * Pi;
    if Abs(Angle) > Pi / 9 then
      Inc(CornerCount);

    CountCorners(X1, Y1, Xs1, Ys1, Level - 1, CornerCount);
    CountCorners(Xs1, Ys1, Xs3, Ys3, Level - 1, CornerCount);
    CountCorners(Xs3, Ys3, Xs2, Ys2, Level - 1, CornerCount);
    CountCorners(Xs2, Ys2, X2, Y2, Level - 1, CornerCount);
  end;
  Edit3.Text := IntToStr(CornerCount + 3);
  if Level >= 7 then
    Edit3.Text := '';
end;

procedure TForm1.CallCounted;
var
  SideLength, CornerCount: Integer;
  X1, Y1, X2, Y2, X3, Y3: Integer;
begin
  CornerCount := 0;
  SideLength := 400;
  X1 := PaintBox1.Width div 2 - SideLength div 2;
  Y1 := Round(PaintBox1.Height / 1.5);
  X2 := X1 + SideLength;
  Y2 := Y1;
  X3 := X1 + SideLength div 2;
  Y3 := Round(Y1 - SideLength * Sqrt(3) / 2);
  CountCorners(X1, Y1, X2, Y2, MaxIterations, CornerCount);
  CountCorners(X2, Y2, X3, Y3, MaxIterations, CornerCount);
  CountCorners(X3, Y3, X1, Y1, MaxIterations, CornerCount);
end;

procedure TForm1.Standart1Click(Sender: TObject);
begin
  Standart1.Checked := true;
  Hell1.Checked := false;
  ChromaKey1.Checked := false;
  ransparent1.Checked := false;
end;

procedure TForm1.Hell1Click(Sender: TObject);
begin
  Standart1.Checked := false;
  Hell1.Checked := true;
  ChromaKey1.Checked := false;
  ransparent1.Checked := false;
end;

procedure TForm1.ChromaKey1Click(Sender: TObject);
begin
  Standart1.Checked := false;
  Hell1.Checked := false;
  ChromaKey1.Checked := true;
  ransparent1.Checked := false;
end;

procedure TForm1.ransparent1Click(Sender: TObject);
begin
  Standart1.Checked := false;
  Hell1.Checked := false;
  ChromaKey1.Checked := false;
  ransparent1.Checked := true;
end;

end.
