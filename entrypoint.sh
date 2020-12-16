#!/usr/bin/env sh

set -euo pipefail

if [ -z ${INPUT_VIDEO_URL} ]; then
	echo "[ERROR] VIDEO_URL can't be empty."
	exit 1
fi

if [ -z ${INPUT_BUCKET} ]; then
	echo "[ERROR] BUCKET can't be empty."
	exit 1
fi

youtube-dl ${INPUT_VIDEO_URL} --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4

rclone copyto $(ls | grep mp4) ${INPUT_BUCKET}/$(ls | grep mp4) -P