#!/bin/bash
set -ex
# Export tests
mkdir -p $BITRISE_TEST_RESULT_DIR
find . -type d -path "*reports/merged*" | while read -r test_run_dir; do
    cp -R "$test_run_dir" "$BITRISE_TEST_RESULT_DIR/"
    echo "{\"test-name\":\"$(basename $test_run_dir)\"}" >> "$BITRISE_TEST_RESULT_DIR/$(basename $test_run_dir)/test-info.json"
done