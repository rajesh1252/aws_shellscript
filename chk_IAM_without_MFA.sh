echo "chk user with out mfa"
ehco "---------------------"
aws iam list-users --output text > user_list
cat user_list | awk '{print $6;}' | grep -v AI
