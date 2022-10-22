#!/bin/bash
Instances=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId  \
--filters "Name=tag:Name,Values=Test_Quote_Server" \
--output=text)

echo $Instances
aws ec2 terminate-instances --instance-ids $Instances