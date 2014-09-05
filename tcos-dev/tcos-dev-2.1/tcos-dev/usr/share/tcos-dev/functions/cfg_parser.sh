#!/usr/bin/env bash

cfg_parser(){
    section_regex='^\[(.*)\]$' #matches [Sections], match[1]: Sections
    comments_regex='\s+(;.*)?' #matches comments ";" and empty lines
    value_regex='(\w+)="(.*)"' #matches key=val, match[1]: key, match[2]: value

    while read line;do
	if [[ $line =~ $comments_regex ]];then
	    :
	elif [[ $line =~ $section_regex ]];then
	    current_section="${BASH_REMATCH[1]}"

	    # create an array with the section name
	    eval declare -a "$current_section"
	elif [[ $line =~ $value_regex ]];then
	    key="${BASH_REMATCH[1]}"
	    value="${BASH_REMATCH[2]}"
	    eval declare -a "$key"
	    eval $key[0]="$value"
	    eval $current_section['${#'$current_section[*]}]="$key"
	fi
    done < $1
}

cfg_parser $1
