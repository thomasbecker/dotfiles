sketchybar -m --set disk_percentage label=$(df -lh | grep /dev/disk1s2 | awk '{ printf ("%02.0f\n", $5) }')%
