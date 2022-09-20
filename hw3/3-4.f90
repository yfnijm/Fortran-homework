REAL*8 function f(x)
real*8 x
f = 3*x+sin(x)-exp(x)
end
program main 
real*8 x1,x2,x3,y1,y2,y3,x,f
integer:: a=0
x1=0.2
x2=0.4
! tolerance value is "0.005"
do while(abs(x1-x2).gt.2*0.005)
x=x1
y1=f(x)
x=x2
y2=f(x)
x3=(x1+x2)/2
x=x3
y3=f(x)

a=a+1
write(*,"(A4,I2,A10)")"第",a,"次數據"
write(*,'(f10.7)',advance='no')x1
write(*,'(f15.8)')y1
write(*,'(f10.7)',advance='no')x2
write(*,'(f15.8)')y2
write(*,'(f10.7)',advance='no')x3
write(*,'(f15.8)')y3
write(*,'(a30)',advance="no")"百分誤差(x3-0.360234436):"
write(*,'(f15.8,a2)')(x3-0.360234436)/0.360234436*100,"%"

if (y1*y3.lt.0) then
x2=x3
else
x1=x3
end if




end do 
end

