#!/bin/bash

FILES="
discord/discord-bots.txt
discord/discord-server.txt
discord/discord-user.txt
number/sms-numbers.txt
number/telephone-numbers.txt
web/websites.txt
csv_database.csv
merged_csv_database.csv
"

main() {
    func_sort
    func_testing
    read -p "push to github? (y/n) " push
    if [ $push = y ]; then func_push; fi
    echo "done"
}

func_sort() {
    echo "sorting..."
    for file in $FILES
    do
        sort "$file" -n -o "$file"
    done
    echo "sorting done"
}

func_testing() {
    for file in $FILES
    do
        echo "$file"
        sort "$file" | uniq -c | grep -v '^ *1'
    done
    echo "done..."
}

func_push() {
    git add -A
    git commit -m "automated push"
    git push
}

main
