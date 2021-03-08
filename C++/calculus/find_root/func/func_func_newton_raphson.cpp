// Start
#include <complex>
using namespace std;

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

double ax = 1.5;
double err = 0.00001;
int Niter = 100;
*/

// Function
double func_func_newton_raphson(double (*func)(double), double (*Dfunc)(double), double ax, double err = 0.00001, int Niter = 100)
{
    int iter;
    double af, aDf, NsolF, NvalF;

    // Algorithm
    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        aDf = Dfunc(ax);
        NsolF = ax - af/aDf;
        NvalF = func(NsolF);

        if (abs(NvalF) < err)
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