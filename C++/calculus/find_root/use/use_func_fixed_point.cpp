#include <complex>
#include <iomanip>
#include <iostream>
using namespace std;

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

// Start
int main()
{
    int iter, Niter;
    double ax, err, NsolF, NvalF;

    // Input
    ax = 1.5;
    err = 0.00001;
    Niter = 100;

    // Algorithm
    cout << "I\ta\t\tg(a)\t\tf(a)"
        << setprecision(10) << fixed
        << endl;

    for (iter = 0; iter < Niter; ++iter)
    {
        NsolF = Gfunc(ax);
        NvalF = func(NsolF);

        cout << iter+1 << ")\t" << ax << '\t'
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