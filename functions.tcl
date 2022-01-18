proc align { A B } {
    set trans_fit [measure fit $A $B]    
    return $trans_fit
} 

proc distance { A B } {
    set sub [vecsub [measure center $A] [measure center $B]]
    set mag [veclength $sub]
    return $mag
}

proc RMSD { compare reference } {
    set RMSD [measure rmsd $compare $reference]
    return $RMSD
}

