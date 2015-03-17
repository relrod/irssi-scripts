# (c) 2015 Ricky Elrod <relrod@redhat.com>, released under GPL
# (same as HsColour itself).
#
# NOTE: As of this writing, this requires patching HsColour to work correctly.
# See hscolour.patch in the GitHub repository from which this script was found.

use warnings;
use strict;
use Irssi;
use File::Temp qw/ tempfile tempdir /;

our $VERSION = '1.0.0';
our %IRSSI = (
  authors     => 'Ricky Elrod',
  contact     => 'relrod@redhat.com',
  name        => 'hscolour',
  description => 'Send pretty Haskell code to channels',
  license     => 'GPL',
  url         => 'https://github.com/relrod/irssi-scripts'
);

Irssi::command_bind('hscolour', sub {
  my ($data, $server, $item) = @_;
  my ($fh, $filename) = tempfile();
  print $fh $data;
  close $fh;
  my $cmd = `HsColour -mirc $filename`;
  $item->command('/msg '.$item->{name}.' '.$cmd);
  unlink $filename;
});

