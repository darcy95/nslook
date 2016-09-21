# -----------------------------------------------------------
# -- 	Module : Bin	
# -----------------------------------------------------------
package M_Bin;

# use strict;
use Exporter;

@ISA = ('Exporter');
@EXPORT = ('printbits','printbit','setBit','getBit','isSet','resetBit','isReset','toggle','toggleByte','asArray','setRange','getRange','setByte');

sub printbits
{
	my $value = shift;
	my $numBits = shift;
	$numBits = ($numBits) ? $numBits : 16;

	for (my $i = ($numBits - 1) ; $i >= 0 ; $i--)
	{
		&printbit($value, $i);

		if (($i % 8) eq 0)
		{
			print " ";
		}
	}

	print "\n";
}

sub printbit
{
       my $value = shift;
       my $bit   = shift;

       print &getBit($value, $bit);
}

sub setBit
{
        my $value = shift;
        my $bit   = shift;

        return ($value | (1 << $bit));
}

sub getBit
{
	my $value = shift;
	my $bit   = shift;

	return ($value & (1 << $bit)) >> $bit;
}

sub isSet
{
	my $value = shift;
	my $bit   = shift;

	return (getBit($value, $bit) eq 1) ? 1 : 0;
}

sub resetBit
{
	my $value = shift;
	my $bit   = shift;
	
	return $value & (~(1 << $bit));
}

sub isReset
{
	my $value = shift;
	my $bit   = shift;
	
	return (getBit($value, $bit) eq 0) ? 1 : 0;
}

sub toggle
{
	my $value = shift;
	my $bit   = shift;

	return (&getBit($value, $bit) eq 0) ? &setBit($value, $bit) : &resetBit($value, $bit);
}

sub toggleByte
{
	my $value = shift;
	my $byteIndex = shift;
	my $startBit = $byteIndex * 8;
	my $endBit = $startBit + 8;

	for (my $i = $startBit ; $i < $endBit ; $i++)
	{
		$value = (&getBit($value, $i) eq 1) ? &resetBit($value, $i) : &setBit($value, $i);
	}

	return $value;
}

sub asArray
{
	my $value = shift;
	my $bit   = shift;
	my $numBits = shift;

	my @bits;

	for (my $i = 0 ; $i < $numBits ; $i++)
	{
		$bits[$i] = &getBit($value, $bit);
	}

	return @bits;
}

sub setRange
{
	my $value = shift;
	my $valueToCombine = shift;
	my $startBit = shift;
	my $countBit = shift;

	my $returnValue = $value;

	for (my $i = $startBit, my $j = 0 ; $j < $countBit ; $i++, $j++)
	{
		$returnValue = (&getBit($valueToCombine, $j) eq 1) ? &setBit($returnValue, $i) : &resetBit($returnValue, $i);
	}

	return $returnValue;
}

sub getRange
{
	my $value = shift;
	my $startBit = shift;
	my $countBit = shift;

	my $returnValue = 0;

	for (my $i = $startBit, my $j = 0; $j < $countBit ; $i++, $j++)
	{
		$returnValue += (&getBit($value, $i) * (2 ** $j)); 
	}

	return $returnValue;
}

sub setByte
{
	my $value = shift;
	# ------------------------------------------------------------------
	# -- $byteIndex
	# -- * Index number of the byte
	# -- * Ex) Assume that we're using 4bytes(32bits)
	# --		32222222 22221111 111111
	# --		10987654 32109876 54321098 76543210 : Bit index
	# -- 		10101000 11100110 01000010 10011010 : Bits
	# --		10101000                            : Byte index (3)
	# --                     11100110                   : Byte index (2)
	# --                              01000010          : Byte index (1)
	# --                                       10011010 : Byte index (0)
	# ------------------------------------------------------------------
	my $byteIndex = shift;
	my $byte  = shift; # the byte to be set

	return &setRange($value, $byte, ($byteIndex * 8), 8);
}

1;
