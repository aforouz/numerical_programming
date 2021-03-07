#include <complex>
#include <iomanip>
#include <iostream>
using namespace std;

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

// Start
int main()
{
    int iter, Niter;
    double ax, err, af, aDf, aD2f, NsolF, NvalF;

    // Input
    ax = 1.5;
    err = 0.00001;
    Niter = 100;

    // Algorithm
    cout << "I\ta\t\tf(a)"
        << "\t\tDf(a)\t\tD2f(a)"
        << "\t\tc\t\tf(c)"
        << setprecision(10) << fixed
        << endl;

    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        aDf = Dfunc(ax);
        aD2f = D2func(ax);
        NsolF = ax - 2*af*aDf/(2*pow(aDf, 2) - af*aD2f);
        NvalF = func(NsolF);

        cout << iter+1 << ")\t" << ax << '\t'
            <<  af << '\t' << aDf << '\t' << aD2f << '\t'
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