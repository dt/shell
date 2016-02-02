function b() { go test -run - -count 10 -bench $1 $2 2>/dev/null | tee $3; }
function b5() { go test -run - -count 5 -bench $1 $2 2>/dev/null | tee $3; }
function b3() { go test -run - -count 3 -bench $1 $2 2>/dev/null | tee $3; }
