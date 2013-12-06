package MyProject::Factory;

use Moose;
use namespace::autoclean;
use 5.019;
use Data::Dump qw(dump);
use Carp;

has 'classnames' => (
    is => 'ro',
    isa => 'ArrayRef[Str]',
    default => sub { ['Foo', 'Bar'] },
);

sub BUILD {
    my ($self) = @_;

    for my $c ( @{$self->classnames} ) {
        my $class = "MyProject::" . $c;
        my $meta = Moose::Meta::Class->create($class);
        $meta->make_mutable;
        $meta = Moose::Meta::Class->create(
            $class => ( version => 1, superclasses => ["MyProject::Base"] ),
        );

        $meta->add_attribute( "myproject" => (
                is => 'ro',
                isa => 'Object',
                required => 1,
            ),
        );

        $meta->make_immutable;
    }
}

1;
