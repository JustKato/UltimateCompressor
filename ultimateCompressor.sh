#!/bin/bash


# Set defaults for the input
input_dir="./";
output_dir="./";
quallity=40;
verbose="0";

# Colors
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[0;34m'
COLOR_YELLOW='\033[1;33m'


spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

# Parse the input
while getopts 'i:o:q:v' flag; do
    case "${flag}" in
        i) input_dir="${OPTARG}" ;;
        o) output_dir="${OPTARG}" ;;
        q) quallity="${OPTARG}" ;;
        v) v="1" ;;
        *) print_usage
        exit 1 ;;
    esac
done
# Parsing
output_dir=$(readlink -f $output_dir);

# Error checking
if [ ! -d $input_dir ]; then 
    printf "${COLOR_RED}Input directory missing,Stopping process...\n";
    exit;
fi

# Tell the user we are reading files
echo "Reading files from $input_dir and exporting to $output_dir";

spinner &

# Check for the output directory, see if you can 
if [ ! -d $output_dir ]; then 
    printf "\n${COLOR_RED}Output directory missing, creating...";
    mkdir -p "$output_dir";
fi

# These 3 for loops need to be replaced with a function,
# I have no clue how to do that, and/or how to optimize.
files=$(ls "$input_dir" | grep "[jJ][pP][gG]";);
printf "\n${COLOR_BLUE}Processing JPG files...${COLOR_GREEN}";
for filename in $files; do
    filename=$(basename "$filename");
    nohup cwebp "$(readlink -f $input_dir)"/"$filename" -q "$quallity" -o "$output_dir"/"$filename".webp > /dev/null 2>&1;
    if [ "$v" == "1" ]; then
        printf "\n${COLOR_GREEN}Succesfully converted $filename";
    fi
done


files=$(ls "$input_dir" | grep "[pP][nN][gG]";);
printf "\n${COLOR_BLUE}Processing PNG files...${COLOR_GREEN}";
for filename in $files; do
    filename=$(basename "$filename");
    nohup cwebp "$(readlink -f $input_dir)"/"$filename" -q "$quallity" -o "$output_dir"/"$filename".webp > /dev/null 2>&1;
    if [ "$v" == "1" ]; then
        printf "${COLOR_GREEN}Succesfully converted $filename\n";
    fi
done

#
files=$(ls "$input_dir" | grep "[mM][pP]4";);
printf "\n${COLOR_BLUE}Processing MP4 files...${COLOR_GREEN}";
for filename in $files; do
    filename=$(basename "$filename");
    nohup ffmpeg -i "$(readlink -f $input_dir)"/"$filename" "$output_dir"/"$filename".mp4 > /dev/null 2>&1;
    if [ "$v" == "1" ]; then
        printf "${COLOR_GREEN}Succesfully converted $filename\n";
    fi
done

files=$(ls "$input_dir" | grep "[fF][lL][vV]";);
printf "\n${COLOR_BLUE}Processing FLV files...${COLOR_GREEN}";
for filename in $files; do
    filename=$(basename "$filename");
    nohup ffmpeg -i "$(readlink -f $input_dir)"/"$filename" "$output_dir"/"$filename".mp4 > /dev/null 2>&1;
    if [ "$v" == "1" ]; then
        printf "${COLOR_GREEN}Succesfully converted $filename\n";
    fi
done

files=$(ls "$input_dir" | grep "[mM][oO][vV]";);
printf "\n${COLOR_BLUE}Processing MOV files...${COLOR_GREEN}";
for filename in $files; do
    filename=$(basename "$filename");
    nohup ffmpeg -i "$(readlink -f $input_dir)"/"$filename" "$output_dir"/"$filename".mp4 > /dev/null 2>&1;
    if [ "$v" == "1" ]; then
        printf "${COLOR_GREEN}Succesfully converted $filename\n";
    fi
done

kill "$!" # kill the spinner
printf '\n'

printf "\n${COLOR_GREEN}Complete!\n"