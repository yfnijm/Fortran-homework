program correlation_coefficient
	implicit none 
	real::avgx,avgy,sumx=0,sumy=0,sumxy=0,sumx2=0,sumy2=0
	real::x,y,m,b,r
	character*30::str
	integer::n=0,err1,err2

	write(*,'("input your name of data file")')	
	do while(1==1)
		read(*,*)str
		open(unit=20,file=str,status='OLD',action='READ',iostat=err1)
!防呆裝置
		if (err1.ne.0)then 
			write(*,"(""date can't derive right,please input again"")")
		else 
			exit
		endif

	enddo
	

	do while(1==1)
		read(20,*,iostat=err2)x, y
		if( err2.ne.0)then 			
			exit
		endif
		sumx=sumx+x
		sumy=sumy+y
		sumxy=sumxy+x*y
		sumx2=sumx2+x**2
		sumy2=sumy2+y**2
		n=n+1
	enddo

	close(20)
!防呆裝置
	if(n==1)then
		write(*,"('only one point can''t get correlation coefficient!')")
		stop
	end if
	
	avgx=sumx/n
	avgy=sumy/n
	
	m=(sumxy-sumx*avgy)/(sumx2-sumx*avgx)
	b=avgy-m*avgx
	r=(n*sumxy-sumx*sumy)/(((n*sumx2-sumx**2)*(n*sumy2-sumy**2))**0.5)

	write(*,14)n
14	format("the number of your data is:",i4)
!take + or -
	if(b.ge.0)then
		write(*,15)m,b
15		format("your least-square fit is:","y=",f10.5,"x+"f10.5)
	else if (b.lt.0)then
		write(*,17)m,abs(b)
17 		format("your least-square fit is:","y=",f10.5,"x-"f10.5)
	endif

	write(*,16)r
16	format("and your correlation coefficient is:",f7.5)
	
	if(abs(r).lt.0.3)then
		write(*,18)
18		format("the absoutely value of correlation coefficient is too low(<0.3)!!" & 
		,/,"please cheak again!")
	else if(abs(r).gt.0.98) then
		write(*,'("I guess this data is theoretical value...")')
	endif



end program
