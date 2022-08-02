//Process Management System calls fork (), exec () and wait () system calls.

#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
void main()
{
int pid;
pid= fork(); //fork a child process (create)
if(pid < 0)
{
printf("\n Fork failed to create a child \n");
return 1;
}
else if(pid > 0) // Parent process
{ 
 printf("\n The parent process id is %d \n" , getpid());
printf("\n Parent Process Running \n");
wait(NULL); //Parent waits for child to complete
printf("\n Child Completed \n");
}
else
{
printf(" \n Child Process running \n");
printf("\n The child process id is %d",getpid());
printf("\n The parent of child is %d" , getppid());
execlp("bin/ls" ,"ls",NULL);
}
return 0;
}
===========================================================================================================
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

======================================================================================================	


//FIFO create Process
#include<stdio.h>
#include<sys/types.h>
#include<fcntl.h>
#include<unistd.h>
int main()
{
int fd,x;
char msg[100];
x=mkfifo("abc",0666);
if(x==-1)
{
printf("fifo not created\n");
return 0;
}
fd=open("abc",O_WRONLY);
if(fd==-1)
{
printf("fifo not opened\n");
return 0;
}
printf("Enter the Message to FIFO ");
scanf("%s",msg);
write(fd,msg,sizeof(msg));
close(fd);
sleep(4);
 printf("Message written to FIFO \n"); 
unlink("abc");
return 0;
}
 	//FIFO Access Process
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<fcntl.h>
#define size 1024
int main()
{
int fd;
char buf[size];
fd=open("abc",O_RDONLY);
if(fd==-1){
printf("fifo not opened\n");
return 0;
}
read(fd,buf,size);
printf("\nthe message received from FIFO is --->%s",buf);
close(fd);
return 0;
}
=======================================================================================================================
//Shared memory - create Process – shmcreate.c
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include<stdlib.h>
#define SHMSZ 27
void main()
{
 char c;
 int shmid;
 key_t key;
 char *shm, *s;
 key = 5678;
 if ((shmid = shmget(key, SHMSZ, IPC_CREAT | 0666)) < 0)
 {
 printf("Shared Memory cannot be created");
 exit(1);
 }
 if((shm = shmat(shmid, NULL, 0)) == (char *) -1)
 {
 printf("shared memory cannot be attached);
 exit(1);
 }
 // Write alphabhets into shared memory - server
 for (c = 'a'; c <= 'z'; c++)
 *shm++ = c;
 *shm = NULL;
}


//Shared memory - Access Process – shmaccess.c
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#define SHMSZ 27
void main()
{
 int shmid;
 key_t key;
 char *shm, *s;
 key = 5678;
 
 if ((shmid = shmget(key, SHMSZ, 0666)) < 0)
 {
 printf("shared memory cannot be opened");
 exit(1);
 }
 
 if ((shm = shmat(shmid, NULL, 0)) == (char *) -1)
 {
 perror("Can not be attached to shared memory");
 exit(1);
 }
 //Read Alphabets from shared memory 
 for (s = shm; *s != NULL; s++)
 putchar(*s);
 
 putchar('\n');
}

=[==========================================================================================================

//Message Queue - create and send Process – msgsend.c
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define SIZE 128
typedef struct msgbuf {
 long mtype;
 char mtext[SIZE];
 } message_buf;
int main() {
 int msqid;
 int msgflg = IPC_CREAT|0666;
 key_t key;
 message_buf sbuf;
 size_t buf_length;
 char msg[100];
 key = 1234;
 if ((msqid = msgget(key, msgflg )) < 0) {
 printf("msgget-msg queue can not be created \n");
 return 1;
 }
 printf("\n Message Queue created with ID = %d\n", msqid);
 sbuf.mtype = 1;
 printf("\n Enter the message to send \n");
 scanf("%s",msg);
 strcpy(sbuf.mtext, msg);
 buf_length = strlen(sbuf.mtext) + 1 ;
 if (msgsnd(msqid, &sbuf, buf_length, IPC_NOWAIT) < 0) {
 return 1;
 }
 else {
 printf("\n Message Sent to Message Queue is %s \n", sbuf.mtext);
 }
 return 1;
 }




//Message Queue - Recieve Process – msgrcv.c
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<stdio.h>
#include<stdlib.h>
#define SIZE 128
typedef struct msgbuf 
 {
 long mtype;
 char mtext[SIZE];
 } message_buf; 
 int main() {
 int msqid;
 key_t key;
 message_buf rbuf;
 key = 1234; 
 if ((msqid = msgget(key, 0666)) < 0)
 {
 printf("msgget- can not open Message Queue");
 exit(1);
 }
 
 if (msgrcv(msqid, &rbuf, SIZE, 1, 0) < 0)
 {
 printf("msgrcv- error in recieving");
 exit(1);
 }
 printf("\n Message Recievied From the Queue %s \n", rbuf.mtext);
 exit(0);
 }



=========================================================================================================
//Head command simulation

#include<stdio.h>
#include<stdlib.h>
int main(int argc , char *argv[])
 {
 FILE *fp;
 char *line;
 int len=0;
 int count=0;
 if(argc < 3) {
 printf("Insuffiecent Arguments");
 return -1;
 }
 fp = fopen(argv[2] , "r");
 if(fp == NULL) {
 printf("File cannot be opened");
 return 1; 
 }
 while(getline(&line,&len,fp)!= -1) {
 count++;
 if(count > atoi(argv[1]))
 break;
 printf("%s", line);
 fflush(stdout);
 }
 fclose(fp);
 return (0);
}

===============================================================================================================
//Tail command simulation
#include<stdio.h>
#include<stdlib.h>
int main(int argc , char *argv[])
 {
 FILE *fp;
 char *line;
 int len=0;
 int count=0,n,i;
 if(argc < 3) {
 printf("Insuffiecent Arguments");
 return -1;
 }
 fp = fopen(argv[2] , "r");
 if(fp == NULL) {
 printf("File cannot be opened");
 return 1; 
 }
 while(getline(&line,&len,fp)!= -1) {
 count++;
 }
 printf("\n Total number of lines is %d \n", count); 
 rewind(fp);
 n = count - atoi(argv[1]);
 i=0;
 while(getline(&line , &len , fp) !=-1) {
 i++;
 if(i > n)
 printf("%s",line);
 }
fclose(fp);
 return (0);
}

================================================================================================================
//Program to implement FIFO Page replacement algorithm

#include<stdio.h>
void main()
 {
 int i,j,k,m,n;
 int pf=0,count=0;
 int rs[30],mf[10];
 printf("\n Enter the length of the reference string \n");
 scanf("%d",&n);
 printf("\n Enter the reference string \n");
 for(i=0;i<n;i++)
 scanf("%d",&rs[i]);
 printf("\n Enter the number of frames \n");
 scanf("%d",&m);
 for(i=0;i<m;i++)
 mf[i] =-1;
 printf("\n The FIFO page replacement process is \n");
 for(i=0; i<n ;i++) {
 for(k=0;k<m;k++) {
 if( mf[k] == rs[i])
 break;
 }
 if(k ==m )
 { 
 mf[count] = rs[i];
 count++;
 pf++;
 }
 for(j=0;j<m ;j++)
 printf("\t %d",mf[j]);
 if(k==m)
 printf("\t\tThe page fault no. is %d \n" , pf);
 printf("\n");
 
 if(count == m)
 count =0;
 }
printf(" The total pagefaults is using FIFO replacement is ---> %d \n ", pf);
 }

================================================================================================================
//Program to implement LRU Page replacement  algorithm


#include<stdio.h>
void main()
 {
 int i,j,k,min;
 int rs[25], flag[25];
 int n,f,pf=0,next=1;
 int count[20], m[20];
 printf("Enter the length of reference string \n ");
 scanf("%d",&n);
 printf("\n Enter the reference string --->\n");
 for(i=0;i<n;i++)
 {
 scanf("%d",&rs[i]);
 flag[i] = 0;
 }
 printf(" \n Enter the number of frames \n");
 scanf("%d",&f);
 for(i=0;i<f;i++)
 {
 count[i] = 0;
 m[i] = -1;
 }
 printf("\n The Page Replacement process is --->\n" );
 for(i=0;i<n;i++)
 {
 for(j=0;j<f;j++)
 {
 if(m[j]==rs[i])
 {
 flag[i] = 1;
 count[j]= next;
 next++;
 }
}
 if(flag[i] == 0)
 {
 if(i <f )
 {
 m[i] = rs[i];
 count[i]= next;
 next++;
 }
 else
 {
 min = 0;
 for(j=1;j<f;j++)
 if(count[min] > count[j])
 min = j;
 m[min] = rs[i];
 count[min] = next;
 next++;
 }
 pf++;
 }
 for(j=0 ; j<f;j++)
 printf("%d \t",m[j]);
 
 
 if(flag[i] == 0)
 printf(" The Page Fault num is ...>%d" ,pf);
 printf("\n");
 }
 printf("\n The number of page faults using LRU is ---> %d \n" , pf);
 }








