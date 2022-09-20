program main 
real*8 x,h,s(-1:18),i(-1:18),j(-1:18),k(-1:18),two_fx,three_fx,four_fx
integer a,b,c
i(-1)=0
h=0.1

do a=0,18,1
x=a/10.
s(a)=cos(x)
i(a)=cos(x)+i(a-1)
end do 


do b=1,17,2
j(-1)=0
j(b)=s(b)+j(b-2)
end do 

do c=2,16,2
k(0)=0
k(c)=s(c)+k(c-2)
end do

two_fx=(i(18)*2-cos(0.)-cos(1.8))*(h/2)
three_fx=(i(18)+j(17)*3+k(16))*(h/3)
four_fx=(i(18)*3-s(0)*2-s(3)-s(6)-s(9)-s(12)-s(15)-2*s(18))*(h*3/8)

write(*,*)"理論值:"
write(*,'(f10.7)')sin(1.8)
write(*,*)"*************"
write(*,*)'梯形法則:'
write(*,'(f10.7)')two_fx
write(*,*)"百分誤差:"
write(*,'(f10.7,a2)')(two_fx-sin(1.8))/sin(1.8)
write(*,*)"*************"
write(*,*)"Simpson1/3法則:"
write(*,'(f10.7)')three_fx
write(*,*)"百分誤差:"
write(*,'(f10.7,a2)')(three_fx-sin(1.8))/sin(1.8)*100,"%"
write(*,*)"*************"
write(*,*)"Simpson3/8法則:"
write(*,'(f10.7)')four_fx
write(*,*)"百分誤差:"
write(*,'(f10.7,a2)')(four_fx-sin(1.8))/sin(1.8)*100,"%"


end
