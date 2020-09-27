program juego;
uses crt;

type
vec=array[1..4] of char;
mat=array[1..30,1..30] of char;

var
i,j,x,y,vh,intentos:integer;
CA,CB,CC,CD,CE,CF,CG,CH,CI,CJ,contz, conta :integer;
bar1, bar2, bar3, bar4, bar5, bar6, bar7, bar8, bar9, bar10:vec;
tec:char;
pos:mat;

procedure matriz;         {limpiar matriz}
begin
for i:= 1 to 30 do
    FOR j := 1 to 30 do
    pos[i,j]:= ' '
end;

procedure dibujar;     {dibuja las posiciones guardadas en la matriz}
var z,w:integer;
begin
z:=10;
w:=5;
for i:= 1 to 10 do
    for j:= 1 to 10 do
    begin
    gotoxy((2+(i-1)*3)+z,(2+(j-1)*3)+w);
    write (pos[2+(i-1)*3,(2+(j-1)*3)]);
    end;
end;

procedure tablero;
Begin
x:=10;
y:=5;
for i:= 1 to 10 do     {fila arriba izquierda}
    for j:=1 to 10 do
     begin
     gotoxy((1+(i-1)*3)+x,(1+(j-1)*3)+y);
     write(chr(218));
     end;
for i:= 2 to 11 do       {fila arriba derecha}
    for j:=1 to 10 do
     begin
     gotoxy(((i-1)*3)+x,(1+(j-1)*3)+y);
     write(chr(191));
     end;
for i:= 1 to 10 do     {fila abajo izquierda}
    for j:= 2 to 11 do
     begin
     gotoxy((1+(i-1)*3)+x,((j-1)*3)+y);
     write(chr(192));
     end;
for i:= 2 to 11 do      {fila abajo derecha}
    for j:= 2 to 11 do
     begin
     gotoxy(((i-1)*3)+x,((j-1)*3)+y);
     write(chr(217));
     end;
End;

procedure carBar (var barco:vec; letra:char; fin:integer);  {Cargar vectores}
Begin

for i:= 1 to fin do
     barco[i]:=letra;
End;

procedure averiado(x1:integer;y1:integer);
begin
     gotoxy(57,20);
     write ('AVERIADO');
     gotoxy(x1,y1);
end;
procedure hundido(x1:integer;y1:integer);
begin
     gotoxy(57,20);
     clreol;
     write ('HUNDIDO');
     gotoxy(x1,y1);
end;

procedure contador (x1:integer;y1:integer);
Begin
 Case pos[x-10,y-5]of
 'A':
  begin
  CA:=CA+1;
  if CA<>4 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'B':
  begin
  CB:=CB+1;
  if CB<>3 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'C':
  begin
  CC:=CC+1;
  if CC<>3 then
     averiado (x1,y1)
  else
      hundido(x1,y1);
  end;
 'D':
  begin
  CD:=CD+1;
  if CD<>2 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'E':
  begin
  CE:=CE+1;
  if CE<>2 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'F':
  begin
  CF:=CF+1;
  if CF<>2 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'G':
  begin
  CG:=CG+1;
  if CG<>1 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'H':
  begin
  CH:=CH+1;
  if CH<>1 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'I':
  begin
  CI:=CI+1;
  if CI<>1 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 'J':
  begin
  CJ:=CJ+1;
  if CJ<>1 then
     averiado (x1,y1)
  else
     hundido(x1,y1);
  end;
 end;
End;

procedure teclado;
var
primCasX, ultCasX, primCasY, ultCasY:integer;

Begin
primCasX:=x+2;
ultCasX:=x+29;
primCasY:=y+2;
ultCasY:=y+29;

