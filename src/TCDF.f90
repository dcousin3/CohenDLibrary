function tcdf( x, p, plim, ier )

!-----------------------------------------------------------------------
!
!     Computes the probability that a random variable distributed
!     according to the Student's t distribution with P degrees of
!     freedom, is less than or equal to X.
!
!     X     - Input . Value of the variable                   - Real
!     P     - Input . Degrees of freedom              (P > 0) - Real
!     PLIM  - Input . Limit for P over which the distribution - Real
!                     is approximated by a normal distr.
!     IER   - Output. Return code :                           - Integer
!                     0 = normal
!                     1 = invalid input argument
!                         (then tcdf = -1.)
!                     2 = maximum number of iterations reached
!                         (then tcdf = value at last iteration,
!                                        or zero)
!                     3 = Beta out of limits
!                         (betacdf < -EPS or betacdf > 1+EPS)
!
!     External functions called:
!       BETACDF  NCDF
!
!     NOTE : the error on tcdf is supposed to be minimal.
!
!-----------------------------------------------------------------------

   implicit none

   !  Function
   !  --------

   real(kind=8) :: tcdf

   !  Arguments
   !  ---------

   real(kind=8), intent(in) :: x, p, plim
   integer, intent(out) :: ier

   !  local declarations
   !  ------------------

   real(kind=8), external :: betacdf, ncdf

   real(kind=8), parameter :: zero=0.0_8, half=0.5_8, one=1.0_8

   real(kind=8) :: t, xx

   !-----------------------------------------------------------------

   !  Test for valid input arguments

   if ( p <= zero ) then
      ier  = 1
      tcdf = -one
      return
   end if

   if ( p <= plim ) then
      xx = x * x
      t  = betacdf( xx/(xx+p), half, p*half, ier )
      if ( x >= zero ) then
         tcdf = half + t*half
      else
         tcdf = half - t*half
      end if
   else
      ier  = 0
      tcdf = ncdf( x )
   end if

end function tcdf
