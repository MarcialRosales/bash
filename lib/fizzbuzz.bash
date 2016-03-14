#!/usr/bin/env bash

fizz() {
  local value
  value="${1:?first argument is required}"

  [ $(( value % 3 )) = 0 ]
}

buzz() {
  local value
  value="${1:?first argument is required}"

  [ $(( value % 5 )) = 0 ]
}
