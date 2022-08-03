#include<stdio.h>
int main()
{
int i,j,n,a[50],frame[10],no,k,avail,count=0;
printf("\n ENTER THE NUMBER OF PAGES:\n");
scanf("%d",&n);
printf("\n ENTER THE PAGE NUMBER :\n");
 for(i=1;i<=n;i++)
 scanf("%d",&a[i]);
 printf("\n ENTER THE NUMBER OF FRAMES :");
 scanf("%d",&no);
for(i=0;i<no;i++)
frame[i]= -1;
j=0;
 printf("\tref string\t page frames\n");
 
 

for(i=1;i<=n;i++)
  {
     printf("%d\t\t",a[i]);
     avail=0;
     for(k=0;k<no;k++)
     if(frame[k]==a[i])
      avail=1;
     if (avail==0)
     {
       frame[j]=a[i];
       j=(j+1)%no;
       count++;
       for(k=0;k<no;k++)
        printf("%d\t",frame[k]);
}
     printf("\n");
}
  printf("Page Fault Is %d\n",count);
  return 0;
}





/

--------------------------------------
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
/
 
