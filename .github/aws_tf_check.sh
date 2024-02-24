#!/bin/bash

exit_code=1

# Two insights present in the following conditional statement:
# "arn:aws:ec2:eu-central-1" - means, that real resource already created in AWS
# "-eq 8" - not clear, because we looked for 7 substrings. That's because in
# "security_group_ids" output presented string with "vpc_id"
# To be shure you could run only "grep" part and you will see it.

if [ $(grep -E -w 'ec2_ami|ec2_public_ip|ec2_type|arn:aws:ec2:eu-central-1|vpc_id|subnet_id|security_group_ids' result | wc -l) -eq 8 ]; then
   exit_code=0
fi

if [[ $exit_code  == 0 ]]; then
   echo "Passed"
else
   echo "Failed"
   exit 1
fi