gotoxy(primCasX,primCasY); {posicionar en primer casillero}
x:=x+2;
y:=y+2;
repeat
 tec:=ReadKey;
 case tec of
    #75 : {flecha izquierda}
        begin
        if x > primCasX then  {No permitir numeros fuera del tablero}
           begin
           x:= x-3;
           gotoxy(x,y);
           end;
        end;
    #77 : {flecha derecha}
        begin
        if x < ultCasX then
           begin
           x:= x+3;
           gotoxy(x,y);
           end;
        end;
    #80 :  {flecha abajo}
        begin
        if y < ultCasY then
           begin
           y:= y+3;
           gotoxy(x,y);
           end;
        end;
    #72 :   {flecha arriba}
        begin
        if y > primCasY then
           begin
           y:=y-3;
           gotoxy(x,y);
           end;
        end;
    #13 :   {Enter}
        begin
        if (pos[x-10,y-5]<> ' ') and (pos[x-10,y-5]<> 'v') then
           begin
           TextColor(Red);
           write(chr(254));
           TextColor(White);
           gotoxy(x,y);                         {Barco}
           contador (x,y);
           pos[x-10,y-5]:='Z';
           end;
        if pos[x-10,y-5] = ' ' then
           begin
           TextColor(LightBlue);
           write(chr(143));
           TextColor(White);
           gotoxy(57,20);                 {Agua}
           ClrEol;
           write('AGUA');
           gotoxy(x,y);
           end;

        if pos[x-10,y-5] = 'Z' then
           begin
           pos[x-10,y-5] := 'v';      {Contar las posiciones con barcos}
           contz:= contz+1;
           gotoxy(x,y);
           end;
       if pos[x-10,y-5] = ' ' then
          begin
          pos[x-10,y-5] := 'v';      {Contar las posiciones de agua}
          conta:= conta+1;
          gotoxy(x,y);
          end;
       intentos:= conta+contz;
       gotoxy(56,25);
       write('INTENTOS: ',intentos);
       gotoxy(x,y);
       end;
 end;
 until contz = 20;
End;

procedure posicion (barco:vec);
var
flag:integer;

Begin
x:=10;
y:=5;
vh:=0;
for i:= 1 to 4 do
    begin
    gotoxy((2+x)+(i-1)*3,(-1+y));  {dibuja el barco fuera del tablero}
    write (barco[i]);
    end;
flag:=0;

repeat
 tec:= readkey;
 if tec = #32 then
    begin
    case flag of
       0:             {horizontal}
        begin;
        flag:=1;
        vh:=1;
        for i:= 1 to 4 do
           begin
           gotoxy((-1+x),(y+(i-1)*3)+2);
           write (barco[i]);
           end;
        for i:= 1 to 5 do
           begin
           write(' ');
           gotoxy((2+x)+(i-1)*3,(-1+y));
           end;
        end;
      1:            {vertical}
       begin;
       flag:=0;
       vh:=0;
       for i:= 1 to 4 do
          begin
          gotoxy((2+x)+(i-1)*3,(-1+y));
          write (barco[i]);
          end;
       for i:= 1 to 5 do
          begin
          write(' ');
          gotoxy((-1+x),(y+(i-1)*3)+2);
          end;
       end;
     end;
 end;
 until tec = #13;
End;

procedure moverbar (barco:vec; finBarco:integer);

var
primCasX, ultCasXh, primCasY, ultCasYh, ultCasXv, ultCasYv:integer;

Begin
case finbarco of          {Define el ultimo lugar del tablero}
     1:
      begin
      ultCasXh:= x+29;
      ultCasYv:= y+29;
      end;
     2:
      begin
      ultCasXh:= x+26;
      ultCasYv:= y+26;
      end;
     3:
      begin
      ultCasXh:= x+23;
      ultCasYv:= y+23;
      end;
     4:
      begin
      ultCasXh:= x+20;
      ultCasYv:= y+20;
      end;
end;
PrimCasX:=x+4;
primCasY:=y+3;
ultCasXv:=x+29;
ultCasYh:=y+28;
x:=x+2;
y:=y+2;

case vh of
     0:    {horizontal}
      begin
      gotoxy(x,y);      {posiciona el barco en el lugar 1 del tablero horizontal}
      for i:=1 to finBarco do
          begin
          write (barco[i]);
          gotoxy(i*3+x,y);
          end;
      for i:= 1 to finBarco do     {borra el barco que esta fuera del tablero}
          Begin
          gotoxy(x+(i-1)*3,(y-3));
          write (' ');
          gotoxy(x,y);
          end;
      end;

      1:   {vertical}
      Begin
      gotoxy(x,y);      {posiciona el barco en el lugar 1 del tablero vertical}
      for i:=1 to finBarco do
          begin
          write (barco[i]);
          gotoxy(x,y+i*3);
          end;
       for i:= 1 to finBarco do     {borra el barco que esta fuera del tablero}
           Begin
           gotoxy(x-3,y+(i-1)*3);
           write (' ');
           gotoxy(x,y);
           end;
      end;
end;

