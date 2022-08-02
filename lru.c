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
