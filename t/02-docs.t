use v6.c;
use Test;

use App::Squashathons;

constant test-log-url = "https://gist.github.com/Whateverable/fd42ad595be016297ef2987c62cb8283/raw/4ed1611ac9f57b6ed86ebffeb18217a542dc9233/~log";
my $squashanalyzer = App::Squashathons.new(test-log-url);

for $squashanalyzer.contributions.keys -> $who {
    is ([+] $squashanalyzer.contributions{$who}{no-total}:v),
        $squashanalyzer.contributions{$who}<total>, "Tallied contributions";
}

is $squashanalyzer.csv.elems, $squashanalyzer.contributions.keys.elems, "All contributors" ;
is $squashanalyzer.total, 149, "Total contributions correct";
done-testing;
