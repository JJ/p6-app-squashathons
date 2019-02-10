NAME
====

App::Squashathons - A script to analyze squashathon data

SYNOPSIS
========

    use App::Squashathons;
    
    # You need the URL of the gist where the log has been uploaded
    # Like this one:
    # https://gist.githubusercontent.com/Whateverable/dea42c24fedc2c39f32ad87ead7ce780/raw/c20e38515cf107349d7f23e1a90c811361039005/~log
    my $squashanalyzer = App::Squashathons.new(test-log-url);
    dd $squashanalyzer.contributions;
    
Or you can use directly the script

    resource/scripts/squashalyzer a-raw-url
    

DESCRIPTION
===========

App::Squashathons is a script and module for
analyzing
[squashathon](https://github.com/rakudo/rakudo/wiki/Rakudo-SQUASHathon-Guide) 
logs created by
the
[Squashable tool](https://github.com/perl6/whateverable/wiki/squashable).


AUTHOR
======

JJ Merelo <jjmerelo@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

