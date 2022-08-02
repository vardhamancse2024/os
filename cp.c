#include<stdio.h>
void main(int argc,char **argv)
{
	FILE *fp1,*fp2;
	char ch;
	int pos;
	if((fp1=fopen(argv[1],"r"))==NULL)
	{
		printf("\n File cannot be opened");
		return;
	}
	else{
		printf("File cannot be opened for copy...\n");
	}
	fp2=fopen(argv[2],"w");
	fseek(fp1,0L,SEEK_END);
	pos=ftell(fp1);
	printf("File one has %d characters ",pos);
	fseek(fp1,0L,SEEK_SET);
	while(pos--){
		ch=fgetc(fp1);
		fputc(ch,fp2);
		}
		fclose(fp1);
		fclose(fp2);
		}
