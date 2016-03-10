#!/usr/bin/env bash

# basht macro, shellcheck fix
export T_fail

# shellcheck disable=SC1091
. test/test_helpers

# shellcheck disable=SC1091
. lib/fizzbuzz.bash

T_fizz_TrueWhen3() {
  fizz 3 ||
  $T_fail "Expected to be true when 3"
}