case vh of
     0:     {movimiento dentro del tablero horizontal}
     begin
     Repeat
       begin
       tec:=ReadKey;
       case tec of
           #77:   {Derecha}
           if x < UltCasXh  then
             begin
             gotoxy(x,y);
             for i:= 1 to finBarco do
                 begin
                 write (' ');
                 gotoxy(i*3+x,y);
                 end;
             dibujar;
             x:= x+3;
             gotoxy (x,y);
             for i:=1 to finBarco do
                 begin
                 write (barco[i]);
                 gotoxy(i*3+x,y);
                 end;
             end;

          #75:   {Izquierda}
          if x >= PrimCasX  then
             begin
             gotoxy(x,y);
             for i:= 1 to finBarco do
                 begin
                 write (' ');
                 gotoxy(i*3+x,y);
                 end;
             dibujar;
             x:= x-3;
             gotoxy (x,y);
             for i:=1 to finBarco do
                 begin
                 write (barco[i]);
                 gotoxy(i*3+x,y);
                 end;
             end;

          #80 :   {Abajo}
          if y <= ultCasYh  then
             begin
             gotoxy(x,y);
             for i:= 1 to finBarco do
                 begin
                 write (' ');
                 gotoxy(i*3+x,y);
                 end;
             dibujar;
             y:=y+3;
             gotoxy (x,y);
             for i:=1 to finBarco do
                 begin
                 write (barco[i]);
                 gotoxy(i*3+x,y);
                 end;
             end;

          #72 :      {arriba}
          if y >= primCasY  then
              begin
              gotoxy(x,y);
              for i:= 1 to finBarco do
                  begin
                  write (' ');
                  gotoxy(i*3+x,y);
                  end;
              dibujar;
              y:=y-3;
              gotoxy (x,y);
              for i:=1 to finBarco do
                  begin
                  write (barco[i]);
                  gotoxy(i*3+x,y);
                  end;
              end;
       end;
     end;
     until tec=#13;
     end;

     1:        {movimiento dentro del tablero vertical}
     Repeat
     begin
     tec:=ReadKey;
     case tec of
           #77 :    {Derecha}
           if x < ultCasXv  then
           begin
           gotoxy(x,y);
           for i:= 1 to finBarco do
               begin
               write (' ');
               gotoxy(x,y+i*3);
               end;
           dibujar;
           x:= x+3;
           gotoxy (x,y);
           for i:=1 to finBarco do
               begin
               write (barco[i]);
               gotoxy(x,y+i*3);
               end;
           end;

           #75:      {Izquierda}
           if x >= PrimCasX  then
           begin
           gotoxy(x,y);
           for i:= 1 to finBarco do
               begin
               write (' ');
               gotoxy(x,y+i*3);
               end;
           dibujar;
           x:= x-3;
           gotoxy (x,y);
           for i:=1 to finBarco do
               begin
               write (barco[i]);
               gotoxy(x,y+i*3);
               end;
           end;

           #80 :   {Abajo}
           if y < ultCasYv  then
           begin
           gotoxy(x,y);
           for i:= 1 to finBarco do
               begin
               write (' ');
               gotoxy(x,y+i*3);
               end;
           dibujar;
           y:=y+3;
           gotoxy (x,y);
           for i:=1 to finBarco do
               begin
               write (barco[i]);
               gotoxy(x,y+i*3);
               end;
           end;

           #72 :      {arriba}
           if y >= primCasY  then
           begin
           gotoxy(x,y);
           for i:= 1 to finBarco do
               begin
               write (' ');
               gotoxy(x,y+i*3);
               end;
           dibujar;
           y:=y-3;
           gotoxy (x,y);
           for i:=1 to finBarco do
               begin
               write (barco[i]);
               gotoxy(x,y+i*3);
               end;
           end;
     end;
     end;
     until tec=#13;
end;
End;

procedure escribir;
Begin
gotoxy(55,20);
write ('Posicion OCUPADA');
gotoxy(50,21);
write ('Ubique el barco nuevamente');
gotoxy(x,y);
End;

procedure ocupado(barco:vec; finbarco:integer);
Begin
dibujar;
posicion(barco);
moverbar(barco, finbarco);
gotoxy(x,y);
End;

procedure limpiar;
Begin
gotoxy(55,20);
write('                   ');
gotoxy(50,21);
write('                          ');
gotoxy(x,y);
End;

procedure guardar (barco:vec; finbarco:integer);
Begin
if vh=0 then    {Horizontal}
begin
  case finbarco of
   1:
    begin
    if pos[x-10,y-5]<>' ' then
       begin
       escribir;
       repeat
        ocupado(barco, finbarco);
        until  pos[x-10,y-5] = ' ';
        limpiar;
       end;
    end;
   2:
    begin
    if (pos[x-10,y-5]<>' ') or (pos[x-7,y-5]<>' ') then
       begin
       escribir;
       repeat
       ocupado(barco, finbarco);
        until  (pos[x-10,y-5]=' ') and (pos[x-7,y-5]=' ');
        limpiar;
        end;
       end;
   3:
    begin
    if (pos[x-10,y-5]<>' ') or (pos[x-7,y-5]<>' ') or (pos[x-4,y-5]<>' ') then
       begin
       escribir;
       repeat
       ocupado(barco, finbarco);
        until(pos[x-10,y-5]=' ') and (pos[x-7,y-5]=' ') and (pos[x-4,y-5]=' ');
        limpiar;
       end ;
    end;
  end;
