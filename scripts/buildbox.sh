#!/bin/bash
set -e

# google-chrome --version

echo '--- bundling'
bundle

echo '--- running specs'
./bin/rspec