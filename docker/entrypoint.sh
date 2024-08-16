#!/bin/sh
PROJECT_DIR=$1
SUSHI_CONFIG=$PROJECT_DIR/sushi-config.yaml
VAL_JAR=/root/validator_cli.jar
VERSION="-version 4.0"
GEN_DIR=$PROJECT_DIR/fsh-generated/resources
OUTPUT="-html-output $PROJECT_DIR/validation.html"

IGS=$(sed ':a;N;$!ba;s/\([a-zA-Z\-]\+:\s\+[a-z0-9\.\:\/\-]\+\n\)*dependencies:\(\(\n\s\+[a-z0-9\.]\+:\s\+[0-9a-z\.]\+\)\+\)\(\n[a-zA-Z\-]\+:\s\+[a-z0-9\.\:\/\-]\+\)*/\2/g;s/\n\s\+/\n/g;s/^\n//g;s/\([a-z0-9\.]\+\):\s\+\([0-9a-z\-\.]\+\)\n\?/ -ig \1#\2/g' $SUSHI_CONFIG)
OWN_IG="-ig $GEN_DIR"

java -jar $VAL_JAR $VERSION $IGS $OWN_IG $GEN_DIR $OUTPUT
