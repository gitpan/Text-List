# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Text::List;
$loaded = 1;
print "ok 1\n";

sub list
{
    @result = ();
    $count = shift;
    while ($count)
    {
        unshift @result, $count--;
    }
    return @result;
}


if ($loaded)
{
    $i = 0;

    foreach $expected ('', '1', '1 and 2', '1, 2, and 3')
    {
        $result = Text::List::sentence list($i++);

        if ($expected eq $result) {
            print "ok ";
        } else {
            print "failed ";
            exit 1;
        }
        print $i+1, "\n";
    }

    exit 0;
}





