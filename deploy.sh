
printf "====================================================\n"
printf "   Synchronization with rsync $(date +'%T')\n"
printf "====================================================\n"

key='R8NA@RgiwHz*'
ip_live="103.75.186.153"
DOMAIN_NAME="proshop.site"

yarn install
yarn run build --no-lint 

options='sshpass -p $key rsync -avzhe ssh -e "ssh -p 24700 -o StrictHostKeyChecking=no" --progress --timeout=5'
eval $options  --exclude 'node_modules' --exclude '.git' "${PWD}"/ root@$ip_live:/home/ruby/$DOMAIN_NAME/

options='sshpass -p $key ssh root@$ip_live -p 24700 "cd /home/ruby/$DOMAIN_NAME && pm2 reload all"'
eval $options
echo "bundle done"

printf "====================================================\n"
printf "     Done with rsync $(date +'%T')\n"
printf "====================================================\n"
