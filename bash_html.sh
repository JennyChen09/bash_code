#!/bin/bash
#  sysinfo_page - A script tp produce an HTML file

##### Constants

title="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

##### Functions

system_info()
{
   echo "<h2>System release info</h2>"
   echo "<p>Function not yet implemented</p>"
}

show_uptime()
{
   echo "<h2>System uptime</h2>"
   echo "<pre>"
   uptime
   echo "</pre>"
}

drive_space()
{
   echo "<h2>Filesystem space</h2>"
   echo "<pre>"
   df
   echo "</pre>"
}

home_space()
{
   if [ "$(id -u)" = "0" ]; then
       echo "<h2>Home directory space by user</h2>"
       echo "<pre>"
       echo "Bytes Directory"
           du -s /home/* | sort -nr
       echo "</pre>"
   fi
}

write_page()
{
    cat <<- _EOF_
    <html>
    <head>
        <title>
        $title
        </title>
    </head>
  
    <body>
    <h1>$title</h1>
    <p>$TIME_STAMP</p>
    $(system_info)
    $(show_uptime)
    $(drive_space)
    $(home_space)
    </body>
    </html>
_EOF_

}


usage()
{
   echo "usage: sysinfo_page [[[-f file ] [-i]] | [-h]]"
}

####Main

interactive=
filename=~/Desktop/github/bash_code/sysinfo_page.html

while [ "$1" != "" ]; do
    case $1 in
        -f | --file ) shift
                      filename=$1
                      ;;
        -i | --interactive )  interactive=1
                      ;;
        -h | --help ) usage
                      exit
                      ;;
        * )           usage
                      exit 1
     esac
     shift
done

if [ "$interactive" = "1" ]; then

    response=

    echo -n "Enter name of output file [$filename] > "
    read response
    if [ -n "$response" ]; then
        filename=$response
    fi

    if [ -f $filename ]; then
       echo -n "Ouput file exists. Overwrite? (y/n) > "
       read response
       if [ "$response" != "y" ];then
           echo "Existing program."
           exit 1
       fi
     fi
fi
    
echo "output file = $filename"

# Write page (comment out until testing is complete)

 write_page > $filename
