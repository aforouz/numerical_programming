// Start
#include <math.h>
#include <stdio.h>

// Function
double func(double x)
{
    return (
        pow(x, 6) - x - 1
    );
}

double Dfunc(double x)
{
    return (
        6*pow(x, 5) - 1
    );
}

// Main
int main()
{
    int iter, Niter;
    double ax, err, af, aDf, NsolF, NvalF;

    // Input
    ax = 1.5;
    err = 0.00001;
    Niter = 100;

    // Algorithm
    printf("I\ta\t\tf(a)\t\tDf(a)\t\tc\t\tf(c)\n");

    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        aDf = Dfunc(ax);
        NsolF = ax - af/aDf;
        NvalF = func(NsolF);

        printf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",
            iter+1, ax, af, aDf, NsolF, NvalF);


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