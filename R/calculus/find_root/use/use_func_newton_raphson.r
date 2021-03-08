# Start

# Function
func = function(x)
{
    return (
        (x^6) - x - 1
    );
}

Dfunc = function(x)
{
    return (
        6*(x^5) - 1
    );
}

# Input
ax = 1.5;
err = 0.00001;
Niter = 100;

# Algorithm
cat(sprintf("I\ta\t\tf(a)\t\tDf(a)\t\tc\t\tf(c)\n"));

for (iter in 1:Niter)
{
    af = func(ax);
    aDf = Dfunc(ax);
    NsolF = ax - af/aDf;
    NvalF = func(NsolF);

    cat(sprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",
        iter, ax, af, aDf, NsolF, NvalF));


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