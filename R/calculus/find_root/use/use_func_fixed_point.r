# Start

# Function
func = function(x)
{
    return (
        x - 1 - 0.3*cos(x)
    );
}

Gfunc = function(x)
{
    return (
        1 + 0.3*cos(x)
    );
}

# Input
ax = 1.5;
err = 0.00001;
Niter = 100;

# Algorithm
cat(sprintf("I\ta\t\tg(a)\t\tf(a)\n"));

for (iter in 1:Niter)
{
    NsolF = Gfunc(ax);
    NvalF = func(NsolF);

    cat(sprintf("%d)\t%.10f\t%.10f\t%.10f\n",
        iter, ax, NsolF, NvalF));

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