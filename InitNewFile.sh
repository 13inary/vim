#!/bin/bash

# 文件所在目录、文件名和后缀、文件名、文件后缀
fileDir=`echo $1 | sed 's/.*\///g'`
fileNameType=`echo $2`
fileType=`echo $fileNameType | sed 's/.*\.//g'`
fileName=`echo $fileNameType | sed 's/\..*//g'`

# 没有类型后缀：退出
if [ $fileType == $fileNameType ]; then
	exit 
fi

# main.go
if [ $fileNameType == 'main.go' ]; then
	echo "
package main
 
// package main 
 
// main 
func main() {
	口口口
}"
exit
fi

# 在不是 main.go 后，后缀是 go
if [ $fileType == 'go' ]; then
	echo "
package $fileDir
 
// package $fileDir 
 
口口口"
exit
fi

# shell 脚本
if [ $fileType == 'sh' ]; then
	echo "
#!/bin/bash
 
口口口"
exit
fi

# proto 
# option go_package =\"./$fileName\";
if [ $fileType == 'proto' ]; then
	echo "
syntax = \"proto3\";
 
//import \"口口口\";
 
option go_package =\"../pb\";
 
//service Hello {
//	rpc Hello(Req) returns (Rsp);
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

# markdown
if [ $fileType == 'md' ]; then
	#myMdHead=`echo $fileName | sed 's/_/ and /g' | sed 's/-/ /g'`
	myMdHead=`echo $fileName | sed 's/^[0-9]\+_//g' `
	echo "
##  $myMdHead
口口口"
exit
fi

# 测试用
echo $fileDir
echo $fileType
echo $fileNameType
