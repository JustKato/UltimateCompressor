# UltimateCompressor

## Description
A bash script to convert all your video/image files from a folder, 
into the most efficient way to compress them.

![Image Unavailabe](https://raw.githubusercontent.com/MissingPotato/UltimateCompressor/master/preview.png)

## Known Bugs
Right now the compressor can't read the files that have spaces in them, 
I suggest you run this command in the folder with your files
```bash
for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done
```

## Parameters
```
-i  input, takes a directory
-o  output, takes a directory
-q  quallity, it's only for the webp right now ( higher = better | 0 - 100 )
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
- [webp project(cwebp)](https://developers.google.com/speed/webp/download)


## Examples
```bash
./ultimateCompressor.sh -i ~/Pictures/memes/ -o ~/Pictures/memes_compressed -q 30

./ultimateCompressor.sh -i ~/Pictures/memes/ -o ~/Pictures/memes_compressed -q 0
```

#### Author Notes

This is one of my first public github projects, if you have any suggestions please don't shy to help me out.
