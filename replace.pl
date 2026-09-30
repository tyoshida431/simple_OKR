#!/usr/bin/perl

open INFILE, '<', $ARGV[0];
while($line=<INFILE>){
  if(!($line =~ /KR/) && $line =~ /([0-9.]+)(?=%)/){
      my $num_str=$1;
      my $number=int($num_str);
      if(0<=$number && $number<=30){
          $line =~ s/([0-9.]+%)/<span class=ju>$num_str<\/span>%/g;
      }elsif(30<=$number && $number<50){
          $line =~ s/([0-9.]+%)/<span class=niju>$num_str<\/span>%/g;        
      }elsif(50<=$number && $number<=70){
          $line =~ s/([0-9.]+%)/<span class=sanju>$num_str<\/span>%/g;
      }elsif(70<=$number && $number<100){
          $line =~ s/([0-9.]+%)/<span class=yonju>$num_str<\/span>%/g;        
      }else{
          $line =~ s/([0-9.]+%)/<span class=goju>$num_str<\/span>%/g;        
      }
  }
  print $line;
}
close(INFILE);
