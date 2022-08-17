 //Two-way Communication using Pipes.
#include<stdio.h>
#include<string.h>
#include<sys/types.h>
#include<unistd.h>
void main()
{
int n,p1fd[2],p2fd[2];
pid_t pid;
char msg[100];
if(pipe(p1fd)==-1) {
printf("pipe failed\n");
return;
}
if(pipe(p2fd)==-1) {
printf("pipe failed\n");
return;
}
pid=fork();
if(pid<0) {
printf("fork failed\n");
return;
}
if(pid>0)//parent
{
close(p2fd[1]);
close(p1fd[0]);
printf("enter the msg to child (Client)--->Parent\n");
scanf("%s",msg);
write(p1fd[1],msg,strlen(msg)+1);
 sleep(5);//sleep of 5 seconds
read(p2fd[0],msg,100);
printf("the msg given by child (client) is %s --->Parent\n",msg);
}
else
{
close(p2fd[0]);
close(p1fd[1]);
 sleep(3); 
 read(p1fd[0],msg,100);
printf("the msg given by parent (Server) is %s --->child\n",msg);
 sleep(3);//sleep of 3 seconds
printf("enter the msg to parent (Server) --->child\n");
scanf("%s",msg);
write(p2fd[1],msg,strlen(msg)+1);
}
}
