
use strict;
use warnings;

use Module::Build 0.2808;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.2808"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.2808"
  },
  "dist_abstract" => "Install Perl distributions on Slackware Linux",
  "dist_author" => [
    "Andreas Voegele <voegelas\@cpan.org>"
  ],
  "dist_name" => "CPANPLUS-Dist-Slackware",
  "dist_version" => "1.012",
  "license" => "perl",
  "module_name" => "CPANPLUS::Dist::Slackware",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
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
    "perl" => "5.010",
    "version" => "0.77"
  },
  "script_files" => [],
  "test_requires" => {}
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
