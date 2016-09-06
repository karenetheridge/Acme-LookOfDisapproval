use strict;
use warnings;

use Test::More 0.88;
use Test::Warnings 0.005 ':all';
use Acme::LookOfDisapproval;

my $line; my $file = __FILE__;
is(
    warning { ಠ_ಠ('oh noes'); $line = __LINE__ },
    "oh noes at $file line $line.\n",
    'warning appears, and with the right file and line',
);

done_testing;
