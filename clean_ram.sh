#!/bin/sh

if [ $UID -eq 0 ]; then
    case $1 in
        "1")
            echo "1" > /proc/sys/vm/drop_caches
            echo "Cleared pagecache";;
        "2")
            echo "2" > /proc/sys/vm/drop_caches
            echo "Cleared dentries and inodes";;
        "3")
            echo "3" > /proc/sys/vm/drop_caches
            echo "Cleared pagecache, dentries and inodes";;
        *)
            echo "please give an argument (1,2,3)
            1: Clear pagecache
            2: Clear dentries and inodes
            3: Clear all"
    esac
else
    echo "you're not root"
fi
