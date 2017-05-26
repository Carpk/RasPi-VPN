#!/bin/bash

FOO='foo';

case $FOO in                     # $ variable substitution
	foo) echo "case test passed" ;;
esac

if [[ $FOO=='foo' ]]; then        # [[ ]] test this expression
	echo "if   test passed"
else
	echo "if   test failed"
fi

#echo ls       # prints 'ls'
#echo $(ls)    # prints directory contents

function foobar {
	echo "func test passed"
}
foobar

# need a shell script to find addresses of node, and gateway, 
# and append them to /etc/network/interfaces
echo "all  tests complete"










