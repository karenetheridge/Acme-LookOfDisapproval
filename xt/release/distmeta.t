#!perl

use Test::More;

plan skip_all => 'we have no META.yml :o';

eval "use Test::CPAN::Meta";
plan skip_all => "Test::CPAN::Meta required for testing META.yml" if $@;
meta_yaml_ok();
