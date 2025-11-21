# ~/.config/hypr/hyprlock-video.sh
# Called by hypridle → plays video wallpaper → launches hyprlock

VIDEO="~/.config/hypr/Videos/sabrina-carp.mp4"   # ← change to your video

# Kill any stray mpvpaper from previous locks
pkill -f "mpvpaper.*lockscreen-video"

# Start video wallpaper on ALL monitors (or replace '*' with a specific one)
mpvpaper -l overlay -f -o "loop=yes no-audio volume=0 panscan=1.0" '*' "$VIDEO" &

# Save PID so hypridle can kill it later
echo $! > /tmp/mpvpaper-lockscreen.pid

# Small delay so hyprlock starts after the video is visible
sleep 0.4

# Launch the actual lock screen
hyprlock

# This part runs after you unlock
pkill mpvpaper
kill $(cat /tmp/mpvpaper-lockscreen.pid) 2>/dev/null
rm -f /tmp/mpvpaper-lockscreen.pid
