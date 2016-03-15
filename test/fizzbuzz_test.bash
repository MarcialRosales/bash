#!/usr/bin/env bash

# basht macro, shellcheck fix
export T_fail

# shellcheck disable=SC1091
. test/test_helpers

# shellcheck disable=SC1091
. lib/fizzbuzz.bash

T_fizzbuzz_GivenASeriesOfNumbersAsParameters() {
  local actual expected
  actual="$(fizzbuzz {3..15})"
  expected="Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz"

  expect_to_equal "$actual" "$expected" ||
  $T_fail
}

T_fizz_ReturnsFizzWhenDivisibleBy3() {
  expect_to_equal "$(fizz 15)" "Fizz" ||
  $T_fail
}

T_buzz_ReturnsBuzzWhenDivisibleBy5() {
  expect_to_equal "$(buzz 15)" "Buzz" ||
  $T_fail
}

T_is_factor_of_TrueWhenDividesEqually() {
  is_factor_of 3 3 ||
  $T_fail "Expected to be true when it divides equally"
}

T_is_factor_of_FalseWhenDoesNotDivideEqually() {
  ! is_factor_of 3 5 ||
  $T_fail "Expected to be false when it does not divide equally"
}
