cd $HOME/myimages
$ mkdir small
$ for pic in `ls *.png`
do
echo “converting $pic”
convert -resize 1024x768 $pic small/sm-$pic
done

