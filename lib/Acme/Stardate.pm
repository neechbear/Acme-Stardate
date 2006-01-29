############################################################
#
#   $Id: Stardate.pm,v 1.2 2006/01/12 21:33:57 nicolaw Exp $
#   Acme::Stardate - Calculate dates in to Stardates
#
#   Copyright 2004,2005 Nicola Worthington
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
############################################################

package Acme::Stardate;
# vim:ts=4:sw=4:tw=78

use strict;
use Exporter;
use LWP::UserAgent qw();
use HTTP::Request qw();
use Carp qw(carp croak);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS
			$DAYS_IN_YEAR);

$VERSION     = sprintf('%d.%02d', q$Revision: 1.2 $ =~ /(\d+)/g);
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(&tos_stardate &tng_stardate &voyager_stardate &ds9_stardate
					&present_stardate &pretend_stardate &stardate);
%EXPORT_TAGS = ( all => \@EXPORT_OK );

$DAYS_IN_YEAR = 365.2422;


die _get_time("225 May 2322 00:00:00 +0000");


sub tng_stardate {
	my $time = _get_time(shift);
	# Stardate 00000.0 began on May 25, 2322 00:00:00
	# An average Earth year comprises 365.2422 mean solar days
	# Voyager episode "Homestead" stated April 6, 2377, was Stardate 54868.6
}

#function StardateThis(form) {
#
#YearInput = eval(form.Year.value)
#MonthInput = eval(form.Month.value)
#DayInput = eval(form.Date.value)
#HourInput = eval(form.Hour.value)
#MinuteInput = eval(form.Minute.value)
#
#var StardateOrigin = new Date("May 25, 2322 00:00:00");
#var StardateInput = new Date();
#
#StardateInput.setYear(YearInput)
#StardateInput.setMonth(MonthInput)
#StardateInput.setDate(DayInput)
#StardateInput.setHours(HourInput)
#StardateInput.setMinutes(MinuteInput)
#StardateInput.setSeconds(0)
#StardateInput.toGMTString(0)
#
#var findMilliseconds = StardateInput.getTime() - StardateOrigin.getTime();
#
#var findStarYear = findMilliseconds / (60 * 60 * 24 * $DAYS_IN_YEAR);
#
#findStarYear = Math.floor(findStarYear * 100);
#findStarYear = findStarYear / 100
#
#form.YourChosenDate.value = StardateInput;
#form.StarDateOutput.value = findStarYear;
#	
#return true; 
#	}
#	
#	
#	
#
#
#
#
#
#
#function CalendarizeThis(form) {
#
#var StardateOrigin = new Date("May 25, 2322 00:00:00");
#
#var StardateIn = eval(document.forms.computeStardate.StardateFromUser.value);
#
#var DateOut = StardateIn * 60 * 60 * 24 * 365.2422 ;
#
#var ResultMilliseconds = StardateOrigin.getTime() + DateOut;
#
#var ResultDate = new Date();
#
#ResultDate.setTime(ResultMilliseconds);
#
#form.YourStardate.value = StardateIn;
#	
#form.ComputeDate.value = ResultDate;
#	
#return true; 
#	}
#
#
#





sub stardate {
}

sub voyager_stardate { tng_stardate(@_); }
sub ds9_stardate { tng_stardate(@_); }

sub pretend_stardate {
}

sub present_stardate {
}

sub tos_stardate {
}



sub _get_time {
	my $time = shift || time;

	unless ($time =~ /^[1-9][0-9]{8,11}$/) {
		eval {
			require Date::Parse;
			$time = Date::Parse::str2time($time);
		};
		croak "Unable to parse date and time '$time': $@" if $@;
	}

	my @rtn = localtime($time);
	$rtn[5] += 1900;
	$rtn[4]++;
	unshift @rtn, $time;

	# $time,$sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst
	return @rtn;
}


1;

=pod

=head1 NAME

Acme::Stardate - Calculate dates in to Stardates

=head1 SYNOPSIS

 use Acme::Stardate;
 
=head1 ABSTRACT

Taken from the official Star Trek homepage, (c)Paramount Pictures:

"As stardates don't really correspond to anything in reality, fans
have taken it upon themselves to come up with their own version
of dating based on the standard calendar."

=head1 DESCRIPTION

This module will convert gregorian calendar dates in to Star Trek
TOS, TNG or "present day" Stardates. These conversions are rough
aproximations since there is no universally agreed method to
calculate Stardates. (See ABSTRACT above).

=head1 VERSION

$Id: Stardate.pm,v 1.2 2006/01/12 21:33:57 nicolaw Exp $

=head1 ACKNOWLEDGEMENTS

L<http://trekguide.com/Stardates.htm>,
L<http://www.startrek.com/startrek/view/help/faqs/faq/672.html>,
L<http://www.hillschmidt.de/gbr/sternenzeit.htm>,
L<http://scifi.about.com/c/ht/00/07/How_Calculate_Stardates0962933668.htm>

=head1 AUTHOR

Nicola Worthington <nicolaw@cpan.org>

L<http://perlgirl.org.uk>

=head1 COPYRIGHT

Copyright 2006 Nicola Worthington.

This software is licensed under The Apache Software License, Version 2.0.

L<http://www.apache.org/licenses/LICENSE-2.0>

=cut



