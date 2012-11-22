#
# Print hilighted messages & private messages to window named "hilight" for
# irssi 0.7.99 by Timo Sirainen
#
# Modded a tiny bit by znx to stop private messages entering the hilighted
# window (can be toggled) and to put up a timestamp.
#

use Irssi;
use Irssi::TextUI;
use POSIX;
use vars qw($VERSION %IRSSI); 

$VERSION = "0.02";
%IRSSI = (
    authors     => "Juho \"Garo\" Mäkinen",
    contact     => "juho.makinen@gmail.com", 
    name        => "privatemessagewindow",
    description => "Moves private messages from a bitlbee network into a dedicated &bitlbee window",
    license     => "Public Domain",
    url         => "http://irssi.org/"
);

$status = '';
$updated = 0;

sub sig_private {
    my ($server, $msg, $nick, $address) = @_;

     $window = Irssi::window_find_item('&bitlbee');

    if ($server->{tag} eq "bitlbee") {
#      $window->print("Got private message from $nick, address: $address, message: $msg, server chat_type: " . $server->{chat_type} . ", server tag:" . $server->{tag}, MSGLEVEL_NEVER) if ($window);
      $window->print("%R" . $nick . ": $msg", MSGLEVEL_HILIGHT) if ($window);      
      Irssi::signal_stop();
    }

}


Irssi::signal_add('message private', 'sig_private');


# vim:set ts=4 sw=4 et:
