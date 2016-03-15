#!/usr/bin/env bash

# basht macro, shellcheck fix
export T_fail

# shellcheck disable=SC1091
. test/test_helpers

# shellcheck disable=SC1091
. lib/fizzbuzz.bash

T_is_factor_of_TrueWhenDividesEqually() {
  is_factor_of 3 3 ||
  $T_fail "Expected to be true when it divides equally"
}

T_is_factor_of_FalseWhenDoesNotDivideEqually() {
  ! is_factor_of 3 5 ||
  $T_fail "Expected to be false when it does not divide equally"
}

T_is_factor_of_FailsWhenNoFirstArgument() {
  expect_to_contain "$(is_factor_of 2>&1)" "first argument is what we divide" ||
  $T_fail
}

T_is_factor_of_FailsWhenNoSecondArgument() {
  expect_to_contain "$(is_factor_of 1 2>&1)" "second argument is what we divide by" ||
  $T_fail
}

T_fizzbuzz_ReturnsFizzForNumbersDivisibleBy3() {
  local actual expected
  actual="$(fizzbuzz 3 12 102)"
  expected="Fizz
Fizz
Fizz"

  expect_to_equal "$actual" "$expected" ||
  $T_fail
}

T_fizzbuzz_ReturnsBuzzForNumbersDivisibleBy5() {
  local actual expected
  actual="$(fizzbuzz 5 20 100)"
  expected="Buzz
Buzz
Buzz"

  expect_to_equal "$actual" "$expected" ||
  $T_fail
}

T_fizzbuzz_ReturnsFizzBuzzForNumbersDivisibleBy15() {
  local actual expected
  actual="$(fizzbuzz 15 105)"
  expected="FizzBuzz
FizzBuzz"

  expect_to_equal "$actual" "$expected" ||
  $T_fail
}

T_fizzbuzz_ReturnsNumberIfNotDivisibleByKnownNumbers() {
  local actual expected
  actual="$(fizzbuzz 1 11)"
  expected="1
11"

  expect_to_equal "$actual" "$expected" ||
  $T_fail
}
