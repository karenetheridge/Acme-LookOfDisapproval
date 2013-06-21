use strict;
use warnings;
use utf8;
package Acme::ಠ_ಠ;
# ABSTRACT: send warnings with ಠ_ಠ

use Acme::LookOfDisapproval;
our @EXPORT = ('ಠ_ಠ');

sub import
{
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

This module also serves as a test of unicode module names. I have no idea if
this will work -- let's find out!!!

=cut
