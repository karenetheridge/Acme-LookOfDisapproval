use strict;
use warnings;
use utf8;
package Acme::ಠ_ಠ;
# ABSTRACT: Send warnings with ಠ_ಠ
# vim: set ts=8 sts=4 sw=4 tw=115 et :

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

=for stopwords unicode

This module also serves as a test of unicode module names. I have no idea if
this will work -- let's find out!!!

=head1 FUNCTIONS

=head2 C<ಠ_ಠ>

Behaves identically to L<perlfunc/warn>.

=head1 SUPPORT

=for stopwords irc

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Acme-LookOfDisapproval>
(or L<bug-Acme-LookOfDisapproval@rt.cpan.org|mailto:bug-Acme-LookOfDisapproval@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=cut
