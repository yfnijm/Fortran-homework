function f(x)
real f,x
f=3*x+sin(x)-exp(x)
end
function g(x)
real g,x
g=3+cos(x)-exp(x)
end


program main
external f,g
real n(0:25)
integer a
n(0)=0.2
do a=1,40,1
x=n(a-1)
n(a)=x-(f(x)/g(x))
write(*,"(a25,i2)")"牛頓法(x,f(x))  x=",a
write(*,"(f15.8)") x,n(a)
write(*,*)"百分誤差(f(x)-0.360234436):"
write(*,"(f15.8,a2)")(n(a)-0.360234436)/0.360234436*100,"%"
write(*,*)
! tolerance value is "0.005"
if (abs(x-n(a)).lt.0.005) then
goto 10
end if

end do 
10 end
