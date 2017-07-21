echo "Testing connection..." > test.txt
nc 165.227.132.189 8090 < test.txt
rm test.txt

