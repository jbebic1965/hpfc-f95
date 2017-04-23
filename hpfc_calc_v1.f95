module Constants
  real, parameter :: pi=3.141592654
  logical :: debug = .true.
end module Constants

module CircuitParameters
  implicit none
  ! Circuit parameters
  real :: angPb = 90   ! angle at which power flow equals Pb
  real :: kXs =0.6     ! distance from sending end 
  real :: Vxmax = 0.1, Vymax = 0.1 ! Converter voltage ratings
  real :: V1ref = 1., V2ref = 1. ! Target values for |V1| and |V2| 
  real :: angBm = 60   ! Max angle at which Bm still maintains Vm=1
  integer :: posBm = 4
  integer :: negBm =-1
  namelist /circuit/ &
       angPb, kXs, &
       Vxmax, Vymax, &
       V1ref, V2ref, &
       angBm, posBm, negBm

contains
  subroutine ReadCircuitParameters
    open (unit=8, file='data.in') 
    read (unit=8, nml=circuit)
    close(unit=8)
  end subroutine ReadCircuitParameters
end module CircuitParameters

module BaseValues
  use Constants
  use CircuitParameters
  implicit none
  real :: Pb, Xl, Xs, Xr, maxBm 
  complex :: Zs, Zr
  complex :: Vmb

