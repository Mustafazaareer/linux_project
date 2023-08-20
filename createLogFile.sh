#!/bin/bash


desired_dir="/home/mustafa/linux_Project"

date=$(date +"%Y-%m-%dT%H-%M")

log_file_name="kernel-logs-${current_datetime}.txt"


zipped_file="kernel-logs-${current_datetime}.tar.bz2"

journalctl --since "1 hour ago" -k > "${desired_dir}/${log_file_name}"


cd "${desired_dir}" || exit

tar -cjf "${zipped_file}" "${log_file_name}"

dbxcli put $zipped_file

