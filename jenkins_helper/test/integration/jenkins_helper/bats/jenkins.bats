#!/usr/bin/env bats

@test "Jenkins is running" {
  run /etc/init.d/jenkins status
  [ $status -eq 0 ]
  [[ $output =~ [j|J]enkins.*running ]]
}
