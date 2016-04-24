use strict;
use warnings;
use utf8;
package Acme::LookOfDisapproval;
# vim: set ts=8 sts=4 sw=4 tw=115 et :
# ABSTRACT: Send warnings with ಠ_ಠ
# KEYWORDS: unicode canary warning utf8 symbol

our $VERSION = '0.007';

use Exporter;
our @EXPORT = ('ಠ_ಠ');

sub import
{
    utf8->import;
    goto &Exporter::import;
}

sub ಠ_ಠ { goto &CORE::warn }

1;
__END__

=pod

=head1 SYNOPSIS

    use Acme::LookOfDisapproval;
    ಠ_ಠ 'you did something dumb';

=head1 DESCRIPTION

Use C<ಠ_ಠ> whenever you would use C<warn>, to express your profound
disapproval.

=head1 FUNCTIONS

=head2 C<ಠ_ಠ>

Behaves identically to L<perlfunc/warn>.

=head1 BACKGROUND

=for stopwords unicode

I wrote this as an exercise in using unicode in code, not just in a string.
Then, it became an interesting learning experience in how to cleanly map to a
core function, and re-exporting symbols.

The first draft did this:

    use Carp 'carp';
    sub ಠ_ಠ { local $Carp::CarpLevel = $Carp::CarpLevel + 1; carp @_; }

And then it became:

    BEGIN {
        no strict 'refs';
        *{__PACKAGE__ . '::ಠ_ಠ'} = *CORE::warn;
    }

But this is even nicer:

    sub ಠ_ಠ { goto &CORE::warn }

I also played around with L<Import::Into> to manage the export of both the
L<utf8> pragma and the C<ಠ_ಠ> symbol. However, that's just silly when we can
call C<import> directly on L<utf8> (it's a pragma, so the caller doesn't
matter -- only when it is called: during the caller's compilation cycle),
and then we can export our symbol by using L<goto> to jump to L<Exporter>.

=for stopwords dzil utf8

I also discovered while writing this distribution that L<Dist::Zilla> is not
able to munge files with utf8 characters, therefore I had to switch to packaging
this distribution with vanilla L<ExtUtils::MakeMaker>; also, a number of the
author and release tests that would have been added by dzil automatically
didn't work either (for example, see C<t/00-compile.t> -- C<< qx(^$X "require $_") >>
both needs the C<:binmode> or C<:encoding(UTF-8)> layer applied to C<STDOUT>, and
requires the L<utf8> pragma applied in the sub-perl (leading to more patches).

=head1 SEE ALSO

=for :list
* L<the Look of Disapproval Meme|http://knowyourmeme.com/memes/%E0%B2%A0_%E0%B2%A0-look-of-disapproval>
* L<lambda> - another example of unicode sub names

=cut
