package MyProject;

use Moose;
use namespace::autoclean;
use 5.019;
use Data::Dump qw(dump);
use Carp;
use Class::Load ':all';

has 'attr' => (
    is => 'ro',
    isa => 'Str',
    default => "",
);

sub model {
    my ($self, $class) = @_;
    my $c = ref $self;
    $c .= '::' . $class;
    load_class($c);
    return $c->new( myproject => $self );
}

1;
