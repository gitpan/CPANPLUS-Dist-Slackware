
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Install Perl distributions on Slackware Linux",
  "AUTHOR" => "Andreas Voegele <voegelas\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "CPANPLUS-Dist-Slackware",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "CPANPLUS::Dist::Slackware",
  "PREREQ_PM" => {
    "CPANPLUS" => 0,
    "Cwd" => 0,
    "File::Find" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "IO::Compress::Gzip" => 0,
    "IPC::Cmd" => 0,
    "Locale::Maketext::Simple" => 0,
    "Module::CoreList" => 0,
    "Module::Pluggable" => 0,
    "POSIX" => 0,
    "Params::Check" => 0,
    "Pod::Find" => 0,
    "Pod::Simple" => 0,
    "Text::Wrap" => 0,
    "version" => "0.77"
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "1.014",
  "test" => {
    "TESTS" => "t/*.t"
  }
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



