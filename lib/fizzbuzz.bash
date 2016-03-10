#!/usr/bin/env bash

fizz() {
  local value
  value="${1:?first argument is required}"

  [ $(( value % 3 )) = 0 ]
}
