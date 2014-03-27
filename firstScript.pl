#!/usr/local/bin/perl
print "Hello world!\n";
print "This is a single statement.";
print "Look, ", "a ", "list!\n";



sub do_search
{
    my $term = shift @_;

    my $page = 1;
    my @results;

    while (scalar @results < $opts{maxresults})
    {
	my $rset = $handle->search({query=>$term, page => $page, rpp => $opts{rpp} });
	print "Searching for $term (page $page)\n" if $opts{verbose};
	if (ref $rset eq 'HASH' && exists $rset->{results})
	{
   # break out if no results came back
	    last unless @{$rset->{results}};
	    push @results, @{$rset->{results}};
	    printf "Now we have %d entries\n", scalar @results if $opts{verbose};
	}

  # go to the next page
	$page++;
    }

    print_post($_) foreach @results;
}


sub print_post
{
    my $t = shift @_;
 
    printf("%s (on %s)\n\t%s\n", $t->{from_user}, $t->{created_at}, $t->{text});

    if ($opts{verbose})
    {
  foreach my $key (sort keys %$t)
  {
      my $v = $t->{$key};
      $v = '(UNDEFINED)' unless defined $v;
      print "...$key=$v\n";
  }
    }
}
