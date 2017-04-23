@ECHO 3rd.bat
@ECHO Converting post script output to PDF file.
SET GSDIR="C:\Program Files\gs\gs8.63"
REM %GSDIR%\bin\gswin32.exe -I%GSDIR%\lib;%GSDIR%\fonts;%GSDIR%\Resource -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -r300 -sOutputFile=%1_%%02d.png %1.ps
%GSDIR%\bin\gswin32c.exe -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=%1.pdf %1.ps
del %1.ps
