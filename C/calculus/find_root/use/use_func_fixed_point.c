// Start
#include <math.h>
#include <stdio.h>

// Function
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

// Main
int main()
{
    int iter, Niter;
    double ax, err, NsolF, NvalF;

    // Input
    ax = 1.5;
    err = 0.00001;
    Niter = 100;

    // Algorithm
    printf("I\ta\t\tg(a)\t\tf(a)\n");

    for (iter = 0; iter < Niter; ++iter)
    {
        NsolF = Gfunc(ax);
        NvalF = func(NsolF);

        printf("%d)\t%.10f\t%.10f\t%.10f\n",
            iter+1, ax, NsolF, NvalF);

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