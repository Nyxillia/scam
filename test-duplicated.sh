echo "discord/discord-bots.txt"
sort discord/discord-bots.txt | uniq -c | grep -v '^ *1 '
echo "discord/discord-server.txt"
sort discord/discord-server.txt | uniq -c | grep -v '^ *1 '
echo "discord/discord-user.txt"
sort discord/discord-user.txt | uniq -c | grep -v '^ *1 '
echo "number/sms-numbers.txt"
sort number/sms-numbers.txt | uniq -c | grep -v '^ *1 '
echo "number/telephone-numbers.txt"
sort number/telephone-numbers.txt | uniq -c | grep -v '^ *1 '
echo "web/websites.txt"
sort web/websites.txt | uniq -c | grep -v '^ *1 '
echo ""
echo "done..."
echo ""
echo "push to github? (y/n)"
read push
echo ""
if [ $push = y ]
then
sh push-git.sh
exit
fi
