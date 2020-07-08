
testagainst(){
    soln=$1
    naive=$2
    input=$3
    count=$4
    #is there a log data file 
    if [[ -f log ]]; then
        > log
    else
        touch log
    fi
    
    #generate input

    #run each line in the test data against both the naive and soln 
    counter=1
    while [ $counter -le $count ];
    do
        data=$(python3 $input)
        echo "test data: $data" >> log
        naiveres=$(echo $data | python3 $naive)
        solres=$(echo $data | python3 $soln) 
        if [[ $naiveres == $solres ]]; then
            echo "OK - result => $solres" >> log
        else
            echo "TEST FAILED" >> log
            echo "naive result: $naiveres" >> log
            echo "solution result: $solres" >> log
        fi
        ((counter++))
    done

}