real function f(x)
real x
f=3*x+sin(x)-exp(x)
end
program main
real f,x
real x1,x2,x0,h1,h2,y1,y2,y0,a,b,d,g,root1,root2,xr,yr
!
real d1,d2,d3
integer t
x0=0.3
x2=0.2
x1=0.4
do t=1,10
x=x0
y0=f(x)
x=x1
y1=f(x)
x=x2
y2=f(x)

h1=x1-x0
h2=x0-x2
g=(h2/h1)

!講義尚未說明完全固採用拉格壤日求解
d1=(x0-x1)*(x0-x2)
d2=(x1-x2)*(x1-x0)
d3=(x2-x1)*(x2-x0)
a=(1/d1)*y0 + (1/d2)*y1 +(1/d3)*y2
b=-((x1+x2)/d1)*y0 - ((x0+x2)/d2)*y1 - ((x1+x0)/d3)*y2
d=((x1*x2)/d1)*y0 + ((x2*x0)/d2)*y1 +((x0*x1)/d3)*y2

root1=(-b+SQRT(b**2-4*a*d))/(2*a)
root2=(-b-SQRT(b**2-4*a*d))/(2*a)

write(*,"(a4,i1,a4)")"第",t,"次:"
write(*,*)"x2,x0,x1"
write(*,"(f15.8)")x2,x0,x1
write(*,*)"f(2),f(0),f(1)"
write(*,"(f15.8)")y2,y0,y1

if(b.gt.0) then
xr=root1
else 
xr=root2
end if

x=xr
yr=f(x)

if (abs(yr).lt.0.005) then
write(*,*)"now,xr="
write(*,"(f15.8)")xr
write(*,*)"百分誤差:"
write(*,"(f15.8,a2)")(xr-0.360234436)/0.360234436*100,"%"
goto 10
end if

if (xr.gt.x0) then 
x1=xr
else
x2=xr
end if 

 
end do
 
10 end
