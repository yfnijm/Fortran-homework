module pointer_func
	interface
		function getmax(p)
			integer,pointer :: p(:)
			integer,pointer :: getmax
		end function
	end interface
end module pointer_func

program find_max_point_of_odds
	use pointer_func
	implicit none
	integer,target :: a(8)=(/10,15,8,25,9,20,17,19/)
	integer,pointer :: p(:)
	p=>a(1:8:2)

	!只有奇數項
	write(*,*)"a(1:8:2)的最大值=",getmax(p)

	stop
end

function getmax(p)
	implicit none
	integer,pointer :: p(:)
	integer,pointer :: getmax
	integer i,s
	integer max

	s=size(p,1)
	max = 0
	do i=1,s
		if ( max<p(i)) then
			max=p(i)
			getmax=>p(i)
		end if	
	end do 
	return

end function
