program do_integral

  implicit none

  INTEGER, PARAMETER :: DP = selected_real_kind(14,200)

  real(DP), allocatable :: r(:), wfc1(:), wfc2(:)
  integer :: np, ip, i, nr1, nr2
  real(DP) :: integral

  open(unit = 100, file = '1s-gs.dat', form = 'formatted')
  read(100, *)
  read(100, *) nr1
  allocate( r(nr1 + 1), wfc1(nr1 + 1), wfc2(nr1 + 1) )
  wfc1 = 0.d0
  wfc2 = 0.d0
  do i = 1, nr1
    read(100, *) r(i), wfc1(i)
  enddo
  close(100)

  open(unit = 101, file = 'valence.dat', form = 'formatted')
  read(101, *) np

  do ip = 1, np
    read(101, *) nr2
    do i = 1, nr2
      ! must have the same radial grid !
      read(101, *) r(i), wfc2(i)
    enddo
    integral = 0.d0
    do i = 2, nr1
!      integral = integral + wfc1(i) * r(i) ** 1.0 * wfc2(i) * (r(i) - r(i - 1))
      integral = integral + wfc1(i) ** 2 * (r(i) - r(i - 1))
    enddo
    write(*, *) integral
    read(101, *) nr2
    do i = 1, nr2
      read(101, *)
    enddo
  enddo

  close(101)

end program do_integral

