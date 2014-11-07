#!/usr/bin/env bats

@test "htop binary is found in PATH" {
  run which htop
  [ $status -eq 0 ]
}
