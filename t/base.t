#!/usr/bin/perl

use warnings;
use strict;
use Test::More;
use Data::Random::Weighted qw( randomizer );

use_ok('Data::Random::Weighted') || BAIL_OUT('Library cannot be used all is dooom!');

my $a = randomizer({ 1 => 1 });

is( &$a, 1, 'anonymous sub functions' );