contains
  subroutine CalculateBaseValues
    complex :: Vs0, Vr0, Vm0, Ismb, Imrb, Imb 
    ! Pb flows through uncompensated line when Vs=Vr=1p.u. and 
    ! the angle between them is angPb. So:
    Pb  = cos(angPb/2 * pi/180)
    ! The current at Pb will be 1p.u., so xline is given by
    Xl  = 2*sin(angPb/2 * pi/180)
    Xs  = kXs * Xl
    Xr  = (1-kXs) * Xl
    ! Complex impedances
    Zs  = cmplx(0, Xs)
    Zr  = cmplx(0, Xr)

    ! Figuring out bm based on angBm
    ! Defining voltages vs0 and vr0 before compensation (the split of 
    ! angBm between vs0 and vr0 is arbitrary, assumed 1/2 and 1/2.
    Vs0  = cmplx(cos(angBm/2 * pi/180), sin(angBm/2 * pi/180))
    Vr0  = cmplx(cos(-angBm/2 * pi/180), sin(-angBm/2 * pi/180))
    if(debug) write(*,fmt="(a,2f7.3)")"Vs0=", Vs0
    if(debug) write(*,fmt="(a,2f7.3)")"Vr0=", Vr0
    ! computing original orientation of vm (vm0 to designate that
    ! this is before shunt compensation)
    Vm0  = Vs0 - kXs*(Vs0-Vr0)
    if(debug) write(*,fmt="(a,2f7.3)")"Vm0=", Vm0
    ! the value vm with compensation (vmb) has the same angle as vm0 
    ! but 1p.u. amplitude
    Vmb  = Vm0/abs(Vm0)
    if(debug) write(*,fmt="(a,2f7.3)")"Vmb=", Vmb
    ! Now the currents
    Ismb = (Vs0-Vmb)/Zs
    Imrb = (Vmb-Vr0)/Zr
    Imb  = Ismb - Imrb
    if(debug) write(*,fmt="(a,2f7.3)")"Imb=", Imb
    ! Now Bm
    maxBm = abs(Imb)/abs(Vmb)
    if(debug) write(*,fmt="(a,f7.3)")"maxBm=", maxBm

  end subroutine CalculateBaseValues
end module BaseValues

module Calculations
  use Constants
  use CircuitParameters
  use BaseValues
  implicit none

contains
  subroutine Solve(P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir, Vmcen, Vmrad)
    real, intent(in) :: P
    complex, intent(in) :: Vs, Vr
    integer, intent(out) :: nBm
    complex, intent(out) :: Vm, Vx, Vy, Is, Ir, Vmcen
    real, intent(out) :: Vmrad

    complex :: V1, V2
    real :: ds, dr, Bm
    complex ::  Im, I0
    real :: alpha, ks, kr, Vmp, Vmn, Vmamp, PI0
    real :: a, b, c, d
    real :: ksi, di0s, di0r
    ! Begin by assuming that V1 and V2 are 1p.u. and solve for 
    ! their angles to achieve the specified P transfer
    ds = asin(P*Pb*Xs/(abs(Vs)*V1ref))
    dr = asin(P*Pb*Xr/(V2ref*abs(Vr)))
    V1 = V1ref*Vs/abs(Vs)*exp(cmplx(0,-ds))
    V2 = V2ref*Vr/abs(Vr)*exp(cmplx(0, dr))

    ! Solve Is and Ir based on those V1 and V2
    Is = (Vs - V1)/Zs
    Ir = (V2 - Vr)/Zr

    ! Im is the difference between Is and Ir
    Im = Is - Ir

    ! Solve ideal Vm as a vector average of V1 and V2
    Vm = (V1+V2)/2

    ! Now, determine the ideal Bm (includes the proper sign)
    Bm = abs(Im)/abs(Vm)
    if(debug) write(*,fmt="(a,f7.3)")"Bm=", Bm
    ! Determine number of banks (still includes the sign)
    nBm = nint(Bm/(maxBm/real(posBm))) 
    if(debug) write(*,fmt="(a,i4)")"nBm=", nBm
    ! Process differently based on sign. The strategy is as follows.
    ! 1) determine Vm based on Im and nBm
    ! 2) if it is feasible solve Vm based on Im
    ! 3) If not, solve Im based on Vm
    select case (nBm)
    case(:-1)
       ! inductive operation
       ! limit Bm to its min value
       if (nBm < negBm) nBm = negBm
       ! Calculate Bm 
       Bm = real(nBm) * maxBm / real(posBm)
       ! Calculate the magnitude of Vm
       Vm = Im / cmplx(0,Bm)
    case (0)
       ! no shunt device, Vm remains an average of V1 and V2
       Bm = 0
    case(1:)
       ! capacitive operation
       ! limit Bm to its max value
       if (nBm > posBm) nBm = posBm
       ! Calculate Bm 
       Bm = real(nBm) * maxBm / real(posBm)
       ! Calculate the magnitude of Vm
       Vm = Im / cmplx(0,Bm)
    end select
    if(debug) write(*,fmt="(a,2f7.3)")"Vm=", Vm
    if(debug) write(*,fmt="(a,i4)")"nBm=", nBm
    ! Check if that is feasible (fits into Vm circle)
    ! Determine center and radius of Vm circle
    ks = (1-kXs)/(1-Bm*Xl*kXs*(1-kXs)) ! see notes Aug 13/06 @7:00pm
    kr =    kXs /(1-Bm*Xl*kXs*(1-kXs)) 
    Vmcen = ks*Vs + kr*Vr
    Vmrad = ks*Vxmax + kr*Vymax
    if (abs(Vm-Vmcen) <= Vmrad) then
       ! it fits, Vm stays as is (determined based on Im)
    else
       ! Vm has to be limited, and Im computed based on it
       ! Determine the angle between this Vm and Vmcen
       ! alpha = atan2(aimag(Vm-Vmcen), real(Vm-Vmcen))
       ! alpha = acos((abs(Vm)**2 + abs(Vmcen)**2 - abs(Vm-Vmcen)**2) / &
       !     (2*abs(Vmcen)*abs(Vm)))
       alpha = atan2(aimag(Vm),real(Vm)) - atan2(aimag(Vmcen), real(Vmcen))
       ! So, new Vm is solved from quadratic equation based on the 
       ! law of cosines: 
       ! Vmrad^2 = |Vmcen|^2 + |Vm|^2 - 2*|Vmcen|*|Vm|*cos(alpha)
       ! or what is the same:
       ! |Vm|^2 - 2*|Vmcen|*|Vm|*cos(alpha) + |Vmcen|^2-Vmrad^2 = 0
       ! i.e. ax^2 + bx + c = 0
       a = 1
       b = -2*abs(Vmcen)*cos(alpha)
       c = abs(Vmcen)**2 - Vmrad**2
       ! Check the sign of the discriminant
       d = b**2 - 4*a*c
       if (d < 0) then
          ! Discriminant less than zero, the angle of original Vm 
          ! was messed up, make Vm tangetial to the limit circle
          ! compute the amplitude, i.e. |Vm|
          ! Vmamp = -b/(2*a)
          Vmamp = sqrt(abs(Vmcen)**2 - Vmrad**2)
          ! decide the side of alpha based on the side of original Vm
          if (alpha > 0) then
             Vm = Vmamp*Vmcen/abs(Vmcen)*exp(cmplx(0, acos(Vmamp/abs(Vmcen))))
          else
             Vm = Vmamp*Vmcen/abs(Vmcen)*exp(cmplx(0, -acos(Vmamp/abs(Vmcen))))
          end if
       else
          ! There are two solutions for |Vm|
          Vmp = (-b + sqrt(d))/(2*a)
          Vmn = (-b - sqrt(d))/(2*a)
          ! figure out which one is closer in magnitude to original Vm
          if (abs(abs(Vm)-Vmp) < abs(abs(Vm)-Vmn)) then
             Vmamp = Vmp
          else
             Vmamp = Vmn
          end if
          Vm = Vmamp*Vm/abs(Vm)
       end if
    end if
    if(debug) write(*,fmt="(a,2f7.3)")"Vm=", Vm
    ! Recalculate Im based on just determined Vm
    Im = cmplx(0, Bm) * Vm
    if(debug) write(*,fmt="(a,2f7.3)")"Im=", Im
    ! Calculate Is and Ir based on Im, 
    ! Begin with I0  
    I0 = (Vs - Vr)/(Zs + Zr)
    ! lengthen it to meet the power
    PI0 = real(Vs*conjg(I0))/Pb
    I0 = I0*P/PI0
    ! Correct I0 by parts of Im. Break Im into di0s and di0r
    ! See notes Aug 9/06 @10:55pm
    ksi = abs(Im)/sin(pi - (atan2(aimag(Vs),real(Vs))-atan2(aimag(Vr),real(Vr))))
    di0s = ksi*sin(atan2(aimag(Vm), real(Vm))-atan2(aimag(Vr),real(Vr)))
    di0r = ksi*sin(atan2(aimag(Vs), real(Vs))-atan2(aimag(Vm),real(Vm)))
    Is = I0 + di0s*sign(1.0, Bm)*exp(cmplx(0,atan2(aimag(Vs), real(Vs))+pi/2))
    Ir = I0 - di0r*sign(1.0, Bm)*exp(cmplx(0,atan2(aimag(Vr), real(Vr))+pi/2))
    ! Calculate V1 and V2 based on Is and Ir
    V1 = Vs - Zs*Is
    V2 = Vr + Zr*Ir
    ! and finally Vx and Vy are given as:
    Vx = V1-Vm
    Vy = V2-Vm
