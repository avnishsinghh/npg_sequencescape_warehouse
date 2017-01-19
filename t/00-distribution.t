use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

eval {
  require Test::Distribution;
};

if($EVAL_ERROR) {
  plan skip_all => 'Test::Distribution not installed';
} else {
  my @nots = qw(prereq pod);
  Test::Distribution->import('not' => \@nots); # Having issues with Test::Dist seeing my PREREQ_PM :(
}

1;
