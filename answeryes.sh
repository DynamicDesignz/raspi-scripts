

myaddrbook=address-book.txt

echo "Enter Contact Information?:"
echo -e "$name ; $phone \n"
echo -n "y/n: "

	read answer

        if [ "$answer" == "y" ] 
        then
            # Write the values to the address book
            echo "$name ; $phone" >>$myaddrbook
        else
            # Give the user a message
            echo "$name ; $phone NOT written to $myaddrbook"
        fi

exit 0
