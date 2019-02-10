use v6.c;
unit class App::Squashathons:ver<0.0.1>;

use LWP::Simple;

constant headers is export = <total wrote labeled unlabeled opened closed reopened self edited>;
has @!contributions;
has %.contributions;
has $!lwp;

method new( $url ) {
    my $lwp = LWP::Simple.new();
    my $content = $lwp.get($url) || die "Input $url does not work";
    my %contributions;
    for $content.lines -> $l {
        next if $l ~~ /"♥"/; # First contribution
        $l ~~ /$<who> = [ <[\w \-]>+ ]\+\+ \s+ $<what> = [ \w+ ]/;
        my $who = ~$<who>;
        my $what = ~$<what>;
        if defined %contributions{$who} {
           if defined %contributions{$who}{$what} {
             %contributions{$who}{$what}++;
             %contributions{$who}<total>++;
           } else {
                %contributions{$who}{$what} = 1;
           }
        } else {
            %contributions{$who} = { $what => 1,
                                     total => 1};
        }
    }
    self.bless(:%contributions,:$lwp);
    
}

method csv( --> Seq ) {
    gather {
        for %.contributions.keys.sort: { %.contributions{$^b}<total> <=>  %.contributions{$^a}<total> } -> $author {
            my @these-contribs = gather {
                for headers -> $action {
                    take %.contributions{$author}{$action} // "";
                }
            }
            take  "$author, " ~ @these-contribs.join(", " );

        }
    }
}

method total( --> Int ) {
    %.contributions.keys.map( { %.contributions{$_}<total> }  ).sum;
}

=begin pod

=head1 NAME
w
App::Squashathons - blah blah blah

=head1 SYNOPSIS

  use App::Squashathons;

=head1 DESCRIPTION

App::Squashathons is ...

=head1 AUTHOR

JJ Merelo <jjmerelo@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
