#!/usr/local/bin/perl
use strict;
use warnings;
# code to generate wallace verilog code for any size.

#Let n be the number of bits of input;

my $n = 16;
my $columns = 2*$n; #The total umber of columns

#using hash for maintaing the matrix in terms of columns

my %mat = ();
my $height = 0;
my $n_var = $n;
my $temp = 0;
while( $n_var >2){
	$temp = int($n_var / 3)*2 + int($n_var % 3);
	$height = $height + 1;
	$n_var = $temp;
	#print "n_var = $temp\n";
}
#opening file to save the output in it

open(my $file, '>', 'wallace.v');

#making of n*n matrix i.e. dot product
print $file " /************************** AND gate DOT PRODUCT matrix ********************************/ \n";
$n_var = 0;
my $l = 0;
for( my $i1 = 0; $i1 < $n; $i1 = $i1 +1) {
	for(my $j1 = $i1; $j1 < $n + $i1; $j1 = $j1 + 1){
		$l = $j1 - $i1;	
		print $file "And A$i1$l(P$i1$l, a[$i1], b[$l]);\n";
		$mat{$n_var}{$i1}{$j1} = "P$i1$l";		
	}
}

my $level = 0;
my $counter = 0;
my $row = 0;
my $lay = 0;
$lay = $n;
my $cnt = 0;

for(my $lev = 0; $lev < $height; $lev = $lev + 1){
	print $file " /************************** Height - $lev ********************************/ \n";
	$row = 0;
	$level = 0;
	$cnt = 2*(int($lay/3)) + int($lay%3);
	for(my $max_3 = 0; $max_3 < $lay; $max_3 = $max_3 + 3){
		print $file " /************************** Layer - $max_3 ********************************/ \n";
		$level = $level + 1;
		$counter = 0;
		for(my $j2 = 0; $j2 < 2*$n; $j2 = $j2 + 1){
			$counter = 0;
			my $i2 = 0;
			for($i2 = $max_3; $i2 < $max_3 + 3; $i2 =$i2 + 1){
				if(exists $mat{$lev}{$i2}{$j2}){
					$counter = $counter + 1;
				}
			}
			$i2 = $max_3;
			if($counter == 3){
				#print "$j2 $i2 $lev $row $level \n";
				print $file "wire S$lev$level$i2$j2;\n";
				print $file "wire C$lev$level$i2$j2;\n";
				print $file "FullAdder FA$lev$level$i2$j2(S$lev$level$i2$j2, C$lev$level$i2$j2, $mat{$lev}{$max_3}{$j2}, $mat{$lev}{$max_3 + 1}{$j2}, $mat{$lev}{$max_3+ 2}{$j2});\n"; 
				
				$mat{$lev + 1}{$row}{$j2} = "S$lev$level$i2$j2";
				$mat{$lev + 1}{$row + 1}{$j2 + 1} = "C$lev$level$i2$j2";
			}
			elsif($counter == 2){
				if(exists $mat{$lev}{$max_3}{$j2}){
					if(exists $mat{$lev}{$max_3+1}{$j2}){
						print $file "wire S$lev$level$i2$j2;\n";
						print $file "wire C$lev$level$i2$j2;\n";
						print $file "HalfAdder HA$lev$level$i2$j2(S$lev$level$i2$j2, C$lev$level$i2$j2, $mat{$lev}{$max_3}{$j2}, $mat{$lev}{$max_3 + 1}{$j2});\n";
						$mat{$lev + 1}{$row}{$j2} = "S$lev$level$i2$j2";
						$mat{$lev + 1}{$row + 1}{$j2 + 1} = "C$lev$level$i2$j2";
					}
					else {
						print $file "wire S$lev$level$i2$j2;\n";
						print $file "wire C$lev$level$i2$j2;\n";
						print $file "HalfAdder HA$lev$level$i2$j2(S$lev$level$i2$j2, C$lev$level$i2$j2, $mat{$lev}{$max_3}{$j2}, $mat{$lev}{$max_3 + 2}{$j2});\n";
						$mat{$lev + 1}{$row}{$j2} = "S$lev$level$i2$j2";
						$mat{$lev + 1}{$row + 1}{$j2 + 1} = "C$lev$level$i2$j2";						
					}			
				}
				else{
					print $file "wire S$lev$level$i2$j2;\n";
					print $file "wire C$lev$level$i2$j2;\n";
					print $file "HalfAdder HA$lev$level$i2$j2(S$lev$level$i2$j2, C$lev$level$i2$j2, $mat{$lev}{$max_3+1}{$j2}, $mat{$lev}{$max_3 + 2}{$j2});\n";
					$mat{$lev + 1}{$row}{$j2} = "S$lev$level$i2$j2";
					$mat{$lev + 1}{$row + 1}{$j2 + 1} = "C$lev$level$i2$j2";
				}
			}
			elsif($counter == 1){
				$i2 = $max_3;
				while((not (exists $mat{$lev}{$i2}{$j2})) and ($i2 < $max_3 + 3)) {
					$i2 = $i2 + 1;
				}
				#print"single value: $mat{$lev}{$i2}{$j2}\n";
				$mat{$lev + 1}{$row}{$j2} = $mat{$lev}{$i2}{$j2};
				#print"Stored in: $row, $j2\n";			
			}
			
		}
	$row = $row + 2;	
	}
	$lay = $cnt;
}
print "Finished !!!\n";

## Can be extended if CPA is completed!!!!



