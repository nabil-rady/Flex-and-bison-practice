#!/usr/bin/env bash

flex lex.l && gcc lex.yy.c -o main && ./main

