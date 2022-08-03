#include<stdio.h>

#include<stdlib.h>

int main(int argc,char *argv[])

{

    FILE *fp;

    char *line;

    size_t len=0;

    int count=0;

    if(argc<3){

        printf("Insufficient arguments");

        return -1;

    }

    fp=fopen(argv[2],"r");

    if(fp==NULL)

    {

        printf("File cannot be opened");

        return 1;

    }

    while(getline(&line,&len,fp)!=-1)

    {

        count++;

        if(count>atoi(argv[1]))

            break;

        printf("%s",line);

        fflush(stdout);

    }

    fclose(fp);

    return(0);

}
