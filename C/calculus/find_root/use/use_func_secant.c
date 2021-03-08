// Start
#include <math.h>
#include <stdio.h>

// Function
double func(double x)
{
    return (
        pow(x, 4)/4 + pow(x, 2)/2 + x - 2
    );
}

// Main
int main()
{
    int iter, Niter;
    double ax, bx, err, af, bf, NsolF, NvalF;

    // Input
    ax = 0;
    bx = 2;
    err = 0.00001;
    Niter = 100;

    // Algorithm
    printf("I\ta\t\tf(a)\t\tb\t\tf(b)\t\tc\t\tf(c)\n");

    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        bf = func(bx);
        NsolF = (ax*bf - bx*af)/(bf - af);
        NvalF = func(NsolF);

        printf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",
            iter+1, ax, af, bx, bf, NsolF, NvalF);

        if (fabs(NvalF) < err)
        {
            break;
        }
        ax = bx;
        bx = NsolF;
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