#!perl

use strict;
use warnings;

use Test::More 0.94;

use File::Find;
use File::Temp qw{ tempdir };

my @module_files;
find(
  sub {
    return if $File::Find::name !~ /\.pm\z/;
    my $found = $File::Find::name;
    # nothing to skip
    push @module_files, $found;
  },
  'lib',
);

sub _find_scripts {
    my $dir = shift @_;

    my @found_scripts = ();
    find(
      sub {
        return unless -f;
        my $found = $File::Find::name;
        # nothing to skip
        open my $FH, '<', $_ or do {
          note( "Unable to open $found in ( $! ), skipping" );
          return;
        };
        my $shebang = <$FH>;
        return unless $shebang =~ /^#!.*?\bperl\b\s*$/;
        push @found_scripts, $found;
      },
      $dir,
    );

    return @found_scripts;
}

my @scripts;
do { push @scripts, _find_scripts($_) if -d $_ }
    for qw{ bin script scripts };

my $plan = scalar(@module_files) + scalar(@scripts);
$plan ? (plan tests => $plan) : (plan skip_all => "no tests to run");

{
    # fake home for cpan-testers
    # no fake requested ## local $ENV{HOME} = tempdir( CLEANUP => 1 );

    for my $lib (sort @module_files)
    {
        my $command = qq($^X -Ilib $lib );
        system $command;
        is($?, 0, "$lib loaded ok")
    }

    SKIP: {
        eval "use Test::Script 1.05; 1;";
        skip "Test::Script needed to test script compilation", scalar(@scripts) if $@;
        foreach my $file ( @scripts ) {
            my $script = $file;
            $script =~ s!.*/!!;
            script_compiles( $file, "$script script compiles" );
        }
    }
    BAIL_OUT("Compilation failures") if !Test::More->builder->is_passing;
}
