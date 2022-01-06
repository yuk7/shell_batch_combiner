#!/bin/bash

# Copyright (c) 2022 yuk7 <yukx00@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php


if [ $# -ne 3 ]; then
  echo "how to use" 1>&2
  echo "./combine.sh [windows batch(CRLF)] [shell script(LF)] [combined file(out-mixed)]" 1>&2
  exit 1
fi

WINDOWS_SOURCE="$1"
LINUX_SOURCE="$2"

DEST_FILE="$3"


CR=$(printf '\r')
echo ":<<___FUNC_BATCH___ $CR" > "$DEST_FILE"
cat "$WINDOWS_SOURCE" >> "$DEST_FILE"
echo "exit /b$CR" >> "$DEST_FILE"
echo "" >> "$DEST_FILE"
echo "___FUNC_BATCH___" >> "$DEST_FILE"
echo >> "$DEST_FILE"
cat "$LINUX_SOURCE" >> "$DEST_FILE"