module time_util
	implicit none
	type :: time
		integer :: hour,minute,sec
	end type
	interface operator(+)
		module procedure add
	end interface

contains
	function add( a, b )
		implicit none
		type(time),intent(in) ::a,b
		type(time) ::add
		integer :: minutes,carry,secs,carry0 !carry暫存分 carry0暫存秒

		secs=a%sec+b%sec
		carry0=secs/60
		add%sec=mod(secs,60)

		minutes=a%minute+b%minute
		carry=minutes/60
		add%minute=mod(minutes+carry0,60)
		add%hour=a%hour+b%hour+carry
		return
	end function add

	subroutine output(t)
		type(time),intent(in) ::t
		write(*,"(I2,':',I2.2,':',I2.2)") t%hour,t%minute,t%sec
		return
	end subroutine

end module

program timeadd
	use time_util
	implicit none
	type(time) :: a,b,c
	
	a=time(1,45,38)
	b=time(2,18,54)
	c=a+b
	call output(c)

	stop
end program
