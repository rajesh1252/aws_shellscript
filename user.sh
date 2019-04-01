#!/bin/bash
usernames=$(aws iam list-users --query "Users[].[UserName]" --output text)
while read -r username; do
  c=$(aws iam list-mfa-devices --user-name "$username" --query "length(MFADevices)" --output text)
  echo "$username,$c" | grep -v ",1"
done <<< "$usernames"
exit 0
