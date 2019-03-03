use v6.c;
use Test;

use App::Squashathons;

constant test-log-url = "https://gist.github.com/Whateverable/fd42ad595be016297ef2987c62cb8283/raw/4ed1611ac9f57b6ed86ebffeb18217a542dc9233/~log";
is headers.elems, 9, "Headers are exported";
my $squashanalyzer = App::Squashathons.new(test-log-url);

isa-ok $squashanalyzer, App::Squashathons, "Creation OK";
isa-ok $squashanalyzer.contributions, Hash, "Hash contributions created";
say $squashanalyzer.contributions.perl;
isa-ok $squashanalyzer.csv, Seq, "Contributions are an array";
is $squashanalyzer.csv.elems, $squashanalyzer.contributions.keys.elems, "All contributors" ;
is $squashanalyzer.total, 129, "Total contributions correct";
done-testing;
