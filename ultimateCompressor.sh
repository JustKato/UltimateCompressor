#!/bin/bash


# Set defaults for the input
input_dir="./";
output_dir="./";
quallity=40;

# Colors
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'

# Parse the input
while getopts 'i:o:q:' flag; do
    case "${flag}" in
        i) input_dir="${OPTARG}" ;;
        o) output_dir="${OPTARG}" ;;
        q) quallity="${OPTARG}" ;;
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

# Check for the output directory, see if you can 
if [ ! -d $output_dir ]; then 
    printf "${COLOR_RED}Output directory missing, creating...\n";
    mkdir -p "$output_dir";
fi


# These 3 for loops need to be replaced with a function,
# I have no clue how to do that, and/or how to optimize.
files=$(ls "$input_dir" | grep "[jJ][pP][gG]";);
echo "Processing JPG";
for filename in $files; do
    filename=$(basename "$filename");
    nohup cwebp "$(readlink -f $input_dir)"/"$filename" -q "$quallity" -o "$output_dir"/"$filename".webp > /dev/null 2>&1;
    printf "${COLOR_GREEN}Succesfully converted $filename\n";
done


files=$(ls "$input_dir" | grep "[pP][nN][gG]";);
echo "Processing PNG";
for filename in $files; do
    filename=$(basename "$filename");
    nohup cwebp "$(readlink -f $input_dir)"/"$filename" -q "$quallity" -o "$output_dir"/"$filename".webp > /dev/null 2>&1;
    printf "${COLOR_GREEN}Succesfully converted $filename\n";
done

#
files=$(ls "$input_dir" | grep "[mM][pP]4";);
echo "Processing MP4";
for filename in $files; do
    filename=$(basename "$filename");
    nohup ffmpeg -i "$(readlink -f $input_dir)"/"$filename" "$output_dir"/"$filename".mp4 > /dev/null 2>&1;
    printf "${COLOR_GREEN}Succesfully converted $filename\n";
done

files=$(ls "$input_dir" | grep "[fF][lL][vV]";);
echo "Processing FLV";
for filename in $files; do
    filename=$(basename "$filename");
    nohup ffmpeg -i "$(readlink -f $input_dir)"/"$filename" "$output_dir"/"$filename".mp4 > /dev/null 2>&1;
    printf "${COLOR_GREEN}Succesfully converted $filename\n";
done

files=$(ls "$input_dir" | grep "[mM][oO][vV]";);
echo "Processing MOV";
for filename in $files; do
    filename=$(basename "$filename");
    nohup ffmpeg -i "$(readlink -f $input_dir)"/"$filename" "$output_dir"/"$filename".mp4 > /dev/null 2>&1;
    printf "${COLOR_GREEN}Succesfully converted $filename\n";
done

printf "\n${COLOR_GREEN}Complete!\n"