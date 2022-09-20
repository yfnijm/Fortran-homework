function f(x)
real f,x
f = 3*x+sin(x)-exp(x)
end
program main
real*8 x0,x1,x2,y0,y1,y2,xs
! xs為暫存變數
integer t
x0=0.2
x1=0.25
t=0
! tolerance value is "0.005"
do while(abs(y2).gt.0.005)
x=x0
y0=f(x)
x=x1
y1=f(x)
if (ABS(y0).lt.ABS(y1)) then 
xs=x0
x0=x1
x1=xs
end if
x2=x1-y1*(x0-x1)/(y0-y1)
x0=x1
x1=x2
x=x2
y2=f(x)
t=t+1
write(*,"(a5)",advance='no')"第"
write(*,"(i2)",advance='no')t
write(*,"(a15)")"次割線法:"

write(*,"(a30)")"x0          f(x0) "
write(*,"(f15.6)",advance='no')x0
write(*,"(f15.8)")y0 

write(*,"(a30)")"x1          f(x1) "
write(*,"(f15.6)",advance='no')x1
write(*,"(f15.8)")y1

write(*,"(a30)")"x2          f(x2) "
write(*,"(f15.6)",advance='no')x1
write(*,"(f15.8)")y2

write(*,"(a30)")"百分誤差(x2-0.360234436):"
write(*,'(f15.8,a2)')((x2-0.360234436)/0.360234436)*100,"%"

end do 
end



