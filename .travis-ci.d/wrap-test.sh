#!/bin/bash

# Alternative to `travis_wait` that does not buffer program output until the
# bitter end.
#
# cf. https://stackoverflow.com/a/51843846/84349

./.travis-ci.d/run-test.sh &
pid=$!

# Constants
RED='\033[0;31m'
minutes=0
limit=60

while kill -0 $pid >/dev/null 2>&1; do
  echo -n -e " \b" # never leave evidences!

  if [ $minutes == $limit ]; then
    echo -e "\n"
    echo -e "${RED}Test has reached a ${minutes} minutes timeout limit"
    exit 1
  fi

  minutes=$((minutes+1))

  sleep 60
done

wait $pid
exit $?
