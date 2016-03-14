#!/usr/bin/env bash

is_factor_of() {
  local divident divisor
   divident="${1:?first argument is what we divide}"
   divisor="${2:?second argument is what we divide by}"

   [ $((divident % divisor )) = 0 ]
}

fizzbuzz() {
  local numbers
  numbers=($@)

  for _ in "${numbers[@]}"
  do
    echo "Fizz"
  done
}
