#!/bin/bash
sd '../../public/' '../public/' *.md
git add .
sd '../public/' '../../public/' *.md
