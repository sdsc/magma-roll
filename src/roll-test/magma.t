#!/usr/bin/perl -w
# magma roll installation test.  Usage:
# magma.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/magma';
my $output;
my @COMPILERS = split(/\s+/, 'ROLLCOMPILER');

my $TESTFILE = 'tmpmagma';

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
#!/bin/bash
module load \$1 \$2 \$3
cd $TESTFILE.dir
/bin/cp -r /opt/magma/\$2/tests/* .
module load \$1 \$3
./example_sparse
END

if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'magma installed');
} else {
  ok(! $isInstalled, 'magma not installed');
}

SKIP: {

  skip 'magma not installed', 4 if ! $isInstalled;
  foreach my $compiler(@COMPILERS) {
      my $compilername = (split('/', $compiler))[0];
      $output = `bash $TESTFILE.sh $compiler $compilername CUDAVER 2>&1`;
      like($output, qr/.0545/, 'magma compiled with $compilername runs');
  }
  `/bin/ls /opt/modulefiles/applications/magma/[0-9]* 2>&1`;
  ok($? == 0, 'magma module installed');
  `/bin/ls /opt/modulefiles/applications/magma/.version.[0-9]* 2>&1`;
  ok($? == 0, 'magma version module installed');
  ok(-l '/opt/modulefiles/applications/magma/.version',
     'magma version module link created');

}

`rm -fr $TESTFILE*`;
