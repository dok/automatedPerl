#!usr/bin/perl -w
#Simple script I wrote to automate writing cover letters for 
#individual companies.
use strict;
use warnings;

use Template;

print "Who is receiving this message?:";
chomp(my $receiver = <STDIN>);
print "Where did you find this posting?:";
chomp(my $place = <STDIN>);
print "What is the position being applied for?:";
chomp(my $position = <STDIN>);
print "What is the name of the company?:";
chomp(my $company = <STDIN>);

my $tt = Template->new({
        #    INCLUDE_PATH => '/usr/local/templates',
        #    INTERPOLATE  => 1,
    }) || die "$Template::ERROR\n";

my $vars = {
        receiver => $receiver,
        company => $place,
        position => $position,
        place => $company,
    };
    
    $tt->process('CoverLetter.txt', $vars, 'output.txt')
        || die $tt->error(), "\n";
