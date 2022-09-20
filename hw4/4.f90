program funxy
real x,y,ans
write(*,*)'please input your value of "x"'
read(*,*)x
write(*,*)'please input your value of "y"'
read(*,*)y


outer: if (x.ge.0) then 
		inner1: if (y.ge.0) then 
			ans=x+y
			else if (y.lt.0) then 
			ans=x+y**2
			end if inner1
	else if (x.lt.0) then
		inner2: if (y.ge.0) then 
			ans=x**2+y
			else if (y.lt.0) then 
			ans=x**2+y**2
			end if inner2
end if outer

write(*,fmt="(5a,1x)",advance="no")"f(x)="
!低級判斷整數方式
!if (mod(ans,1.).lt.0.0000001) then 
!write(*,"(f10.0)")ans
!else
write(*,"(f15.4)")ans
!end if

end program		
