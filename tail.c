#include<stdio.h>
#include<stdlib.h>
int main(int argc , char *argv[])
{
FILE *fp;
char *line;
int len=0;
int count=0,n,i;
if(argc < 3)
{
printf("Insuffiecent Arguments");
return -1;
}
fp = fopen(argv[2] , "r");
if(fp == NULL)
{
printf("File cannot be opened");
return 1;
}
while(getline(&line,&len,fp)!= -1)
{
count++;
}
printf("\n Total number of lines is %d \n", count);
rewind(fp);
n = count - atoi(argv[1]);
i=0;
while(getline(&line , &len , fp) !=-1)
{
i++;
if(i > n)
printf("%s",line);
}
fclose(fp);
return (0);
}
