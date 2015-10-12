 # get all the overlapping alignments
 @all_alignments = $segment->features;  

 # get an iterator across the alignments
 my $iterator     = $segment->features(-iterator=>1);
 while (my $align = $iterator->next_seq) { do something }

 # get a TAM filehandle across the alignments
 my $fh           = $segment->features(-fh=>1);
 while (<$fh>) { print }

 # get only the alignments with unmapped mates
 my @unmapped    = $segment->features(-flags=>{M_UNMAPPED=>1});

 # get coverage across this region
 my ($coverage)       = $segment->features('coverage');
 my @data_points      = $coverage->coverage;

 # grep through features using a coderef
 my @reverse_alignments = $segment->features(
                           -filter => sub {
                                  my $a = shift;
                                  return $a->strand < 0;