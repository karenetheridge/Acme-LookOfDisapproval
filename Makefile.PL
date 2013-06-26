use strict;
use warnings;
use 5.016000;
use ExtUtils::MakeMaker 6.30;

my %WriteMakefileArgs = (
    NAME          => 'Acme::LookOfDisapproval',
    AUTHOR        => 'Karen Etheridge <ether@cpan.org>',
    VERSION_FROM  => 'lib/Acme/LookOfDisapproval.pm',
    ABSTRACT_FROM => 'lib/Acme/LookOfDisapproval.pm',
    LICENSE       => 'perl',

    PL_FILES      => {},
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.30',
    },
    PREREQ_PM     => {
        'Exporter' => 0,
        'utf8' => 0,
    },
    TEST_REQUIRES => {
        'File::Find' => 0,
        'File::Temp' => 0,
        'Test::CheckDeps' => '0.002',
        'Test::More' => '0.94',
        'Test::Warnings' => '0.005',
    },
    BUILD_REQUIRES => {
        'Test::Spelling' => '0.12',
        'Pod::Wordlist::hanekomu' => 0,
        'Test::CPAN::Meta' => 0,
        'Test::EOL' => 0,
        'Test::NoTabs' => 0,
        'Test::Pod' => '1.41',
    },
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