!!$    ! Now, they have to be corrected if beyond limits, begun on Nov 10/07
!!$    ! V1max limit in the space of Is
!!$    C1cen = Vs/Zs ! center
!!$    C1rad = V1max/abs(Zs) ! radius
!!$    ! Vxmax limit in the space of Is (at chosen Vm)
!!$    Scen = (Vs-Vm)/Zs 
!!$    Srad = Vxmax/abs(Zs)
!!$    ! V2max limit in the space of Is
!!$    C2cen = Vr/Zr ! center
!!$    C2rad = V2max/abs(Zr) ! radius
!!$    ! Vymax limit in the space of Ir (at chosen Vm)
!!$    Rcen = (Vm-Vr)/Zr 
!!$    Rrad = Vymax/abs(Zr)
!!$    ! Limits applicable to Is:
!!$    ! 1) project C1cen to the line defined by Is (point) and I0 (vector) 
!!$    !    Re[I0*conjg(IsC1-C1)]=0

  end subroutine Solve
end module Calculations

module Plotting
  use Constants
  use CircuitParameters
  use BaseValues
  implicit none
  ! Plotting vars
  character, parameter :: plot_fname*(*) = 'hpfc_gnu.plt'
  real :: xc, yc
  namelist /plot/ xc, yc

contains
  subroutine ReadPlottingParameters
    open (unit=8, file='data.in') 
    read (unit=8, nml=plot)
    close(unit=8)
  end subroutine ReadPlottingParameters

  subroutine PlotOutput(P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir, Vmcen, Vmrad)
    real, intent(in) :: P, Vmrad
    complex, intent(in) :: Vs, Vr, Vm, Vx, Vy, Is, Ir, Vmcen
    integer, intent(in) :: nBm

    complex :: V1, V2, Im
    complex :: Ss, S1, S2, Sr, Sm, Sx, Sy

    write(unit=12, fmt=*) 'set title ''P = ',P,' p.u., nBm = ',nBm,''''

    write(unit=12, fmt=*) 'set label ''Vec'' at graph 1.05, 1.00' ! Col 1
    write(unit=12, fmt=*) 'set label ''Abs'' at graph 1.15, 1.00' ! Col 2
    write(unit=12, fmt=*) 'set label ''Ang'' at graph 1.30, 1.00' ! Col 3

    write(unit=12, fmt=*) 'set label ''Vs''  at graph 1.05, 0.95' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Vs), ''' at graph 1.15, .95' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Vs),real(Vs))*180/pi, ''' at graph 1.30, .95' ! Col 3

    write(unit=12, fmt=*) 'set label ''Vr''  at graph 1.05, 0.90' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Vr), ''' at graph 1.15, .90' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Vr),real(Vr))*180/pi, ''' at graph 1.30, .90' ! Col 3

    write(unit=12, fmt=*) 'set label ''Vm''  at graph 1.05, 0.85' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Vm), ''' at graph 1.15, .85' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Vm),real(Vm))*180/pi, ''' at graph 1.30, .85' ! Col 3

    V1=Vm+Vx
    write(unit=12, fmt=*) 'set label ''V1''  at graph 1.05, 0.80' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(V1), ''' at graph 1.15, .80' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(V1),real(V1))*180/pi, ''' at graph 1.30, .80' ! Col 3

    V2=VM+VY
    write(unit=12, fmt=*) 'set label ''V2''  at graph 1.05, 0.75' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(V2), ''' at graph 1.15, .75' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(V2),real(V2))*180/pi, ''' at graph 1.30, .75' ! Col 3

    write(unit=12, fmt=*) 'set label ''Vx''  at graph 1.05, 0.70' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Vx), ''' at graph 1.15, .70' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Vx),real(Vx))*180/pi, ''' at graph 1.30, .70' ! Col 3

    write(unit=12, fmt=*) 'set label ''Vy''  at graph 1.05, 0.65' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Vy), ''' at graph 1.15, .65' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Vy),real(Vy))*180/pi, ''' at graph 1.30, .65' ! Col 3

    write(unit=12, fmt=*) 'set label ''Is''  at graph 1.05, 0.60' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Is), ''' at graph 1.15, .60' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Is),real(Is))*180/pi, ''' at graph 1.30, .60' ! Col 3

    write(unit=12, fmt=*) 'set label ''Ir''  at graph 1.05, 0.55' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Ir), ''' at graph 1.15, .55' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Ir),real(Ir))*180/pi, ''' at graph 1.30, .55' ! Col 3

    Im = Is - Ir
    write(unit=12, fmt=*) 'set label ''Im''  at graph 1.05, 0.50' ! Col 1
    write(unit=12, fmt='(a,f6.4,a)') 'set label ''', abs(Im), ''' at graph 1.15, .50' ! Col 2
    write(unit=12, fmt='(a,f9.4,a)') 'set label ''', &
         atan2(aimag(Im),real(Im))*180/pi, ''' at graph 1.30, .50' ! Col 3

    write(unit=12, fmt=*) 'set label ''Value'' at graph 1.05, 0.40' ! Col 1
    write(unit=12, fmt=*) 'set label ''Real'' at graph 1.15, 0.40' ! Col 2
    write(unit=12, fmt=*) 'set label ''Imag'' at graph 1.30, 0.40' ! Col 3

    Ss=Vs*conjg(Is)/Pb
    write(unit=12, fmt=*) 'set label ''Ss'' at graph 1.05, 0.35' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(Ss), ''' at graph 1.15, .35' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(Ss), ''' at graph 1.30, .35' ! Col 3

    S1=V1*conjg(Is)/Pb
    write(unit=12, fmt=*) 'set label ''S1'' at graph 1.05, 0.30' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(S1), ''' at graph 1.15, .30' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(S1), ''' at graph 1.30, .30' ! Col 3

    S2=V2*conjg(Ir)/Pb
    write(unit=12, fmt=*) 'set label ''S2'' at graph 1.05, 0.25' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(S2), ''' at graph 1.15, .25' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(S2), ''' at graph 1.30, .25' ! Col 3

    Sr=Vr*conjg(Ir)/Pb
    write(unit=12, fmt=*) 'set label ''Sr'' at graph 1.05, 0.20' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(Sr), ''' at graph 1.15, .20' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(Sr), ''' at graph 1.30, .20' ! Col 3

    Sm=Vm*conjg(Im)/Pb
    write(unit=12, fmt=*) 'set label ''Qm'' at graph 1.05, 0.15' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(Sm), ''' at graph 1.15, .15' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(Sm), ''' at graph 1.30, .15' ! Col 3

    Sx=Vx*conjg(-Is)/Pb
    write(unit=12, fmt=*) 'set label ''Sx'' at graph 1.05, 0.10' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(Sx), ''' at graph 1.15, .10' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(Sx), ''' at graph 1.30, .10' ! Col 3

    Sy=Vy*conjg(Ir)/Pb
    write(unit=12, fmt=*) 'set label ''Sy'' at graph 1.05, 0.05' ! Col 1
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', real(Sy), ''' at graph 1.15, .05' ! Col 2
    write(unit=12, fmt='(a,f7.4,a)') 'set label ''', aimag(Sy), ''' at graph 1.30, .05' ! Col 3

    write(unit=12, fmt=*) 'plot [t=-pi:pi] xc=', real(Vmcen), ', yc=', aimag(Vmcen), & 
         ', r=', Vmrad, ', xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \\'
    write(unit=12, fmt=*)'     ''-'' using 1:2:3:4 with vectors head filled lt 1 title ''Vs, Vx'', \\'
    write(unit=12, fmt=*)'     ''-'' using 1:2:3:4 with vectors head empty  lt 1 title ''Is'', \\'
    write(unit=12, fmt=*)'     ''-'' using 1:2:3:4 with vectors head filled lt 3 title ''Vr,Vy'', \\'
    write(unit=12, fmt=*)'     ''-'' using 1:2:3:4 with vectors head empty  lt 3 title ''Ir'', \\'
    write(unit=12, fmt=*)'     ''-'' using 1:2:3:4 with vectors head filled lt 2 title ''Vm'''

