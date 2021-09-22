#!/bin/bash

BUILD_DIR="/tmp/blockfrost-swift-sdk/.build"
swift build --skip-update --build-tests --build-path $BUILD_DIR

#/Applications/Xcode.app/Contents/Developer/usr/bin/xctest -XCTest blockfrost_tests,blockfrost_tests.AssetsTests,blockfrost_tests.AddressesTests,blockfrost_tests.BlockTests,blockfrost_tests.AccountsTests,blockfrost_tests.TransactionsTests,blockfrost_tests.PoolsTests,blockfrost_tests.NutlinkTests,blockfrost_tests.NetworkTests,blockfrost_tests.MetricsTests,blockfrost_tests.MetadataTests,blockfrost_tests.LedgerTests,blockfrost_tests.HealthTests,blockfrost_tests.EpochsTests,blockfrost_tests.PageLoaderBlocksTests \
#  $BUILD_DIR/debug/BlockfrostSwiftSDKPackageTests.xctest

exec swift test --build-path $BUILD_DIR