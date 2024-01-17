program Project1;

{$APPTYPE CONSOLE}

const
   ixmax = 800;
   iymax = 800;
   cxmin = -2.5;
   cxmax =  1.5;
   cymin = -2.0;
   cymax =  2.0;
   maxcolorcomponentvalue = 255;
   maxiteration = 200;
   escaperadius = 2;
 
type
   colortype = record
      red   : byte;
      green : byte;
      blue  : byte;
   end;
 
var
   ix, iy      : integer;
   cx, cy      : real;
   pixelwidth  : real = (cxmax - cxmin) / ixmax;
   pixelheight : real = (cymax - cymin) / iymax;
   filename    : string = 'new1.ppm';
   comment     : string = '# ';
   outfile     : textfile;
   color       : colortype;
   zx, zy      : real;
   zx2, zy2    : real;
   iteration   : integer;
   er2         : real = (escaperadius * escaperadius);
 
begin
   WriteLn('___  ___  ___   _   _______ _____ _     ____________ _____ _____    _______________  ___    _____  _____ _   _  ___________  ___ _____ ___________ ');
   WriteLn('|  \/  | / _ \ | \ | |  _  \  ___| |    | ___ \ ___ \  _  |_   _|   | ___ \ ___ \  \/  |   |  __ \|  ___| \ | ||  ___| ___ \/ _ \_   _|  _  | ___ \');
   Writeln('| .  . |/ /_\ \|  \| | | | | |__ | |    | |_/ / |_/ / | | | | |     | |_/ / |_/ / .  . |   | |  \/| |__ |  \| || |__ | |_/ / /_\ \| | | | | | |_/ /');
   Writeln('| |\/| ||  _  || . ` | | | |  __|| |    | ___ \    /| | | | | |     |  __/|  __/| |\/| |   | | __ |  __|| . ` ||  __||    /|  _  || | | | | |    / ');
   Writeln('| |  | || | | || |\  | |/ /| |___| |____| |_/ / |\ \\ \_/ / | |     | |   | |   | |  | |   | |_\ \| |___| |\  || |___| |\ \| | | || | \ \_/ / |\ \ ');
   Writeln('\_|  |_/\_| |_/\_| \_/___/ \____/\_____/\____/\_| \_|\___/  \_/     \_|   \_|   \_|  |_/    \____/\____/\_| \_/\____/\_| \_\_| |_/\_/  \___/\_| \_|');
   Writeln('                                                                                                                                                   ');
   Writeln('Mandelbrot PPM Generator by ArcturusPhoenix v0.2 2024');
   Writeln('Press the Enter key to generate and save a PPM image file');
   ReadLn;
   {$I-}
   assign(outfile, filename);
   rewrite(outfile);
   if ioresult <> 0 then
   begin
      {$IFDEF FPC}
         writeln(stderr, 'Unable to open output file: ', filename);
      {$ELSE}
         writeln('ERROR: Unable to open output file: ', filename);
      {$ENDIF}      
      exit;
   end;
 
   writeln(outfile, 'P6');
   writeln(outfile, ' ', comment);
   writeln(outfile, ' ', ixmax);
   writeln(outfile, ' ', iymax);
   writeln(outfile, ' ', maxcolorcomponentvalue);
 
   for iy := 1 to iymax do
   begin
      cy := cymin + (iy - 1)*pixelheight;
      if abs(cy) < pixelheight / 2 then cy := 0.0;
      for ix := 1 to ixmax do
      begin
         cx := cxmin + (ix - 1)*pixelwidth;
         zx := 0.0;
         zy := 0.0;
         zx2 := zx*zx;
         zy2 := zy*zy;
         iteration := 0;
         while (iteration < maxiteration) and (zx2 + zy2 < er2) do
         begin
            zy := 2*zx*zy + cy;
            zx := zx2 - zy2 + cx;
            zx2 := zx*zx;
            zy2 := zy*zy;
            iteration := iteration + 1;
         end;
         if iteration = maxiteration then
         begin
            color.red   := 0;
            color.green := 0;
            color.blue  := 0;
         end
         else
         begin
            color.red   := 255;
            color.green := 255;
            color.blue  := 255;
         end;
         write(outfile, chr(color.red), chr(color.green), chr(color.blue));
      end;
   end;
 
   close(outfile);
   WriteLn('A PPM image file has been created ' + filename + ' You can now exit the program.');
   WriteLn('NOTE: The PPM file created contains the value P6 in the header, some PPM viewers cannot display this value.');
   WriteLn('Check out your image with a PPM viewer (https://jumpshare.com/viewer/ppm)*');
   ReadLn;
end.
