//
//  main.cpp
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
#include <fcntl.h>
#include <arpa/inet.h>

using namespace std;

void file_return(int,int);
char * cut(char*);


int main(int argc, const char * argv[]) {
    int listenfd,connfd;
    pid_t child_pid;
    socklen_t client_len;
    struct sockaddr_in cli_socket,ser_socket;
    listenfd = socket(AF_INET, SOCK_STREAM, 0);
    
    bzero(&ser_socket, sizeof(ser_socket));
    ser_socket.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &ser_socket.sin_addr);
    //ser_socket.sin_addr.s_addr = htonl(INADDR_ANY);
    ser_socket.sin_port = htons(6540);
    
    bind(listenfd,(struct sockaddr*) &ser_socket, sizeof(ser_socket));
    
    listen(listenfd,100);
    
    while (true) {
        client_len = sizeof(cli_socket);
        std::cout << "listening..." << endl;
        connfd = accept(listenfd, (struct sockaddr*) &cli_socket, &client_len);
        
        if ((child_pid = fork() ) ==0){
            close(listenfd);
            file_return(connfd,connfd);
            
            exit(0);
        }
        close(connfd);
    }
    
}

char * cut(char * str1){
    int i = 0;
    int len = 0;
    while (true){
        if(str1[i] == '\0'){
            break;
        }
        if(str1[i] != '\n'){
            len++;
        }
        i++;
    }
    len++;
    char *result = new char[len];
    for(int j =0;j<len-1;j++){
        if (str1[j] != '\n'){
        result[j] = str1[j];
        }
    }
    result[len-1] = '\0';
    return result;
}


void file_return(int in_socketfd,int out_socketfd){
    ssize_t n;
    ssize_t x;
    char filename[100];
    bzero(filename , sizeof(filename));
    char *buff = new char[3000];
    int filefd;
    
    size_t cur = 0;
    size_t remain = 100;
    std::cout << "reading..." << std::endl;
    while ((n = read(in_socketfd,filename+cur,remain-cur)) > 0){
        cur = cur + n;
        remain = remain - n;
        if (cur > 98){
            break;
        }
        if (remain < 0){
            break;
        }
    }
    filename[cur+1] = '\0';
    char *file;
    file = cut(filename);
    filefd = open(file, O_RDONLY);
    std::cout << "open file  " << filename<< "..."<< std::endl;
    if(filefd == -1){
        std::cout << "open file error" << std::endl;
    }
    int old = 0;
    size_t read_cur = 0;
    size_t read_remain = 3000;
    while ((x = read(filefd, buff+read_cur, remain))>0){
        old= read_cur;
        read_cur = read_cur  + x;
        read_remain = read_remain - x;
        if (read_cur > 2998){
            //shutdown(out_socketfd, SHUT_WR);
            break;
        }
        if (read_remain < 0){
            //shutdown(out_socketfd, SHUT_WR);
            break;
        }
        std::cout << "writting..." <<std::endl;
        if ((write(out_socketfd,buff+old,x)) == x ){
            std::cout << buff+old << std::endl;
        }else{
            if (x==0){
                std::cout<< "end" << std::endl;
            }else{
            std::cout <<"error" <<endl;
            exit(-1);
            }
        }
        std::cout << "writting end" << std::endl;
    }
    
}

