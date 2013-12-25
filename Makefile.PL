
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
    "parent" => 0,
    "version" => "0.77"
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "1.016",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
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
  "parent" => 0,
  "version" => "0.77"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



