#!/usr/bin/env bash
# YouTube to mp4 Downloader

mp4() {
  yt-dlp -f bestvideo+bestaudio -o "%(title)s.%(ext)s" $@
}
mp4fallback() {
  yt-dlp -f "bv*+ba/best" --merge-output-format mp4 --user-agent "Mozilla/5.0" --retries 20 -o "%(title)s.%(ext)s" $@
}
