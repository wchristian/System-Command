use strict;
use warnings;
use Test::More;
use File::Find;

my @modules;
find( sub { push @modules, $File::Find::name if /\.pm$/ }, 'lib' );

plan tests => scalar @modules;

use_ok($_)
    for reverse sort map { s!/!::!g; s/\.pm$//; s/^lib:://; $_ } @modules;

diag("Tested System::Command $System::Command::VERSION, Perl $], $^X");
