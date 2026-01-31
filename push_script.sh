#!/bin/bash

read -p "Add commit comment: " comment
rm -rf public/
hugo --gc --minify

git add .
git commit -m "$comment"
git push origin main
