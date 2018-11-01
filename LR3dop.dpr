program LR3dop ;
             {$APPTYPE CONSOLE}

uses
  SysUtils;


function F(x:Real):Real;  //function which calculates the value of function
   begin
     F:=Cos(x)-x*x;
   end;


  var xn,xk,e,a,b,c,md,mh,prev,curr,next :Real;

BEGIN
  xn:=0;
  xk:=1;
  e:=0.0001;
  a:=xn;
  b:=xk;
   repeat   //half-length method
     c:=(a+b)/2;
      if  F(a)*F(c)<=0
      then b:=c
      else a:=c;
   until abs(b-a)<e ;
  md:=(a+b)/2;

  prev:=xn; //initialisation
  curr:=xk;
  next:=prev-F(prev)*(prev-curr)/(F(prev)-F(curr));
   while abs(next-curr)>e do  // chord method
   begin
     prev:=curr;
     curr:=next;
     next:=curr-F(curr)*(prev-curr)/(F(prev)-F(curr));
   end;
  mh:=next;
  Writeln('half-length metod  ',md:2:8);
  Writeln('chord method       ',mh:2:8);

   if (md<mh+e/1000) and (md>mh-e/1000)   //if we get same results
    then Writeln('both methods determinate the root with the same accuraty')

    else
     if Abs(0-F(md))<Abs(0-F(mh))    //if we get different results
     then writeln('the half-length method determinates the root with greater accuracy')
     else Writeln('the chord method determinates the root with greater accuracy');
  Readln;
END.

 