package Data::Random::Weighted;


# ABSTRACT: get weighted random data


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


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Random::Weighted - get weighted random data

=head1 VERSION

version 0.001

=head1 Data::Random::Weighted

Used to return random results from a weighted set.

=head1 Usage

my $rand = randomizer({
    5 => 'Result',
    1 => 42,
});

print &$rand;

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

=head1 AUTHOR

Russel Fisher <geistberg@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Russel Fisher.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
