package MyProject::Base;

use Moose;
use namespace::autoclean;
use 5.019;
use Data::Dump qw(dump);
use Carp;

sub dummy {
    my ($self) = @_;
    say ref($self);
}

1;
