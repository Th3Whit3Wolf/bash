#!/bin/bash

error_fn()
{
        echo "Usage: ./download [URL]"
        exit 1
}

if [ $# -ne 1 ]; then
        error_fn
else
        youtube-dl --verbose --no-playlist --extract-audio --audio-format mp3 --audio-quality 0 $1
fi

