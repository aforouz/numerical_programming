// Start
#include <complex>
using namespace std;

/*
double func(double x)
{
    return (
        pow(x, 4)/4 + pow(x, 2)/2 + x - 2
    );
}

double ax = 0;
double bx = 2;
double err = 0.00001;
int Niter = 100;
*/

// Function
double func_func_bisection(double ax, double bx, double err, double(*func)(double), int Niter = 100)
{
    int iter;
    double af, bf, NsolF, NvalF;

    // Algorithm
    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        bf = func(bx);
        NsolF = (ax + bx)/2;
        NvalF = func(NsolF);

        if (abs(NvalF) < err)
        {
            break;
        }
        else if (af*NvalF > 0)
        {
            ax = NsolF;
        }
        else
        {
            bx = NsolF;
        }
    }

    return NsolF;
}

// **************************************************^**************************************************
// *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
// ******************************# Scientific Computing Specialist 20@21 #******************************
// **************************************************^**************************************************