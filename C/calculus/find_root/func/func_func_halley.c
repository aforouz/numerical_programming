// Start
#include <math.h>

/*
double func(double x)
{
    return (
        cos(2*x) + sin(2*x) + x - 1
    );
}

double Dfunc(double x)
{
    return (
        2*cos(2*x) - 2*sin(2*x) + 1
    );
}

double D2func(double x)
{
    return (
        -4*cos(2*x) - 4*sin(2*x)
    );
}

double ax = 1.5;
double err = 0.00001;
int Niter = 100;
*/

// Function
double func_func_halley(double ax, double err, double(*func)(double), double(*Dfunc)(double), double(*D2func)(double), int Niter = 100)
{
    int iter;
    double af, aDf, aD2f, NsolF, NvalF;

    // Algorithm
    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        aDf = Dfunc(ax);
        aD2f = D2func(ax);
        NsolF = ax - 2*af*aDf/(2*pow(aDf, 2) - af*aD2f);
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