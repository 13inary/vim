#!/bin/bash

myFileDir=`echo $1 | sed 's/.*\///g'`
myFileName=`echo $2`
myFileType=`echo $myFileName | sed 's/.*\.//g'`
myFileLeftName=`echo $myFileName | sed 's/\..*//g'`

if [ $myFileType == $myFileName ]; then
	exit 
fi

if [ $myFileName == 'main.go' ]; then
	echo "
package main
 
// package main 
 
// main 
func main() {
	口口口
}"
exit
fi

if [ $myFileType == 'go' ]; then
	echo "
package $myFileDir
 
// package $myFileDir 
 
口口口"
exit
fi

if [ $myFileType == 'sh' ]; then
	echo "
#!/bin/bash
# 
 
口口口"
exit
fi

if [ $myFileType == 'proto' ]; then
	echo "
syntax = \"proto3\";
 
//import \"口口口\";
 
option go_package =\"./$myFileLeftName\";
 
//service Hello {
//	rpc Hello(Req) returens (Rsp);
//}
 
//message Req {
//	string name = 1;
//}
 
//message Rsp {
//	string info = 1;
//}
"
exit
fi

echo $myFileDir
echo $myFileType
echo $myFileName
