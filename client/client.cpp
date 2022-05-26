//
//  client.cpp
//  FileTrans.cpp
//
//  Created by jiajun fu on 2022/5/24.
//
#include <iostream>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <vector>
#include <unistd.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <string>
#include "clip-main/clip.h"

void write_something(char *, int);
void print_content(int sockfd);

int main(int argc, char** argv){
    using namespace std;
    int sockfd;
    struct sockaddr_in serve_addr;
    
    if (argc != 2){
        std::cout << "usage command <file_address>"<< endl;
        exit(-1);
    }
    
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
        
    bzero(&serve_addr, sizeof(serve_addr));
    serve_addr.sin_family = AF_INET;
    serve_addr.sin_port = htons(6540);
    inet_pton(AF_INET, "127.0.0.1" , &serve_addr.sin_addr);
    //std::cout << argv[1] << std::endl;
    int sig = connect(sockfd, (struct sockaddr*) &serve_addr, sizeof(serve_addr) );
    if(sig == -1){
        std::cout << "connect error" << std::endl ;
    }
    write_something(argv[1], sockfd);
    shutdown(sockfd, SHUT_WR);
    print_content(sockfd);
    //close(sockfd);
    return 0;
    
        
}

void write_something(char * str1, int sockfd){
    int length;
    for(length = 0; str1[length] != '\0' ;length++){}
    length++;
    char buff[1000];
    ssize_t n;
    while (write(sockfd, str1, length) != length){
        std::cout << 2 <<std::endl;
        std::cout << "error while writting..."  << std::endl;
    }
    }


void print_content(int sockfd){
    char buff[2000];
    bzero(buff,sizeof(buff));
    ssize_t n;
    std::string OutputStr;
    std::cout << "reading from socket..." << std::endl;
    while (true) {
        if ((n = read(sockfd, buff, 2000)) <= 0){
            break;
        }
        std::string TempStr(buff);
        OutputStr = OutputStr+TempStr;
        //std::cout <<TempStr;
    }
    clip::set_text(OutputStr);
    std::cout << OutputStr;
}

