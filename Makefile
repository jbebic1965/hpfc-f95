#Makefile for hpfc calculator

FC = g95
CFLAGS = -Wall
INCLUDES = -I.
#CFLAGS = -fpp -extend_source -g -W0 -Vaxlib -posixlib -vms -i4 -O3 -zero -save -traceback
#INCLUDES = -I. \
#           -I$(HOME)/maps-pro/comall  \
#           -I$(HOME)/maps-pro/comcap5 \
#           -I/afs/ae.ge.com/aerotools_nlr/aero_linux24/esp/include/mod/
#LIBS = -L/afs/ae.ge.com/aerotools_nlr/aero_linux24/esp/lib -lhdf5_fortran

#OUTDIR = $(HOME)/maps-pro/mainmaps/modules/

all: hpfc_calc.o
	$(FC) -g -ohpfc_calc.exe hpfc_calc.o

hpfc_calc.o: hpfc_calc.f95
	$(FC) -g -c -ohpfc_calc.o hpfc_calc.f95 $(CFLAGS) $(INCLUDES)

clean:
	rm -f *.o

realclean:
	rm -f *.a *.mod *.o
