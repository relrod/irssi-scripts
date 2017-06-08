# (c) 2017 Ricky Elrod <ricky@elrod.me>, released under BSD-3.
#
# Fix the annoying behavior where hitting tab on a blank input line causes
# you to send a message to the last person with whom you have conversed.

use warnings;
use strict;
use Irssi;

our $VERSION = '1.0.0';
our %IRSSI = (
  authors     => 'Ricky Elrod',
  contact     => 'ricky@elrod.me',
  name        => 'emptytabfixer',
  description => 'Kill the annoying default tab-on-empty-input behavior with fire.',
  license     => 'BSD3',
  url         => 'https://github.com/relrod/irssi-scripts'
);

sub my_handler {
  my ($strings, $window, $word, $linestart, $want_space) = @_;
  Irssi::signal_stop() if ($linestart eq '' && $word eq '');
}

Irssi::signal_add_first 'complete word', 'my_handler';
