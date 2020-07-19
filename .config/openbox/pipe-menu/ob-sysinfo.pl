#!/usr/bin/env perl

# The script base is taken from http://openbox.org/wiki/Openbox:Pipemenus

use strict;
use warnings;
use autodie;
use POSIX qw(strftime);
use XML::Simple;
use Data::Dumper;

# DISTRO
open (my $issue, "<", "/etc/issue");
my $distro;
while (<$issue>) {
  if (/^[^\s]/) {
    $distro = (split / /, ((split /\\/)[0]))[0];
    last;
   }
}
close $issue;

# HOST
my $host = `uname -n`;
chomp $host;

# OS
my $os = `uname -o`;
chomp $os;;

# KERNEL
my $kernel = `uname -r`;
chomp $kernel;

# OPENBOX THEME
my $file = "$ENV{HOME}/.config/openbox/rc.xml";
my $xs1 = XML::Simple->new();
my $doc = $xs1->XMLin($file);
my $obtheme = $doc->{theme}->{'name'};

# LOAD
my $load = (split ' ', (split ':', `uptime`)[4])[0];
chop $load;

# MEMORY (active)
open (my $meminfo, "<", "/proc/meminfo");
my $mem_act;
while (<$meminfo>) {
  chomp;
  if (/^Active:/) {
    $mem_act = int(((split)[-2])/1024);
    last;
    }
}
close $meminfo;

# UPTIME
my $uptime = `uptime -p | sed 's/.*up //g'`;

# WRITING TO PIPEMENU
print "<openbox_pipe_menu>\n"
    . "<separator label=\"$ENV{USER}\@$host \"  />\n"
    . "<item label=\"OS:     $distro $os \" />\n"
    . "<item label=\"Kernel: $kernel \" />\n"
    . "<item label=\"Theme:  $obtheme \" />\n"
    . "<item label=\"Load:   $load \" />\n"
    . "<item label=\"Memory: $mem_act MB\" />\n"
    . "<item label=\"Uptime: $uptime \" />\n"
    . "</openbox_pipe_menu>\n";
