# I got tired of looking like a fool by accidentally sending e.g. /12/12 to
# channels when I would go to switch to window 12 (given that I have aliases
# set up for /<window number> -> /window <window number>.
#
# Often times I would type, e.g. /12, intending to switch to window 12, but
# then something would catch my eye and I would want to read the current
# window for a few seconds more. Then I would decide to switch again, having
# forgotten that I typed /12 alredy from the first time. Nothing caught this
# and I would end up sending "/12/12" to the channel. This script prevents that.
# It is a magical wonder, and nobody in a million years could ever dream of
# having the creativity that I did when coming up with this complex, wonderous
# beast of a script.
#
# (c) 2013 Ricky Elrod <ricky@elrod.me>, released under BSD-3.

use warnings;
use strict;
use Irssi;

our $VERSION = '1.0.0';
our %IRSSI = (
  authors     => 'Ricky Elrod',
  contact     => 'ricky@elrod.me',
  name        => 'doubleslashwindowfixer',
  description => 'Stop looking like a fool by sending /12/12 when trying to switch to window 12',
  license     => 'BSD3',
  url         => 'https://github.com/relrod/irssi-scripts'
);

sub my_handler {
  my ($text, $server, $win_item) = @_;
  if ($text =~ m/^\/\d+\/\d+$/) {
    Irssi::signal_stop();
    return;
  }
}

Irssi::signal_add_first 'send text', 'my_handler';
