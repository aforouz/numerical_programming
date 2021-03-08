# Start

# Function
func = function(x)
{
    return (
        (x^4)/4 + (x^2)/2 + x - 2
    );
}

# Input
ax = 0;
bx = 2;
err = 0.00001;
Niter = 100;

# Algorithm
cat(sprintf("I\ta\t\tf(a)\t\tb\t\tf(b)\t\tc\t\tf(c)\n"));

for (iter in 1:Niter)
{
    af = func(ax);
    bf = func(bx);
    NsolF = (ax*bf - bx*af)/(bf - af);
    NvalF = func(NsolF);

    cat(sprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",
        iter, ax, af, bx, bf, NsolF, NvalF));

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

# Output
cat(sprintf("\nNsolF = %.10f\n", NsolF));


# **************************************************^**************************************************
# *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
# ******************************# Scientific Computing Specialist 20@21 #******************************
# **************************************************^**************************************************