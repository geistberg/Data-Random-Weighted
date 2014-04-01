package Data::Random::Weighted;

=head1 Data::Random::Weighted

Used to return random results from a weighted set.

=cut

=head1 Usage

my $rand = randomize({
    5 => 'Result',
    1 => 42,
});

print &$rand;

=cut

use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw( randomizer );

sub randomizer {
    my $args = shift;
    my $total;
    $total += $_ for keys %$args;
    my $weight;
    my $count = 0;
    for my $set( keys %$args ) {
        my $result = $args->{$set};
        for ( 1 .. $set ) {
            $weight->{$count++} = $result;
        }
    }
    return sub {
        my $rand = int(rand($total));
        return $weight->{$rand};
    }
}

=head2 Signature

            .’│_.-
          .’  ’  /_
       .-"    -.   ’>
    .- -. -.    ’. /    /│_
   .-.--.-.       ’ >  /  /
  (o( o( o )       \_."  <
   ’-’-’’-’            ) <
 (       _.-’-.   ._\.  _\
  ’----"/--.__.-) _-  \│
 AoS    "V""    "V"

=cut

1;
