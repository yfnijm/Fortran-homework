program project_4
implicit none
integer::i,j
character*10::filename
real*8::w,b,F0
real*8::t,x
real*8::a,v

!case
!(1) set 𝜔=4 1/s; 𝑏=0 Ns/m; 𝐹_0=0 N 
!(2) set 𝜔=4 1/s; 𝑏=2 Ns/m; 𝐹_0=0 N 
!(3) set 𝜔=4 1/s; 𝑏=2 Ns/m; 𝐹_0=300 N 
!(4) set 𝜔=2 1/s; 𝑏=0 Ns/m; 𝐹_0=300 N 
!(5) set 𝜔=2 1/s; 𝑏=2 Ns/m; 𝐹_0=300 N

do j=1,5,1
!每輪數據重製
	t=0.
	a=0.
	v=0.
	x=10.


	if(j.eq.1)then
		filename="case1"
		w=4.
		b=0.
		F0=0.
		open(unit=11,file=filename,status="replace")
		do i=1,100000,1	
			call loop(w,b,F0,t,x,v,a,i)
			write(11,*)t,x
		end do

	elseif(j.eq.2)then
		filename="case2"
		w=4.
		b=2.
		F0=0.
		open(unit=12,file=filename,status="replace")
		do i=1,100000,1	
			call loop(w,b,F0,t,x,v,a,i)
			write(12,*)t,x
		end do	
	
	elseif(j.eq.3)then
		w=4.
		b=2.
		F0=300.
		filename="case3"
		open(unit=13,file=filename,status="replace")
		do i=1,100000,1	
			call loop(w,b,F0,t,x,v,a,i)
			write(13,*)t,x
		end do	
		
	elseif(j.eq.4)then
		w=2.
		b=0.
		F0=300.
		filename="case4"
		t=0
		open(unit=14,file=filename,status="replace")
		do i=1,100000,1	
			call loop(w,b,F0,t,x,v,a,i)
			write(14,*)t,x
		end do
	
	
	elseif(j.eq.5)then
		w=2.
		b=2.
		F0=300.
		filename="case5"
		open(unit=15,file=filename,status="replace")
		do i=1,100000,1	
			call loop(w,b,F0,t,x,v,a,i)
			write(15,*)t,x
		end do
	endif

end do 
end program

subroutine loop(w,b,F0,t,x,v,a,i)
	real*8::x,v,a,t,dt
	real,parameter::k=20.,m=5.
	integer::i
	real*8::w,b,F0
	
	dt=0.0001	
	t=i*dt
	x=x+v*dt+0.5*a*dt**2
	v=v+0.5*a*dt
	a=(F0*cos(w*t)-k*x-b*v)		

end subroutine


