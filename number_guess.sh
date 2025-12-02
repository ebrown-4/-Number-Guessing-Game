#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt and normalize username
echo "Enter your username:"
read USERNAME
USERNAME=${USERNAME:0:22}

# Fetch user stats (games_played, best_game); empty if new user
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")

# Branch: new vs returning user
if [[ -z "$USER_INFO" ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL);" > /dev/null
else
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Secret number and game prompt
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
read GUESS

# Validate first input: require an integer
while ! [[ $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done

NUMBER_OF_GUESSES=1

# Main guessing loop with validation
while [[ $GUESS -ne $SECRET_NUMBER ]]
do
  if [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi

  read GUESS

  while ! [[ $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done

  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
done

# Success message (exact wording)
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

# Persist stats: increment games_played and update best_game if better
# (best_game stays NULL until the first win; then set to NUMBER_OF_GUESSES)
$PSQL "UPDATE users
       SET games_played = games_played + 1,
           best_game = CASE
             WHEN best_game IS NULL THEN $NUMBER_OF_GUESSES
             WHEN $NUMBER_OF_GUESSES < best_game THEN $NUMBER_OF_GUESSES
             ELSE best_game
           END
       WHERE username = '$USERNAME';" > /dev/null
