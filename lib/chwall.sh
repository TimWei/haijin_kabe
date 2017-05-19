#!/bin/sh
files=(./img/*)
FILE="${files[RANDOM % ${#files[@]}]}"

function change_wall() {
full_path=$(pwd)/$FILE
echo $full_path
	/usr/bin/osascript <<END
tell application "Finder"
  set myFile to POSIX file "$full_path" as string
  set desktop picture to file myFile
end tell
END
}

function rm_file() {
	if [[ "$FILE" == *"jpg" || "$FILE" == *"png" ]]; then
	  rm "$FILE"
	fi
}

function main() {
	
	change_wall
	echo "set $FILE as wallpaper"
	echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		if [[ "$FILE" == "./img/*" ]]; then
        	echo 'no files'
			return 0
        fi
		rm_file	
	fi
}
main
