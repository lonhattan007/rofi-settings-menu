#!/bin/bash

INPUT_SPEC=($(xinput list | rg "AT Translated Set 2 keyboard"))
INPUT_ID=$(echo ${INPUT_SPEC[6]} | sed s/id=//)

xinput float $INPUT_ID