!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') 0.0, 0.0, real(Vs), aimag(Vs)
!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') real(Vm), aimag(Vm), real(Vx), aimag(Vx)
!!$    write(unit=12, fmt='(a)') 'e'
!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') 0.0, 0.0, real(Is), aimag(Is)
!!$    write(unit=12, fmt='(a)') 'e'
!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') 0.0, 0.0, real(Vr), aimag(Vr)
!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') real(Vm), aimag(Vm), real(Vy), aimag(Vy)
!!$    write(unit=12, fmt='(a)') 'e'
!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') 0.0, 0.0, real(Ir), aimag(Ir)
!!$    write(unit=12, fmt='(a)') 'e'
!!$    write(unit=12, fmt='(f7.4,3X,f7.4,3X,f7.4,3X,f7.4)') 0.0, 0.0, real(Vm), aimag(Vm)
!!$    write(unit=12, fmt='(a)') 'e'
    write(unit=12, fmt=*) 0.0, 0.0, real(Vs), aimag(Vs)
    write(unit=12, fmt=*) real(Vm), aimag(Vm), real(Vx), aimag(Vx)
    write(unit=12, fmt=*) 'e'
    write(unit=12, fmt=*) 0.0, 0.0, real(Is), aimag(Is)
    write(unit=12, fmt=*) 'e'
    write(unit=12, fmt=*) 0.0, 0.0, real(Vr), aimag(Vr)
    write(unit=12, fmt=*) real(Vm), aimag(Vm), real(Vy), aimag(Vy)
    write(unit=12, fmt=*) 'e'
    write(unit=12, fmt=*) 0.0, 0.0, real(Ir), aimag(Ir)
    write(unit=12, fmt=*) 'e'
    write(unit=12, fmt=*) 0.0, 0.0, real(Vm), aimag(Vm)
    write(unit=12, fmt=*) 'e'
    write(unit=12, fmt=*) 'unset label '
  end subroutine PlotOutput

  subroutine OpenPlottingInterface
    open(unit=12, file=plot_fname)
    write(unit=12, fmt='(a)') 'set terminal postscript landscape enhanced color solid'
    write(unit=12, fmt='(a)') 'set output ''hpfc_calc.ps'''
    write(unit=12, fmt='(a)') 'set xrange[-0.5:1.5]'
    write(unit=12, fmt='(a)') 'set yrange[-1:1]'
    write(unit=12, fmt='(a)') 'set size square'
    write(unit=12, fmt='(a)') 'set parametric'

  end subroutine OpenPlottingInterface

  subroutine ClosePlottingInterface
    integer :: status
    close(unit=12)
    ! Generate post script file using GNU plot
    call system('C:\\Jovan\\gnuplot\\bin\\wgnuplot.exe hpfc_gnu.plt', status)
    if (status /= 0) write(*,*) 'Error: Gnu plot failed'
  end subroutine ClosePlottingInterface
