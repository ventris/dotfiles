#!/usr/bin/env bash

set -e
set -o pipefail

echo "Applying MacOS settings"





# Show the ~/Library folder
sudo chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes
