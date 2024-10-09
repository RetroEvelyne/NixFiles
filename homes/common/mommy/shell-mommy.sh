#!/usr/bin/env sh

usage() { printf "usage: $0 [-pn]\n -p: positive response\n -n: negative response\n"; }
[ $# -eq 0 ] && usage && exit 0;

[ -z "$MOMMYS_LITTLE" ]  && MOMMYS_LITTLE="girl"
[ -z "$MOMMYS_PRONOUN" ] && MOMMYS_PRONOUN="her"
[ -z "$MOMMYS_ROLE" ]    && MOMMYS_ROLE="mommy"
[ -z "$MOMMY_COLOR" ] && MOMMY_COLOR='\e[38;5;217m'
COLOR_RESET='\e[0m'

negative() {
  RESPONSES=(
    "do you need $MOMMYS_ROLE's help~? ❤️"
    "don't give up, my love~ ❤️"
    "don't worry, $MOMMYS_ROLE is here to help you~ ❤️"
    "I believe in you, my sweet $MOMMYS_LITTLE~ ❤️"
    "it's okay to make mistakes, my dear~ ❤️"
    "just a little further, sweetie~ ❤️"
    "let's try again together, okay~? ❤️"
    "$MOMMYS_ROLE believes in you, and knows you can overcome this~ ❤️"
    "$MOMMYS_ROLE believes in you~ ❤️"
    "$MOMMYS_ROLE is always here for you, no matter what~ ❤️"
    "$MOMMYS_ROLE is here to help you through it~ ❤️"
    "$MOMMYS_ROLE is proud of you for trying, no matter what the outcome~ ❤️"
    "$MOMMYS_ROLE knows it's tough, but you can do it~ ❤️"
    "$MOMMYS_ROLE knows $MOMMYS_PRONOUN little $MOMMYS_LITTLE can do better~ ❤️"
    "$MOMMYS_ROLE knows you can do it, even if it's tough~ ❤️"
    "$MOMMYS_ROLE knows you're feeling down, but you'll get through it~ ❤️"
    "$MOMMYS_ROLE knows you're trying your best~ ❤️"
    "$MOMMYS_ROLE loves you, and is here to support you~ ❤️"
    "$MOMMYS_ROLE still loves you no matter what~ ❤️"
    "you're doing your best, and that's all that matters to $MOMMYS_ROLE~ ❤️"
    "$MOMMYS_ROLE is always here to encourage you~ ❤️"
  )
}

positive() {
  RESPONSES=(
    "*pats your head*"
    "awe, what a good $MOMMYS_LITTLE~\n$MOMMYS_ROLE knew you could do it~ ❤️"
    "good $MOMMYS_LITTLE~\n$MOMMYS_ROLE's so proud of you~ ❤️"
    "keep up the good work, my love~ ❤️"
    "$MOMMYS_ROLE is proud of the progress you've made~ ❤️"
    "$MOMMYS_ROLE is so grateful to have you as $MOMMYS_PRONOUN little $MOMMYS_LITTLE~ ❤️"
    "I'm so proud of you, my love~ ❤️"
    "$MOMMYS_ROLE is so proud of you~ ❤️"
    "$MOMMYS_ROLE loves seeing $MOMMYS_PRONOUN little $MOMMYS_LITTLE succeed~ ❤️"
    "$MOMMYS_ROLE thinks $MOMMYS_PRONOUN little $MOMMYS_LITTLE earned a big hug~ ❤️"
    "that's a good $MOMMYS_LITTLE~ ❤️"
    "you did an amazing job, my dear~ ❤️"
    "you're such a smart cookie~ ❤️"
  )
}

mommy_says() {
  says=$1
  printf "$MOMMY_COLOR$says$COLOR_RESET\n"
}

random() {
  [ $1 == "positive" ] && positive
  [ $1 == "negative" ] && negative

  index=$(($RANDOM % ${#RESPONSES[@]}))
  response="${RESPONSES[$index]}"

  mommy_says "$response"
}

while getopts "pn" options; do
  case $options in
    p) random "positive" ;;
    n) random "negative" ;;
    *) usage; exit 1 ;;
  esac
done
