touch file1 file2 file3 file4

for i in 1 2 3
do 
echo $i
done

for file in file1 file2 file3 file4
do
cat $file
done
