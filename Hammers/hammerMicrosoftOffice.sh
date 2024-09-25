#!/bin/bash

targets=""

aim() {
  echo "Enter a key term:"
  read aim
  targets="$(locate $aim)"
}

confirmTargets() {
  echo "Targets:"

  i=0
  echo "$targets" |
  while IFS=$(echo -en "\n\b") read -r line; do
    ((i++))
    echo "$i: $line"
  done

  echo "Execute targets? [y|n]"
  read confirm
  if [[ $confirm != [Yy] ]]; then
    echo "Disengaging..."
    exit
  fi
}

execute() {
  echo "$targets" |
  while IFS=$(echo -en "\n\b") read -r line; do
    rm "$line"
  done
}

survey() {
  #Update locate db
  /usr/libexec/locate.updatedb
}

survey
aim
confirmTargets
execute
survey
