#!/usr/bin/env bats

@test "Check for HTTP Status Code 200 on localhost" {
  http_status="$(curl -I -s -L localhost | grep 'HTTP/1.1')"
  [ "$http_status"="HTTP/1.1 200 OK" ]
}

@test "Check for running Jenkins version 1.589 on localhost" {
  jenkins_version="$(curl -I -s -L localhost | grep 'X-Jenkins:')"
  [ "$jenkins_version"="X-Jenkins: 1.589" ]
}
