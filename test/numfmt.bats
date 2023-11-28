#!/usr/bin/env bats

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" &> /dev/null && pwd )"
  COMMAND="awk -f $DIR/../libexec/numfmt.awk"
}

run_numbers_format() {
  run $COMMAND -v div=$1 <<EOF
0
1000
1024
1026
1000000
1048576
1000000000
1073741824
1000000000000
1099511627776
EOF
}

@test "IEC formatting" {
  run_numbers_format 1024

  assert_success
  assert_output - <<EOF
0.00B
1000.00B
1.00K
1.00K
976.56K
1.00M
953.67M
1.00G
931.32G
1.00T
EOF
}

@test "SI formatting" {
  run_numbers_format 1000

  assert_success
  assert_output - <<EOF
0.00B
1.00K
1.02K
1.03K
1.00M
1.05M
1.00G
1.07G
1.00T
1.10T
EOF
}

@test "single value format" {
  run $COMMAND -v div=1024 <<< 1024

  assert_success
  assert_output "1.00K"    
}

@test "two values in row" {
  run $COMMAND -v div=1024 <<< '1024 50'

  assert_success
  assert_output "1.00K 50.00B"    
}

@test "three values in two rows" {
  run $COMMAND -v div=1024 <<EOF
1024 50
2048
EOF

  assert_success
  assert_output - <<EOF
1.00K 50.00B
2.00K
EOF
}

@test "mixed values input" {
  run $COMMAND -v div=1024 <<EOF
a 1024 b 2048 c
1024 a 2048 b 4096
EOF

  assert_success
  assert_output - <<EOF
a 1.00K b 2.00K c
1.00K a 2.00K b 4.00K
EOF
}