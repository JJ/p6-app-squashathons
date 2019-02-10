use v6.c;
unit class App::Squashathons:ver<0.0.1>;

use LWP::Simple;

has @!contributions;
has $.lwp;

method new( $url ) {
    my $lwp = LWP::Simple.new();
    my $content = $lwp.get($url) || die "Input $url does not work";
    my @contributions;
    for $content.lines -> $l {
        push @contributions, $l;
    }
    self.bless(:@contributions,:$lwp);
    
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
