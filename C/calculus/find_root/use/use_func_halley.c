// Start
#include <math.h>
#include <stdio.h>

// Function
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

// Main
int main()
{
    int iter, Niter;
    double ax, err, af, aDf, aD2f, NsolF, NvalF;

    // Input
    ax = 1.5;
    err = 0.00001;
    Niter = 100;

    // Algorithm
    printf("I\ta\t\tf(a)\t\tDf(a)\t\tD2f(a)\t\tc\t\tf(c)\n");

    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        aDf = Dfunc(ax);
        aD2f = D2func(ax);
        NsolF = ax - 2*af*aDf/(2*pow(aDf, 2) - af*aD2f);
        NvalF = func(NsolF);

        printf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",
            iter+1, ax, af, aDf, aD2f, NsolF, NvalF);

        if (fabs(NvalF) < err)
        {
            break;
        }
        ax = NsolF;
    }

    // Output
    printf("\nNsolF = %.10f\n", NsolF);

    // End
    return 0;
}

// **************************************************^**************************************************
// *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
// ******************************# Scientific Computing Specialist 20@21 #******************************
// **************************************************^**************************************************