// Start
#include <complex>
#include <iomanip>
#include <iostream>
using namespace std;

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
    cout << "I\ta\t\tf(a)"
        << "\t\tb\t\tf(b)"
        << "\t\tc\t\tf(c)"
        << setprecision(10) << fixed
        << endl;

    for (iter = 0; iter < Niter; ++iter)
    {
        af = func(ax);
        bf = func(bx);
        NsolF = (ax + bx)/2;
        NvalF = func(NsolF);

        cout << iter+1 << ")\t"
            << ax << '\t' << af << '\t'
            << bx << '\t' << bf << '\t'
            << NsolF << '\t' << NvalF << endl;

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

    // Output
    cout << endl << "NsolF = " << NsolF << endl;

    // End
    return 0;
}

// **************************************************^**************************************************
// *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
// ******************************# Scientific Computing Specialist 20@21 #******************************
// **************************************************^**************************************************