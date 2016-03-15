#!/usr/bin/env bash

is_factor_of() {
  local divident divisor
   divident="${1:?first argument is what we divide}"
   divisor="${2:?second argument is what we divide by}"

   [ $((divident % divisor )) = 0 ]
}

fizzbuzz() {
  local number numbers result
  numbers=($@)

  for number in "${numbers[@]}"
  do
    result=""
    is_factor_of "$number" 3 && result="Fizz"
    is_factor_of "$number" 5 && result="${result}Buzz"
    result="${result:-$number}"

    echo "$result"
  done
}
