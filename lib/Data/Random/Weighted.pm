package Data::Random::Weighted;

=head1 Data::Random::Weighted

Used to return random results from a weighted set.

=cut

# ABSTRACT: get weighted random data

=head1 Usage

my $rand = Data::Random::Weighter->new({
    'Result' => 5,
    42       => 1,
 });

print $rand->roll;

=cut

use strict;
use warnings;

sub new {
    my $class = shift;
    my $args  = shift || {};
    my $self  = bless {}, $class;
    $self->{'roller'} = $self->randomizer($args);
    return $self;
}

sub randomizer {
    my ( $self, $args ) = @_;
    my ( $weight, $total );
    my $count = 0;
    for my $key( keys %$args ) {
        my $set = $args->{$key};
        $total += $set;
        for ( 1 .. $set ) {
            $weight->{$count++} = $key;
        }
    }
    return sub {
        my $rand = int(rand($total));
        return $weight->{$rand};
    }
}

sub roll { &{ shift->{'roller'} }() }

1;
