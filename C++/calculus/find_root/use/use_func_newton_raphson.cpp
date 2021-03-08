// Start
#include <complex>
#include <iomanip>
#include <iostream>
using namespace std;

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
    cout << "I\ta\t\tf(a)"
        << "\t\tDf(a)"
        << "\t\tc\t\tf(c)"
        << setprecision(10) << fixed
        << endl;

    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        aDf = Dfunc(ax);
        NsolF = ax - af/aDf;
        NvalF = func(NsolF);

        cout << iter+1 << ")\t" << ax << '\t'
            <<  af << '\t' << aDf << '\t'
            << NsolF << '\t' << NvalF << endl;

        if (abs(NvalF) < err)
        {
            break;
        }
        ax = NsolF;
    }

    // Output
    cout << endl << "NsolF = " << NsolF << endl;

    // End
    return 0;
}

// **************************************************^**************************************************
// *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
// ******************************# Scientific Computing Specialist 20@21 #******************************
// **************************************************^**************************************************