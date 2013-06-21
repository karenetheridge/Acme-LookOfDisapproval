use strict;
use warnings;
package Acme::LookOfDisapproval;
# ABSTRACT: send warnings with ಠ_ಠ

use utf8;
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

=head1 FUNCTIONS/METHODS

=over 4

=item * C<ಠ_ಠ>

Behaves identically to L<perlfunc/warn>.

=back

=head1 BACKGROUND

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

=head1 SUPPORT

=for stopwords irc

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=Acme-LookOfDisapproval>
(or L<bug-Acme-LookOfDisapproval@rt.cpan.org|mailto:bug-Acme-LookOfDisapproval@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=head1 SEE ALSO

=begin :list

* L<the Look of Disapproval Meme|http://knowyourmeme.com/memes/%E0%B2%A0_%E0%B2%A0-look-of-disapproval>

=end :list

=cut
