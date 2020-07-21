open FILE, $ARGV[0] or die "i cant see the raw sequences file \n";

while ($line=<FILE>){
if ($line=~/>fig:/){
        $line=~/(>|fig\:)(\d+\.\d+)(\.peg\.\d+)/;
        $original="$line";
        $rastname="$2";
        $peg="$3";
        $peg=~s/\.//g;
        open RASTID, $ARGV[1] or die "i cant see the RAST.IDs file \n";
        while ($id=<RASTID>){
                if ($id=~/$rastname/){
                $id=~/(.+)\t(.+)\t(.+)\t(.+)/;
                $names="$3";
                $names=~s/\-//g;
                $names=~s/\;//g;
                $names=~s/\(//g;
                $names=~s/\)//g;
                $names=~s/\'//g;
                $names=~s/\=//g;
                $names=~s/\.1//g;
                $names=~s/\.2//g;
                $names=~s/ATCC /ATCC/g;
                $names=~s/NRRL /NRRL/g;
                $names=~s/NBRC /NBRC/g;
                $names=~s/DSM /DSM/g;
                $names=~s/subsp //g;
                $names=~s/strain //g;
                $names=~s/\s+/\_/g;
                print ">$names\_$peg\n";
                }
        }
}
else {print $line;}
}
