#!/usr/bin/env bash

fizzbuzz() {
  local number numbers result
  numbers=($@)

  for number in "${numbers[@]}"
  do
    result="$(fizz "$number")$(buzz "$number")"
    echo "${result:-$number}"
  done
}

fizz() {
  is_factor_of "$1" 3 && echo "Fizz"
}

buzz() {
  is_factor_of "$1" 5 && echo "Buzz"
}

is_factor_of() {
  [ $(($1 % $2)) = 0 ]
}