end module Plotting

module Output
  use Constants
  implicit none
contains
  subroutine OpenOutputInterface
    ! P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir
    character, parameter :: Ttlformat*(*) = &
         "(3X,a7," // &
         " 3X,a7,2X,a8," // &
         " 3X,a7,2X,a8," // &
         " 3X,a7," // &
         " 3X,a7,2X,a8," // &
         " 3X,a7,2X,a8," // &
         " 3X,a7,2X,a8," // &
         " 3X,a7,2X,a8," // &
         " 3X,a7,2X,a8)" 

    open(unit=11, file='data.out')
    write(unit=11, fmt=Ttlformat) & 
         "Power", &
         "|Vs|", "ang(Vs)", &
         "|Vr|", "ang(Vr)", &
         "nBm", &
         "|Vm|", "ang(Vm)", &
         "|Vx|", "ang(Vx)", &
         "|Vy|", "ang(Vy)", &
         "|Is|", "ang(Is)", &
         "|Ir|", "ang(Ir)"

  end subroutine OpenOutputInterface

  subroutine CloseOutputInterface
    close(unit=11)
  end subroutine CloseOutputInterface

  subroutine WriteOutput(P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir)
    real, intent(in) :: P
    complex, intent(in) :: Vs, Vr
    integer, intent(in) :: nBm
    complex, intent(in) :: Vm, Vx, Vy, Is, Ir

    character, parameter :: Numformat*(*) = &
         "(3X,f7.4," // &
         " 3X,f7.4,2X,f8.3," // &
         " 3X,f7.4,2X,f8.3," // &
         " 3X,i7," // &
         " 3X,f7.4,2X,f8.3," // &
         " 3X,f7.4,2X,f8.3," // &
         " 3X,f7.4,2X,f8.3," // &
         " 3X,f7.4,2X,f8.3," // &
         " 3X,f7.4,2X,f8.3)"

    write(unit=11, fmt=Numformat) & 
         P, &
         abs(Vs), atan2(aimag(Vs), real(Vs))*180/pi, &
         abs(Vr), atan2(aimag(Vr), real(Vr))*180/pi, &
         abs(nBm), &
         abs(Vm), atan2(aimag(Vm), real(Vm))*180/pi, &
         abs(Vx), atan2(aimag(Vx), real(Vx))*180/pi, &
         abs(Vy), atan2(aimag(Vy), real(Vy))*180/pi, &
         abs(Is), atan2(aimag(Is), real(Is))*180/pi, &
         abs(Ir), atan2(aimag(Ir), real(Ir))*180/pi

  end subroutine WriteOutput

