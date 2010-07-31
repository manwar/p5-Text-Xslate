#!perl -w
use strict;

my $uri_unsafe = qr/[^A-Za-z0-9\-\._~]/; # defined by RFC 3986
my $html_meta  = qr/[<>'"&]/; # '

print "/* This file is automatically generated by $0 */\n";

print <<'C';
enum { TXct_NORMAL, TXct_HTML_META = 0x01, TXct_URI_UNSAFE = 0x02 };
static const U8 char_trait[] = {
C

for(my $i = 0; $i < 256; $i++) {
    my $c = chr $i;
    my @s;
    if($c =~ $uri_unsafe) {
        push @s, 'TXct_URI_UNSAFE';
    }
    if($c =~ $html_meta) {
        push @s, 'TXct_HTML_META';
    }
    if(!@s) {
        push @s, 'TXct_NORMAL';
    }
    printf "    %-30s /* \\x%02X%s */,\n",
        join('|', @s),
        $i, ($c =~ /[[:print:]]/ ? " $c" : '');
}

print <<'C';
}; /* char_trait */
C

