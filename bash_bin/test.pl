#!/usr/bin/env perl

use Cwd qw( cwd abs_path );
use File::Basename;

print dirname(abs_path($0)), "\n";
