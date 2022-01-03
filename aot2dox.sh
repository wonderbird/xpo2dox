#!/bin/bash
#
# Convert all AX XPO files of an AOT export to files which contain only code.
#
# The converted files will be stored in a tree which is similar to
# the source tree. Files will be named *.xpo
#
# To check the progress, you can use the watch command and compare the number of
# files in source and target:
#
# watch -n 5 'find ../igus/ax40 -type f | wc -l; find ./ax40 -type f | wc -l'
#
# Usage:
# ./aot2dox.sh SOURCE TARGET
#
#    SOURCE    Directory containing a checkout of our AX40 AOT
#
#    TARGET    Name of a directory to receive the code-only XPO files.
#              This directory will be erased at the beginning of the script.
#              It will be recreated from scratch then.
#
# TODO ensure that the target folder can be specified. At the moment ax40 is hard coded.
# TODO error checking
#
SOURCE_DIR="$1"
TARGET_DIR="./ax40"

OLD_IFS=$IFS
IFS=$'\n'

rm -rf "$TARGET_DIR"

echo "Create target directory tree ..."
for DIR in `find "$SOURCE_DIR" \( -type d ! -path "*/.git/*" ! -path "*/.git" ! -path "*/.vscode/*" ! -path "*/.vscode" ! -path "*/Application Developer Documentation/*" ! -path "*/Application Developer Documentation" ! -path "*/Application Documentation/*" ! -path "*/Application Documentation" ! -path "*/System Documentation/*" ! -path "*/System Documentation" \)`; do
    if [[ ! "$DIR" =~ "$EXCLUDE_DIR_REGEX" ]]; then 
        TARGET_SUBDIR=`echo "$DIR" | sed "s-${SOURCE_DIR}/*--"`
        mkdir -p "$TARGET_DIR/$TARGET_SUBDIR"
    fi
done

echo "Extract code from XPO files ..."
for FILE in `find "$SOURCE_DIR" \( -type f -iname "*.xpo" ! -path "*/.git/*" ! -path "*/.git" ! -path "*/.vscode/*" ! -path "*/.vscode" ! -path "*/Application Developer Documentation/*" ! -path "*/Application Developer Documentation" ! -path "*/Application Documentation/*" ! -path "*/Application Documentation" ! -path "*/System Documentation/*" ! -path "*/System Documentation" \)`; do
    TARGET=`echo "$FILE" | sed "s-${SOURCE_DIR}/*-${TARGET_DIR}/-"`
    cat "$FILE" | ./xpo2code.sh > "$TARGET"
done
IFS=$OLD_IFS
