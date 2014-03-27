#!/usr/local/bin/perl

# compound_interest.pl - the miracle of compound interest

# First, we'll set up the variables we want to use.
$nest_egg = 0;   # $nest_egg is our starting amount
$year = 2014;        # This is the starting year for our table.
$duration = 40;      # How many years are we saving up?
$apr = 10;          # This is our annual percentage rate.
$salary = 65000.01;
# Print the headers for our report.
print "Year", "\t\t", "Salary", "\t\t", "15% of Salary", "\t\t","Balance", "\t\t", "Interest", "\t\t", "New balance", "\n";

# Calculate interest for each year.
for $i (1 .. $duration) {
    print $year, "\t\t";
    print $salary, "\t\t";
    $year++;
    $salary*=1.02;
    $salary = int($salary*100)/100;
    print $salary*0.15,"\t\t";
    print $nest_egg, "\t\t";

    # Try using this instead to see why this line looks so complex:
    # $interest = ($apr / 100) * $nest_egg
    $interest = int (($apr / 100) * $nest_egg * 100) / 100;
    print $interest, "\t\t";
    $inv_int = $salary*0.15;
    $nest_egg += $interest+$inv_int;
    $nest_egg = int($nest_egg*100)/100;
    print '$',$nest_egg, "\n";
}
print "\n\n\n";
print $year, "\t", '$',$nest_egg, "\n";
