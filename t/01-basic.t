use v6.c;
use Test;

use App::Squashathons;

constant test-log-url = "https://gist.githubusercontent.com/Whateverable/97e48cd53ee6983a046a2769b9f5f5c2/raw/53610087e4ee9dc1679e0278aac0f008d14a10ef/~log";
is headers.elems, 8, "Headers are exported";
my $squashanalyzer = App::Squashathons.new(test-log-url);

isa-ok $squashanalyzer, App::Squashathons, "Creation OK";
isa-ok $squashanalyzer.contributions, Hash, "Hash contributions created";
is $squashanalyzer.contributions<viklund><total>, 1, "Contributions tallied";
isa-ok $squashanalyzer.csv, Seq, "Contributions are an array";
is $squashanalyzer.csv.elems, $squashanalyzer.contributions.keys.elems, "All contributors" ;
done-testing;
