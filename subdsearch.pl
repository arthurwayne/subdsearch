#!/usr/bin/perl


###############################################################
###############################################################
###  SubDsearch is a tool in perl for foreach subdomais     ###
### Code by KoubackTr / 2014 http://koubacktr.wordpress.com ###               
###############################################################
###############################################################

use IO::Socket;
use Term::ANSIColor;

use strict;
print color 'bold magenta';
print '


 $$$$$$\            $$\       $$$$$$$\                                                    $$\       
$$  __$$\           $$ |      $$  __$$\                                                   $$ |      
$$ /  \__|$$\   $$\ $$$$$$$\  $$ |  $$ | $$$$$$$\  $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$$\ $$$$$$$\  
\$$$$$$\  $$ |  $$ |$$  __$$\ $$ |  $$ |$$  _____|$$  __$$\  \____$$\ $$  __$$\ $$  _____|$$  __$$\ 
 \____$$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |\$$$$$$\  $$$$$$$$ | $$$$$$$ |$$ |  \__|$$ /      $$ |  $$ |
$$\   $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ | \____$$\ $$   ____|$$  __$$ |$$ |      $$ |      $$ |  $$ |
\$$$$$$  |\$$$$$$  |$$$$$$$  |$$$$$$$  |$$$$$$$  |\$$$$$$$\ \$$$$$$$ |$$ |      \$$$$$$$\ $$ |  $$ |
 \______/  \______/ \_______/ \_______/ \_______/  \_______| \_______|\__|       \_______|\__|  \__|
';
print color 'reset';
print'
-----------------------------------------------------------------------------------------------------
   By KoubackTr 2014 // http://koubacktr.wordpress.com/  //  http://twitter.com/kouback_tr_ //       
-----------------------------------------------------------------------------------------------------
';

my $domain=$ARGV[0] || die

"\n           USE: SubDsearch <DOMAIN>\n
            EX: SubDsearch  domain.com\n
";

#my $subdomain="news";


my $banco_dados = "./database_sub.db";  ## This file is a simpel database of subdomains names...
open(SUBDOMAINS,"< $banco_dados") or die "FILE database.txt NOT FOUND!\n"; 
chomp(my @sub = <SUBDOMAINS>); 
foreach my $subdomain (sort @sub){ 

# SOCKET #

my $socket=IO::Socket::INET ->new(
	PeerAddr=>"$subdomain.$domain",
	Proto=>'icmp', # ICMP
	timeout=>1);

 
if ($socket ne "") {  

print color 'bold green';
print "...............[OK!] $subdomain.$domain\n";  # SUBDOMAINS OK
print color 'reset';

# Save subdomains UP in file (mkdir output directory)
system("echo '...............[OK!] $subdomain.$domain\n' >> output/$domain-SUBs.txt ");


}else{

# You can desactive this else #

print color 'red';
print ".........[FAIL!] $subdomain.$domain\n";     # SUBDOMAINS FAIL
print color 'reset';

}
}

#  FIM  #
print color 'bold yellow';
print "\n\t\t\t\t\t[!] Subdomains UP saved in output/$domain-SUBs.txt\n\n";
print color 'reset';
