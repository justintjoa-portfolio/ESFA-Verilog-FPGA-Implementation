#!/usr/bin/env bash

set -e

echo "=== 1. Checking ESFA RTL ==="

verilator \
    --lint-only \
    -Wall \
    -Wno-fatal \
    -Isrc/include \
    -f filelists/Core.f

echo "RTL core compile check passed."


TESTS=(
    NodeCombinator_tb
    MemoryCell_tb
)

FAILED_TESTS=()

for test in "${TESTS[@]}"; do

    echo
    echo "=== Building $test ==="

    rm -rf "build/verilator/$test"
    mkdir -p "build/verilator/$test"

    if ! verilator \
        --binary \
        --timing \
        --assert \
        -Wall \
        -Wno-fatal \
        -Isrc/include \
        -f filelists/Core.f \
        -f filelists/Tests.f \
        --top-module "$test" \
        --Mdir "build/verilator/$test"
    then
        echo "❌ $test BUILD FAILED"
        FAILED_TESTS+=("$test (build)")
        continue
    fi

    echo
    echo "=== Running $test ==="

    if "./build/verilator/$test/V$test"; then
        echo "✅ $test PASSED"
    else
        echo "❌ $test FAILED"
        FAILED_TESTS+=("$test")
    fi

done


echo
echo "=============================="

if [ ${#FAILED_TESTS[@]} -eq 0 ]; then
    echo "✅ ALL TESTS PASSED"
    exit 0
else
    echo "❌ TEST FAILURES:"
    for test in "${FAILED_TESTS[@]}"; do
        echo "   - $test"
    done

    exit 1
fi