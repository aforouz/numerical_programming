# Start

# Function
func = function(x)
{
    return (
        cos(2*x) + sin(2*x) + x - 1
    );
}

Dfunc = function(x)
{
    return (
        2*cos(2*x) - 2*sin(2*x) + 1
    );
}

D2func = function(x)
{
    return (
        -4*cos(2*x) - 4*sin(2*x)
    );
}

# Input
ax = 1.5;
err = 0.00001;
Niter = 100;

# Algorithm
cat(sprintf("I\ta\t\tf(a)\t\tDf(a)\t\tD2f(a)\t\tc\t\tf(c)\n"));

for (iter in 1:Niter)
{
    af = func(ax);
    aDf = Dfunc(ax);
    aD2f = D2func(ax);
    NsolF = ax - 2*af*aDf/(2*(aDf^2) - af*aD2f);
    NvalF = func(NsolF);

    cat(sprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",
        iter, ax, af, aDf, aD2f, NsolF, NvalF));

    if (abs(NvalF) < err)
    {
        break;
    }
    ax = NsolF;
}

# Output
cat(sprintf("\nNsolF = %.10f\n", NsolF));

# **************************************************^**************************************************
# *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
# ******************************# Scientific Computing Specialist 20@21 #******************************
# **************************************************^**************************************************