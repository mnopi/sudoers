#!/usr/bin/env bats

load lib/test_helper

setup() {
  # executed before each test
  # echo "setup" >&3
  :
}

teardown() {
  # executed after each test
  # echo "teardown" >&3
  :
}

@test "status" {
   for func in ${_BATS_LIBS_FUNCS}; do
    run declare -pF "${func}"
    [ "$status" -eq 0 ]
  done
}

@test "assert_success" {
   for func in ${_BATS_LIBS_FUNCS}; do
    run declare -pF "${func}"
    [ "$status" -eq 0 ]

    run declare -pF "${func}"
    run assert_success

    assert declare -pF "${func}"
  done
}

@test "assert" {
   for func in ${_BATS_LIBS_FUNCS}; do
    assert declare -pF "${func}"
  done
}

@test "assert_exist" {
   for dir in ${_BATS_LIBS_DIRS}; do
    assert_exist "${dir}"
  done
}

 @test 'assert_line() looking for line' {
   run echo $'have-0\nhave-1\nhave-2'
   assert_line 'have-1'
 }

@test 'assert_line() partial matching' {
 run echo $'have 1\nhave 2\nhave 3'
 assert_line --partial 'have'
}

@test "assert_line() <expected>: returns 0 if <expected> is a line in \`\${lines[@]}'" {
  run printf 'a\nb\nc'
  assert_line --index 1 'b'
}

@test 'assert_line() --regexp <regexp>: enables regular expression matching' {
  run printf 'a\n_b_\nc'
  assert_line --regexp '^_'
}
