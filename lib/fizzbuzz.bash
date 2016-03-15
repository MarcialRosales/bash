#!/usr/bin/env bash

is_factor_of() {
  local divident divisor
   divident="${1:?first argument is what we divide}"
   divisor="${2:?second argument is what we divide by}"

   [ $((divident % divisor )) = 0 ]
}

fizzbuzz() {
  local number numbers
  numbers=($@)

  for number in "${numbers[@]}"
  do
    is_factor_of "$number" 15 && echo "FizzBuzz" && continue
    is_factor_of "$number" 5 && echo "Buzz" && continue
    is_factor_of "$number" 3 && echo "Fizz" && continue
    echo "$number"
  done
}
