function g1(x)
real g1,x
g1 = (-sin(x)+exp(x))/3
end


!function g2(x)
!real*8 g2,x
!g2 = asin(3*x-exp(x))
!end

!function g3(x)
!real*8 g3,x
!g3 = alog(3*x+sin(x))
!end 

!此處採用g1(x)

program main
external g1
real x1(0:20),x2(0:20),x3(0:20),d
integer a
x1(1)=0.2
x2(1)=0.2
x3(1)=0.2
write(*,*)"g(x)={[-sin(x)]+e^x}/3"

do a=1,10

write(*,*)

x=x1(a)
d=g1(x)
x1(a+1)=d
write(*,"(a12,i2,a3)")"反覆法第",a,"次:"
write(*,"(f12.8)")x1(a+1)
write(*,*)"百分誤差(g(x)-0.360234436):"
write(*,"(f12.8,a2)")(g1(x)-0.360234436)/0.360234436*100,"%"



end do 
end



