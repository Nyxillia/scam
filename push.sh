#!/usr/bin/env bash

FILES="
discord/discord-bots.txt
discord/discord-server.txt
discord/discord-user.txt
number/sms-numbers.txt
number/telephone-numbers.txt
web/websites.txt
"

main() {
    func_sort
    func_testing
    read -p "push to github? (y/n) " push
    if [ $push = y ]; then func_push; fi
    echo "\ndone"
}

func_sort() {
    echo "sorting..."
    for file in $FILES
    do
        sort "$file" -o "$file"
    done
    echo "sorting done\n"
}

func_testing() {
    for file in $FILES
    do
        echo "$file"
        sort "$file" | uniq -c | grep -v '^ *1'
    done
    echo "done...\n"
}

func_push() {
    git add -A
    git commit -m "automated push"
    git push
}

main
