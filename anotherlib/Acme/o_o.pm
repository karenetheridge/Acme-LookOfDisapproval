use strict;
use warnings;
use utf8;
package Acme::ಠ_ಠ;
# vim: set ts=8 sts=2 sw=2 tw=100 et :
# ABSTRACT: Send warnings with ಠ_ಠ

our $VERSION = '0.007';

use Acme::LookOfDisapproval;
our @EXPORT = ('ಠ_ಠ');

sub import {
  goto &Acme::LookOfDisapproval::import;
}

1;
__END__

=pod

=head1 SYNOPSIS

    use utf8;
    use Acme::ಠ_ಠ;
    ಠ_ಠ 'you did something dumb';

=head1 DESCRIPTION

See L<Acme::LookOfDisapproval>.

=for stopwords unicode

This module also serves as a test of unicode module names. I have no idea if
this will work -- let's find out!!!

=head1 FUNCTIONS

=head2 C<ಠ_ಠ>

Behaves identically to L<perlfunc/warn>.

=cut
