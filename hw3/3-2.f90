program main 
real x,h,y1,y2,y3,y4
x=0.7
h=0.1

write(*,*)"Lagrange polynomial:"
y3=(cos(x+h)-cos(x))/h
y4=(cos(x+2*h)-2*cos(x+h)+cos(x))/h**2
write(*,*)"一階微分(Lagrange polynomial):",y3
write(*,*)"二階微分(Lagrange polynomial):",y4
write(*,*)"一階微分(=-sin(x))","理論值:",-sin(x)
write(*,*)"二階微分(=-cos(x))","理論值:",-cos(x)
write(*,'(a26)',advance='no')"一階微分百分誤差:"
write(*,'(f13.9,a2)')(y3-(-sin(x)))/(-sin(x))*100,"%"
write(*,'(a26)',advance='no')"二階微分百分誤差:"
write(*,'(f13.9,a2)')(y4-(-cos(x)))/(-cos(x))*100,"%"

write(*,"(/)")

write(*,*)"中央差分法:"
y1=(cos(x+h)-cos(x-h))/(2*h)
y2=(cos(x+h)-2*cos(x)+cos(x-h))/(h**2)
write(*,*)"一階微分(中央差分法):",y1
write(*,*)"二階微分(中央差分法):",y2
write(*,*)"一階微分(=-sin(x))","理論值:",-sin(x)
write(*,*)"二階微分(=-cos(x))","理論值:",-cos(x)
write(*,'(a26)',advance='no')"一階微分百分誤差:"
write(*,'(f13.9,a2)')(y1-(-sin(x)))/(-sin(x))*100,"%"
write(*,'(a26)',advance='no')"二階微分百分誤差:"
write(*,'(f13.9,a2)')(y2-(-cos(x)))/(-cos(x))*100,"%"




stop 
end

