#!/bin/bash
#
# Remove out all lines, which are neither code nor comments
#
# Code and comment lines start with white space directly followed by
# hash characters (#).
#
# USAGE:
#
# cat somefile.xpo | xpo2dox.sh
#
# This script is intended to be used as an INPUT_FILTER inside a
# Doxyfile for [Doxygen](https://doxygen.nl)

# 1. Only consider code or comment lines
grep  -E '^\s*#' |

# 2. Remove hash characters at the beginning of a source code line
sed 's/\ *\#//'
