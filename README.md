# UltimateCompressor

## Description
A bash script to convert all your video/image files from a folder, 
into the most efficient way to compress them.



## Parameters
```
-i  input, takes a directory
-o  output, takes a directory
-q  quallity, it's only for the webp right now ( higher = better )
```

## Supported file types

- png
- jpg
- flv
- mp4
- mov


## Tested On

- Ubuntu 19.04


## To-Do
- [x] png -> Webp Images
- [x] jpg -> Webp Images
- [x] mp4 -> mp4 compression
- [x] flv -> mp4 compression
- [x] mov -> mp4 compression
- [ ] Detect if png or webp is smaller
- [ ] Custom quallity parameters ( for each format )
- [ ] Parameters to Only convert certain images and video files
- [ ] Learn how to use github
- [ ] Automatically install dependencies
- [ ] Allow nesting


## Dependencies
- [webp project(cwebp)](https://www.webmproject.org/)


## Examples
```
./ultimateCompressor.sh -i ~/Pictures/memes/ -o ~/Pictures/memes_compressed -q 30

./ultimateCompressor.sh -i ~/Pictures/memes/ -o ~/Pictures/memes_compressed -q 0
```

#### Author Notes

This is one of my first public github projects, if you have any suggestions please don't shy to help me out.
