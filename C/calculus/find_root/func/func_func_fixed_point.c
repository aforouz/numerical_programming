// Start
#include <math.h>

/*
double func(double x)
{
    return (
        x - 1 - 0.3*cos(x)
    );
}

double Gfunc(double x)
{
    return (
        1 + 0.3*cos(x)
    );
}

double ax = 1.5;
double err = 0.00001;
int Niter = 100;
*/

// Function
double func_func_fixed_point(double (*func)(double), double (*Gfunc)(double), double ax, double err, int Niter = 100)
{
    int iter;
    double NsolF, NvalF;

    // Algorithm
    for (iter = 0; iter < Niter; ++iter)
    {
        NsolF = Gfunc(ax);
        NvalF = func(NsolF);

        if (fabs(NvalF) < err)
        {
            break;
        }
        ax = NsolF;
    }

    return NsolF;
}

// **************************************************^**************************************************
// *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
// ******************************# Scientific Computing Specialist 20@21 #******************************
// **************************************************^**************************************************