end module Output

module UserInterface
  use Constants
  implicit none

contains
  subroutine ReadUserInput(P, Vs, Vr)
    real, intent(inout) :: P
    complex, intent(inout) :: Vs, Vr

    real :: Vsamp, Vsang
    real :: Vramp, Vrang
    ! Reading formated user input
    write(*, fmt="(a,f7.4,a)", advance="no") &
         "Enter P [p.u.] or / to keep: ", & 
         P, ": "
    read(*,*) P

    ! Voltages are kept internally as complex numbers, 
    ! but they are input as magnitude, angle
    Vsamp = abs(Vs) 
    Vsang = atan2(aimag(Vs), real(Vs))*180/pi
    write(*, fmt="(a,f7.4,a,f8.3,a)", advance="no") &
         "Enter Vs amp,ang [p.u.,deg] or / to keep: ", &
         Vsamp, ",", Vsang, ": "
    read(*,*) Vsamp, Vsang
    Vs    = cmplx(Vsamp*cos(Vsang/180.*pi), Vsamp*sin(Vsang/180*pi))

    Vramp = abs(Vr) 
    Vrang = atan2(aimag(Vr), real(Vr))*180/pi
    write(*, fmt="(a,f7.4,a,f8.3,a)",advance="no") &
         "Enter Vr amp,ang [p.u.,deg] or / to keep: ", &
         Vramp, ",", Vrang, ": "
    read(*,*) Vramp, Vrang
    Vr    = cmplx(Vramp*cos(Vrang/180.*pi), Vramp*sin(Vrang/180*pi))
  end subroutine ReadUserInput

  function OnceAgain()
    logical OnceAgain
    character :: yn*1
    write(*,*) ! blank line
    write(*, fmt="(a)", advance="no") "Once again? [y/n]: "
    do
       read(*,*) yn
       if (yn == 'y' .OR. yn == 'Y') then
          OnceAgain = .true.
          return
       else if (yn == 'n' .OR. yn == 'N') then
          OnceAgain = .false.
          return
       else 
          write(*, fmt="(a)", advance="no") "Valid choices are y or n: "
          cycle
       end if
    end do
  end function OnceAgain