end

else
   begin
   case finbarco of
   1:
    begin
    if pos[x-10,y-5] <> ' ' then
       begin
       escribir;
       repeat
       ocupado(barco, finbarco);
        until  pos[x-10,y-5] =' ';
        limpiar;
       end;
    end;
  2:
    begin
    if (pos[x-10,y-5]<>' ') or (pos[x-10,y-2]<>' ') then
       begin
       escribir;
       repeat
       ocupado(barco, finbarco);
        until  (pos[x-10,y-5]=' ') and (pos[x-7,y-2]=' ');
        limpiar;
       end;
    end;
  3:
    begin
    if (pos[x-10,y-5]<>' ') or (pos[x-10,y-2]<>' ') or (pos[x-10,y+1]<>' ') then
       begin
       escribir;
       repeat
       ocupado(barco, finbarco);
        until(pos[x-10,y-5]=' ') and (pos[x-10,y-2]=' ') and (pos[x-10,y+1]=' ');
        limpiar;
       end ;
    end;
  end;
end;

case vh of          {guardar posicion en matriz}
     1:      {vertical}
     begin
     for i:= 1 to finBarco do
          begin
          pos[x-10,(y-8)+i*3]:= barco[i];
          end;
     end;

     0:   {horizontal}
     begin
     for i:= 1 to finBarco do
         begin
         pos[(x-13)+i*3,(y-5)]:=  barco[i];
         end;
     end;
end;
End;

Begin
repeat
CA:=0;
CB:=0;
CC:=0;
CD:=0;
CE:=0;
CF:=0;
CG:=0;
CH:=0;
CI:=0;
CJ:=0;

contz:=0;
conta:=0;
tablero;
gotoxy(56,8);
write('Pulsa cualquier tecla');
readkey();
gotoxy(56,8);
ClrEol;
gotoxy(59,8);
write('Jugador 1');
gotoxy(50, 9);
write('Ubicar barcos en el tablero');
gotoxy(42, 13);
writeln('ESPACIO: Girar barco');
gotoxy(42, 15);
writeln('ENTER: Aceptar');
gotoxy(42, 17);
writeln('FLECHAS: Movimiento dentro del tablero');

carBar (bar1,'A',4);
carBar (bar2,'B',3);
carBar (bar3,'C',3);
carBar (bar4,'D',2);
carBar(bar5,'E',2);
carBar(bar6,'F',2);
carBar (bar7,'G',1);
carBar(bar8,'H',1);
carBar (bar9,'I',1);
carBar (bar10,'J',1);
matriz;

posicion(bar1);
cursoroff;
moverbar (bar1,4);
guardar(bar1,4);
dibujar;
posicion(bar2);
moverbar (bar2,3);
guardar(bar2, 3);
dibujar;
posicion(bar3);
moverbar (bar3,3);
guardar(bar3,3);
dibujar;
posicion(bar4);
moverbar (bar4,2);
guardar(bar4,2);
dibujar;
posicion(bar5);
moverbar (bar5,2);
guardar(bar5,2);
dibujar;
posicion(bar6);
moverbar (bar6,2);
guardar(bar6,2);
dibujar;
posicion(bar7);
moverbar (bar7,1);
guardar(bar7,1);
dibujar;
posicion(bar8);
moverbar (bar8,1);
guardar(bar8,1);
dibujar;
posicion(bar9);
moverbar (bar9,1);
guardar(bar9,1);
dibujar;
posicion(bar10);
moverbar (bar10,1);
guardar(bar10,1);
dibujar;

gotoxy(43,25);
write('Pulsa cualquier tecla para continuar');
readkey();
ClrScr;
gotoxy(56,8);
write('Jugador 2');
gotoxy(50, 9);
write('Encontrar los barcos');
gotoxy(42, 13);
writeln('FLECHAS: Movimiento dentro del tablero');
gotoxy(42, 15);
writeln('ENTER: Aceptar');
cursoron;
tablero;
teclado;
ClrScr;
gotoxy(40, 15);
write('JUEGO TERMINADO');
gotoxy(35, 17);
write('Cantidad de intentos: ',intentos);
gotoxy(35, 19);
write('Pulsa ENTER para jugar otra vez');
gotoxy(35, 20);
write('Pulsa ESC para salir');

tec:=ReadKey;
ClrScr;
until tec = #27
END.

