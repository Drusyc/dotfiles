# .bash_functions
# put your own functions here
# add set -x to print command

# Tar 
function dragut {
    tar cvf - $1 | gzip -9v - > $2.tar.gz
}

function mygcc {
    gcc -o $1 -Wall -Wextra -g -std=c99 $2 
}

function myps {
        ps -elf | grep -v grep | grep $1
}

function google {
	param=$(echo $1 |sed 's/\ /+/g')	
	chromium-browser https://www.google.fr/search?q=$param 2> /dev/null &
}


# Compute md5 checksum for a directory (files and subdirectories)
function chkssize {
	find $1 -type f \( -exec md5sum "{}" \; \) | sort -k2,2 | md5sum
}


# Compute md5 checksum for 2 directories (files and subdirectories)
# and compare it. May take ages.
function cmpsize {
	size1 = `find $1 -type f \( -exec md5sum "{}" \; \) | sort -k2,2 | md5sum`
	echo "Size of rep1 : $size1";

	size2 = `find $2 -type f \( -exec md5sum "{}" \; \) | sort -k2,2 | md5sum`
	echo "Size of rep2 : $size2";

	if [ "$size1" = "$size2" ]; then
		echo "1";
	else 
		echo "0";
	fi;
}

# compress images in pdf (i.e. what latex can not do alone)
# vaufreydaz file_to_compress.pdf
function vaufreydaz {
	compressed_file="compressed_$1";
	ret=$(gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$compressed_file" $1; echo $?;)

	if [ "$ret" = 0 ]; then
		original_size=$(du $1 |awk {'print $1'});
		compressed_size=$(du $compressed_file |awk {'print $1'});
		res=$(echo "$compressed_size $original_size" | awk '{printf "%.2f", (1 - ($1 / $2)) * 100}');
		echo "Compression : ${res}%.";
		echo "File generated : \"${compressed_file}\".";
	else
		echo "Error code : $ret";
	fi
}
