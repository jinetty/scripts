#!/bin/env bash

if [ -z $1 ]; then
  echo "Please provide a youtube link";
  exit
fi

if [ $(command -v yt-dlp) ]; then
  yt-dlp -f bestaudio --no-post-overwrites --extract-audio --audio-format "m4a" -o "%(title)s.%(ext)s" $1 --add-metadata --embed-thumbnail --sponsorblock-remove all --postprocessor-args "-ac 1";
  echo "Video has been successfuly downloaded";
else
  echo "yt-dlp is not downloaded. You can install it via pip or your distro's package manager.";
  exit
fi
