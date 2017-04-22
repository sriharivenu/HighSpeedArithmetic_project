#!/usr/local/bin/perl
use strict;
use warnings;
use POSIX;
# code to generate wallace verilog code for any size.

#Let n be the number of bits of input;

my $n = 16;
my $columns = 2*$n; #The total umber of columns

#using hash for maintaing the matrix in terms of columns
my %next_cry = ();
my %mat = ();
my $height = 0;
my $n_var = 2;
my $temp = 0;
while( $n_var < $n){
	$temp = floor($n_var * 1.5);
	$height = $height + 1;
	$n_var = $temp;
	#print "n_var = $temp\n";
}

$n_var = ceil($n_var/1.5);
#opening file to save the output in it

open(my $file, '>', 'dadda16.v');

#making of n*n matrix i.e. dot product
print $file " /************************** AND gate DOT PRODUCT matrix ********************************/ \n";
my $rr = 0;
my $l = 0;
for( my $i1 = 0; $i1 < $n; $i1 = $i1 +1) {
	for(my $j1 = $i1; $j1 < $n + $i1; $j1 = $j1 + 1){
		$l = $j1 - $i1;	
		print $file "	wire P_$i1\_$l;\n";
		print $file "	and A\_$i1\_$l(P_$i1\_$l, a[$i1], b[$l]);\n";
		$mat{$rr}{$i1}{$j1} = "P_$i1\_$l";		
	}
}

my $level = 0;
my $counter = 0;
my $row = 0;
my $carry_next_mat = 0;
my $ha = 0;
my $fa = 0;
my $k = 0; #maintains the next carry index
my $not_ex = 0;
for(my $lev = 0; $lev < $height; $lev = $lev + 1){
	print $file " /************************** Height - $lev ********************************/ \n";
	#print "### Height $lev ###\n";
	$row = 0;
	$level = 0;
	for(my $j2 = 0; $j2 < 2*$n; $j2 = $j2 + 1){
			$counter = 0;
			$not_ex = 0;
			$ha = 0;
			$fa = 0;
			$k = 0;
			$row = 0;	
			my $i2 = 0;
			for($i2 = 0; $i2 < $n; $i2 =$i2 + 1){
				if(exists $mat{$lev}{$i2}{$j2}){
					$counter = $counter + 1;
					
				}
				#print"lev: $lev, col: $j2\n";
			}
			#print "n_var = $n_var\n";
			#print "Counter before = $counter \n";			
			#print "Carry next = $carry_next_mat \n";
			$counter = $counter + $carry_next_mat;
			if($n_var >= $counter){
				#print"Enterred!!\n";
				$not_ex = 0;
				for($i2 = 0; $i2 < $n; $i2 =$i2 + 1){
				if(exists $mat{$lev}{$i2}{$j2}){
					#print "i2 = $i2 and not_ex = $not_ex\n";
					$mat{$lev + 1}{$i2 - $not_ex}{$j2} = $mat{$lev}{$i2}{$j2};
					#print "Added: $mat{$lev + 1}{$i2 - $not_ex}{$j2} to lev: ($lev+1), row: $i2-$not_ex, col: $j2\n";					
					}
				else {
					$not_ex = $not_ex + 1;
					}
			
				}
				$row = $row + $i2 - $not_ex;
				if($carry_next_mat > 0){
					for ($i2 = 0; $i2 < $carry_next_mat; $i2 = $i2 + 1){
					#print"carry: $carry_next_mat\n";
					#print"For loop next carry\n";
					if(exists $next_cry{$lev}{$j2}{$i2}){
						#print "Value: $next_cry{$lev}{$j2}{$i2}\n";
						$mat{$lev + 1}{$row}{$j2} = $next_cry{$lev}{$j2}{$i2};
						#print "Added: $mat{$lev + 1}{$row}{$j2} to lev: ($lev+1), row: $row, col: $j2\n";
						$row = $row + 1;
					}
				    }		
				}
				$carry_next_mat = 0;
			}
			else{
				#print "Counter = $counter \n";
				
				for ($i2 = 0; $i2 < $carry_next_mat; $i2 = $i2 + 1){
					#print"carry: $carry_next_mat\n";
					#print"For loop next carry\n";
					if(exists $next_cry{$lev}{$j2}{$i2}){
						#print "Value: $next_cry{$lev}{$j2}{$i2}\n";
						$mat{$lev + 1}{$row}{$j2} = $next_cry{$lev}{$j2}{$i2};
						$row = $row + 1;
					}
				}
				$carry_next_mat = 0;
				$i2 = 0;
				while($counter > $n_var){
					#print"While loop \n";
					if($counter - $n_var == 1){
						$ha = $ha + 1;
						while(not (exists $mat{$lev}{$i2}{$j2}) and ($i2 < $n)) {
							#print "Here !!! \n";
							$i2 = $i2 + 1;
						}
						#print "Enterred!!!\n";
						#print"HA: $j2 : $counter - $n_var\n";
						print $file "	wire S_$lev\_$i2\_$j2;\n";
						print $file "	wire C_$lev\_$i2\_$j2;\n";
						print $file "	halfAdder HA_$lev\_$i2\_$j2(S_$lev\_$i2\_$j2, C_$lev\_$i2\_$j2, $mat{$lev}{$i2}{$j2}, $mat{$lev}{$i2+1}{$j2});\n";
						$mat{$lev + 1}{$row}{$j2} = "S_$lev\_$i2\_$j2";
						$next_cry{$lev}{$j2 + 1}{$k} = "C_$lev\_$i2\_$j2";
						$k = $k + 1;
						$i2 = $i2 + 2;
						$carry_next_mat = $carry_next_mat + 1;
						$counter = $counter - 1; 
						$row = $row + 1;
					}
					else{
						$fa = $fa + 1;
						while(not (exists $mat{$lev}{$i2}{$j2}) and ($i2 < $n) ) {
							#print "Here 1 !!!\n";
							$i2 = $i2 + 1;
						}
						#print"FA: $j2 : $counter - $n_var\n";	
						print $file "	wire S_$lev\_$i2\_$j2;\n";
						print $file "	wire C_$lev\_$i2\_$j2;\n";
						print $file "	fullAdder FA_$lev\_$i2\_$j2(S_$lev\_$i2\_$j2, C_$lev\_$i2\_$j2, $mat{$lev}{$i2}{$j2},  $mat{$lev}{$i2+1}{$j2}, $mat{$lev}{$i2+2}{$j2});\n";
						$mat{$lev + 1}{$row}{$j2} = "S_$lev\_$i2\_$j2";
						$next_cry{$lev}{$j2 + 1}{$k} = "C_$lev\_$i2\_$j2";
						$k = $k + 1;
						$i2 = $i2 + 3;
						$carry_next_mat = $carry_next_mat + 1;
						$counter = $counter - 2; 
						$row = $row + 1;
						#print"Fa: Carry next: $carry_next_mat\n";
					}
				}
				for(; $i2 < $n; $i2 = $i2 +1){
					#print"Loop last\n";
					if(exists $mat{$lev}{$i2}{$j2}){
						$mat{$lev + 1}{$row}{$j2} = $mat{$lev}{$i2}{$j2};
						$row = $row + 1;				
					}
				}
				

			}
	}
	$n_var = ceil($n_var/1.5);
}
print "Finished !!!\n";

## Can be extended if CPA is completed!!!!



