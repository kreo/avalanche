#!/bin/sh
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DIR/_build-test-parameter.sh"

( cd "packages/$PACKAGE" && ../../node_modules/node-sass/bin/node-sass --importer ../../node_modules/node-sass-magic-importer/dist/cli.js "test/test.scss" | ../../node_modules/postcss-cli/bin/postcss -u autoprefixer --autoprefixer.browsers "safari >= 4" -o "test/tmp/test.css" )
