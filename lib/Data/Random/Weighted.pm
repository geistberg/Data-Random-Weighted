package Data::Random::Weighted;

=head1 Data::Random::Weighted

Used to return random results from a weighted set.

=cut

# ABSTRACT: get weighted random data

=head1 Usage

my $rand = randomizer({
    'Result' => 5,
    42       => 1,
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
    $total += $_ for values %$args;
    my $weight;
    my $count = 0;
    for my $key( keys %$args ) {
        my $set = $args->{$key};
        for ( 1 .. $set ) {
            $weight->{$count++} = $key;
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
