set all [atomselect 1 "all"]
set sel [atomselect 1 "protein and noh"]
set ref [atomselect 0 "protein and noh"]

set e1 [atomselect 1 "resid 2 and name CAY"]
set e2 [atomselect 1 "resid 4 and name CAT"]

set n [molinfo 1 get numframes]

for { set i 0 } { $i < $n } { incr i } {

    $all frame $i
    $sel frame $i
    $e1 frame $i
    $e2 frame $i

    $all move [align $sel $ref]
    set dist [distance $e1 $e2]

    set phi1 [measure dihed { 4 6 8 14 } frame $i]
    set phi2 [measure dihed { 14 16 18 34 } frame $i]
    set phi3 [measure dihed { 34 36 38 44 } frame $i]
    set psi1 [measure dihed { 6 8 14 16 } frame $i]
    set psi2 [measure dihed { 16 18 24 36 } frame $i]
    set psi3 [measure dihed { 36 38 44 46 } frame $i]

    puts stderr "$i $dist $phi1 $psi1 $phi2 $psi2 $phi3 $psi3"
}

quit

