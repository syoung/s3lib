#include <stdio.h> 

int main(int argc, char *argv[])
{
  int i, j;
  for (i = 0; i < argc; i++)
  {
    printf ("argv[%d] is %s\n", i, argv[i]);
    for (j = 0; argv[i][j]; j++)
      printf ("argv[%d][%d] is %c\n", i, j, argv[i][j]);
  }
  return(0);
}

/*
 * When invoked with:
 E:\>a.exe -parm1 -a
 * The output is:
  argv[0] is E:\a.exe
  argv[0][0] is E
  argv[0][1] is :
  argv[0][2] is \
  argv[0][3] is a
  argv[0][4] is .
  argv[0][5] is e
  argv[0][6] is x
  argv[0][7] is e
  argv[1] is -parm1
  argv[1][0] is -
  argv[1][1] is p
  argv[1][2] is a
  argv[1][3] is r
  argv[1][4] is m
  argv[1][5] is 1
  argv[2] is -a
  argv[2][0] is -
  argv[2][1] is a
 *
 */