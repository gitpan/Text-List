package Text::List;

use strict;
use vars qw($VERSION $separator $conjunction);

$VERSION = '1.0';

$separator = ",";
$conjunction = "and";

sub sentence
{
    local ($_);
    my $item_count = @_;

    my $result = "";

    my $sep = (($item_count>2)?$separator:"");
    my $conj = (($item_count>1)?" $conjunction ":"");

    foreach (@_)
    {
        unless (!length($result))
        {
            $result .= $sep;
        }
        unless (--$item_count)
        {
            $result .= $conj;
        }
        $result .= ((length($result) and $item_count)?" ":"") . $_;
    }

    return $result;
}

1;
__END__

=head1 NAME

Text::List - Perl extension for converting lists into sentences

=head1 SYNOPSIS

  use Text::List;

  # emits "Jack"
  $name_list = Text::List::sentence('Jack');

  # emits "Jack and Jill"
  $name_list = Text::List::sentence('Jack', 'Jill');
  
  # emits "Jack, Jill, and Spot"
  $name_list = Text::List::sentence('Jack', 'Jill', 'Spot');

=head1 DESCRIPTION

This is a simple routine for converting a list into a properly
punctuated text string.

=head1 AUTHOR

Robert Rothenberg <wlkngowl@unix.asb.com>

=cut
