# -----------------------------------------------------------
# --    Module : Ansi
# -----------------------------------------------------------
package M_Ansi;

use Exporter;

@ISA = ('Exporter');
@EXPORT = ('ANSI_BLACK','ANSI_RED','ANSI_LIME','ANSI_BROWN','ANSI_BLUE','ANSI_PURPLE','ANSI_LTBLUE','ANSI_GRAY','ANSI_WHITE','cls','setCursor','remLine','drawText');

use constant ANSI_BLACK  => 0;
use constant ANSI_RED    => 1;
use constant ANSI_LIME   => 2;
use constant ANSI_BROWN  => 3;
use constant ANSI_BLUE   => 4;
use constant ANSI_PURPLE => 5;
use constant ANSI_LTBLUE => 6;
use constant ANSI_GRAY   => 7;
use constant ANSI_WHITE  => 8;

# -----------------------------------------------------------
# -- cls
# -----------------------------------------------------------
sub cls
{
	print "\033[2J";
}

# -----------------------------------------------------------
# -- setCursor
# -----------------------------------------------------------
sub setCursor
{
	my($x, $y) = @_;
	print "\033[". $y . ";" . $x . "H";
}

# -----------------------------------------------------------
# -- remLine
# -----------------------------------------------------------
sub remLine
{
	my($line) = @_;
	print "\033[" . $line . ";1H\033[K";
}

# -----------------------------------------------------------
# -- drawText
# -----------------------------------------------------------
sub drawText
{
	my($color, $bgcolor, $text) = @_;
	print "\033[4" . $bgcolor . ";3" . $color . "m" . $text . "\033[0m";
}

TRUE;
