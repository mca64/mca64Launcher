library BroodWarCapture;

uses
  Windows,
  MMSystem,
  Graphics;
{$R *.res}

function SCBW_BitBlt(const destDC: HDC; const X, Y, width, height: integer; const srcDC: HDC; const xSrc, ySrc: integer; const rop: DWORD)
  : BOOL; stdcall;
var
  bmp: Graphics.TBitmap;
begin
  bmp := Graphics.TBitmap.Create;
  try
    bmp.Monochrome := false;
    bmp.PixelFormat := pf32bit;
    bmp.width := width;
    bmp.height := height;
    BitBlt(bmp.Canvas.Handle, 0, 0, bmp.width, bmp.height, srcDC, 0, 0, SRCCOPY);
    Result := BitBlt(destDC, X, Y, width, height, bmp.Canvas.Handle, xSrc, ySrc, rop);
  finally
    bmp.Free;
  end;
end;

function SCBW_CreateCompatibleDC(const DC: HDC): HDC; stdcall;
var
  bmp: Graphics.TBitmap;
begin
  bmp := Graphics.TBitmap.Create;
  try
    bmp.Monochrome := false;
    bmp.PixelFormat := pf32bit;
    bmp.width := GetDeviceCaps(DC, HORZRES);
    bmp.height := GetDeviceCaps(DC, VERTRES);
    bmp.PixelFormat := pf32bit;
    Result := CreateCompatibleDC(bmp.Canvas.Handle);
  finally
    bmp.Free;
  end;
end;

function SCBW_CreateCompatibleBitmap(const DC: HDC; const width, height: integer): HBITMAP; stdcall;
var
  bmp: Graphics.TBitmap;
begin
  bmp := Graphics.TBitmap.Create;
  try
    bmp.Monochrome := false;
    bmp.PixelFormat := pf32bit;
    bmp.width := width;
    bmp.height := height;
    Result := CreateCompatibleBitmap(bmp.Canvas.Handle, width, height);
  finally
    bmp.Free;
  end;
end;

exports
  SCBW_BitBlt Name 'SCBW_BitBlt',
  SCBW_CreateCompatibleDC Name 'SCBW_CreateCompatibleDC',
  SCBW_CreateCompatibleBitmap Name 'SCBW_CreateCompatibleBitmap';

begin

end.
