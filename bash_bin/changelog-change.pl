#! /usr/bin/env perl

use 5.020;
use warnings;
use autodie;

use Cwd qw( cwd abs_path );
use DateTime;
use Getopt::Long;

my %opts = ( file => 'CHANGELOG.md' );

if ( !GetOptions( \%opts, 'file=s', 'verbose' ) ) {
  die("Invalid incantation\n");
}

main();
exit(0);

sub main {

  foreach my $req (qw( file )) {
    die("must specify a valid $req") unless ( exists( $opts{$req} ) );
  }

  my $dir = abs_path( cwd() );
  while ( ( $dir ne '/' ) && !( -f "$dir/$opts{'file'}" ) ) {
    $dir = dirname($dir);
  }

  my $filename = "$dir/$opts{'file'}";
  if ( -f "$filename" ) {
    message( "reading $filename", "" );

    my @data;
    open( my $fh, '<', $filename );
    while ( my $ln = <$fh> ) {
      chomp($ln);
      if ( $ln
        =~ /^#{3,}\s*sprint.+?(\d+)\s+(\(.+\)\s+)?[-=]\s+(\d{2})[\/-](\d{2})[\/-](\d{4})(\s+[-=]\s+\[ODS\s+R\d+S\d+\])?$/io
          )
      {
        my ( $sprint, $version, $month, $day, $year )
            = ( $1, $2, $3, $4, $5, $6 );
        $version = getVersion($sprint);

        my $dtSprint = DateTime->new(
          year  => $year,
          month => $month,
          day   => $day,
        );

        $ln = sprintf( '### Sprint: %2d %s - %s',
          $sprint, $version, $dtSprint->mdy('/') );

        my $ods = getOdsSprint($sprint);
        if ( defined($ods) ) {
          $ln .= " - [ODS $ods]";
        }

        say($ln);
      }

      push( @data, $ln );
    }
    close($fh);

    open( $fh, '>', $filename );
    $fh->print( join( "\n", @data ), "\n" );
    close($fh);
  } else {
    die("unable to find [$opts{'file'}]");
  }
}

sub getOdsSprint {
  my ($num) = @_;

  # Sprint 10 was the first one we aligned with ODS
  # Sprint 10 was their R11S4 (HIP)
  return undef if ( $num < 10 );

  my $offset = $num + 1;
  my $r      = int( $offset / 4 ) + 9;
  my $s      = int( $offset % 4 ) + 1;

  return "R$r" . "S$s";
}

sub getVersion {
  my ($num) = @_;

  my ( $mj, $mn, $pt ) = ( 0, 0, 0 );

  $mj = int( $num / 10 );
  $mn = $num % 10;

  while ( $mj > 1 ) {
    $mn += 10;
    $mj--;
  }

  return "(ver $mj.$mn.$pt)";
}

sub message {
  my $tmstmp = "====> " . scalar( localtime(time) );
  print( "\n", join( "\n", $tmstmp, @_ ), "\n" );
}
