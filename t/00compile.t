# $Id: 00compile.t,v 1.1 2006/01/01 01:12:17 nicolaw Exp $

chdir('t') if -d 't';
use lib qw(./lib ../lib);
use Test::More tests => 2;

use_ok('Acme::Stardate');
require_ok('Acme::Stardate');

