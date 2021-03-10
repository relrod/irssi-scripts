use warnings;
use strict;
use Irssi;
use File::Temp qw/ tempfile tempdir /;

our $VERSION = '1.0.0';
our %IRSSI = (
  authors     => 'Rick Elrod',
  contact     => 'relrod@redhat.com',
  name        => 'spongify',
  description => 'sPonGifY yOuR tExT!',
  license     => 'BSD3',
  url         => 'https://github.com/relrod/irssi-scripts'
);

sub spongify {
    my ($key, $server, $dest) = @_;
    my $upper = 0;
    my $out = '';
    for my $c (split //, shift) {
        $out .= $upper ? uc $c : lc $c;
        $upper = !$upper unless $c eq ' ';
    }
    $dest->command('msg '.$dest->{name}.' '.$out);
    return 0;
}

Irssi::command_bind('spongify', \&spongify);
