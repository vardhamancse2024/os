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
