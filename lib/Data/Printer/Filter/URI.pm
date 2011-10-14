package Data::Printer::Filter::URI;
# ABSTRACT: pretty-printing URI objects

use strict;
use utf8;
use warnings 'all';

use Data::Printer::Filter;
use Term::ANSIColor;

our $VERSION = '0.001'; # VERSION


our @schemes = qw(
    URL
    data
    file
    ftp
    gopher
    http
    https
    ldap
    ldapi
    ldaps
    mailto
    mms
    news
    nntp
    pop
    rlogin
    rsync
    rtsp
    rtspu
    sftp
    sip
    sips
    snews
    ssh
    telnet
    tn3270
    urn
);

filter "URI::$_" => sub {
    my ($obj, $p) = @_;
    my $color = $p->{color}{uri};
    return colored('"' . $obj->as_string . '"', $color // 'bright_yellow');
} for @schemes;

1;

__END__
=pod

=encoding utf8

=head1 NAME

Data::Printer::Filter::URI - pretty-printing URI objects

=head1 VERSION

version 0.001

=head1 SYNOPSIS

# In your program:

    use Data::Printer filters => {
        -external => [ 'URI' ],
    };

# or, in your C<.dataprinter> file:

    {
        filters => {
            -external => [ 'URI' ],
        },
    };

# You can also setup color and display details:

    use Data::Printer {
        filters => {
            -external   => [ 'URI' ],
        }, color => {
            uri         => 'bright_yellow',
        },
    };

=head1 DESCRIPTION

This is a filter plugin for L<Data::Printer>.
It filters through several L<URI> manipulation classes and displays the L<URI> as a string.

=head2 Parsed Protocols

=over 4

=item *

data

=item *

file

=item *

ftp

=item *

gopher

=item *

http

=item *

https

=item *

ldap

=item *

ldapi

=item *

ldaps

=item *

mailto

=item *

mms

=item *

news

=item *

nntp

=item *

pop

=item *

rlogin

=item *

rsync

=item *

rtsp

=item *

rtspu

=item *

sftp

=item *

sip

=item *

sips

=item *

snews

=item *

ssh

=item *

telnet

=item *

tn3270

=item *

urn

=back

=head1 AUTHOR

Stanislaw Pusep <stas@sysd.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Stanislaw Pusep.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
