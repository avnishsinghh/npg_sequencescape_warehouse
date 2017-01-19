#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/00-critic.t,v $
# $HeadURL$
#
package critic;
use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$LastChangedRevision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

if (!$ENV{TEST_AUTHOR}) {
  my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
  plan( skip_all => $msg );
}

eval {
  require Test::Perl::Critic;
};

if($EVAL_ERROR) {
  plan skip_all => 'Test::Perl::Critic not installed';

} else {
  Test::Perl::Critic->import(
	-severity => 1,
        -profile  => 't/perlcriticrc',
	-exclude  => [ 'tidy',
                   'ValuesAndExpressions::ProhibitImplicitNewlines',
                   'ValuesAndExpressions::RequireConstantVersion',
                   'Documentation::PodSpelling',
                   'Subroutines::ProhibitUnusedPrivateSubroutines',
                   'RegularExpressions::ProhibitEnumeratedClasses',
                   'RegularExpressions::ProhibitEscapedMetacharacters',
                   'Subroutines::ProtectPrivateSubs',
                   'Variables::ProhibitPunctuationVars',
                   'Documentation::RequirePodAtEnd'
                 ],
  );

  all_critic_ok( 'bin', 'lib/srpipe', 'lib/npg_common');
}

1;
