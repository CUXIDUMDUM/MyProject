#!/usr/bin/env perl
use strict;
use warnings;
use 5.016;
use FindBin;
use File::Spec;
use lib File::Spec->catfile($FindBin::Bin, '..', 'lib');
use lib File::Spec->catfile($FindBin::Bin, '..', 't', 'lib');
use Data::Dump qw/dump/;
use English qw( -no_match_vars );
use Carp;
use Readonly;

use MyProject;
use MyProject::Factory;

my $factory = MyProject::Factory->new( classnames => ['Foo','Bar'] );

my $o = MyProject->new( attr => "foo" );

$o->model('Foo')->dummy();
$o->model('Bar')->dummy();
$o->model('Foo')->myproject->model('Bar')->dummy();