end module UserInterface

program hpfc_calc

  use Constants
  use CircuitParameters
  use BaseValues
  use Calculations
  use Output
  use Plotting
  use UserInterface

  implicit none

  ! Utility vars
  integer :: nBm
  real :: P, Vmrad
  complex :: Vs, Vr, Vm, Vx, Vy, Is, Ir, Vmcen

  ! Circuit Parameters retrived from a file
  call ReadCircuitParameters
  call CalculateBaseValues

  ! Defining default values
  P = 0.4
  Vs = cmplx(cos( 25.*pi/180),sin( 25.*pi/180))
  Vr = cmplx(cos(-25.*pi/180),sin(-25.*pi/180))

  ! Prepare for output
  call OpenOutputInterface
  call OpenPlottingInterface

  ! Main execution loop
  do 
     call ReadUserInput(P, Vs, Vr)
     ! write(*,*) P, Vs, Vr
     call Solve(P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir, Vmcen, Vmrad)
     ! write(*,*) nBm, Vm, Is, Ir
     call WriteOutput(P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir)
     call PlotOutput(P, Vs, Vr, nBm, Vm, Vx, Vy, Is, Ir, Vmcen, Vmrad)

     ! Handling termination based on the user input
     if(OnceAgain()) then
        cycle
     else
        exit
     end if
  end do

  ! Finish up with output
  call CloseOutputInterface
  call ClosePlottingInterface

end program hpfc_calc
