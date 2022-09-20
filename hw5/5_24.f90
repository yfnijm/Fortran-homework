program total_energy
      implicit none
      real::PE,KE,v,TE
	integer::h,s
      !set the "g",and "m"<-for random value of mass
	!or you can use the fallowing two code
      ! write(*,*) 'input"m"'
       ! read(*,*)m

       real,parameter::m=1.,g=9.80665

      write(*,20) "height","PE(*m)","KE(*m)","total emergy(*m)"
20	format(a5,3x,a8,3x,a8,3x,a16,/)
	do h=100,0,-10
		PE=m*g*h
		s=100-h
                v=(2*g*s)**0.5
		KE=0.5*m*v**2
		TE=PE+KE
		write(*,30)h,PE,KE,TE
30		format(i3,5x,f8.2,3x,f8.2,3x,f8.2)
	end do
end program

