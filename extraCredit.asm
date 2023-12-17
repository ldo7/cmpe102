#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define SIZE 3

int getSum(int arr[], int s);
int getSum2(int *ptr, int size);
int main(void)
{
    int arr[SIZE] = {1, 2, 3};
    int index;
    printf("index: ");
    scanf("%d", &index); // request input

    printf("The sum is %d\n", getSum(arr, SIZE));

    return 0;
}
int getSum(int arr[], int size)
{
    int sum = 0;

    __asm
    {
        mov esi,arr
        mov ecx,size
        mov eax,0
        cmp ecx,0
        jz exit
        L1:
        add eax,[esi]
        add esi,4 ;type arr
        loop L1
        mov sum,eax
        exit:
    }

    return sum;
}
int getSum2(int *ptr, int size)
{
    int sum = 0;

    __asm
    {
        mov esi,ptr
        mov ecx,size
        mov eax,0
        cmp ecx,0
        jz done
        L1:
        add eax,[esi]
        add esi,4 
        loop L1
        mov sum,eax
        done:
    }
    return sum;
}

int getSum3(int *p, int s, int i)
{
    __asm
    {
        //....

        L1:
        add esi,4
        loop L1

        skip:
        mov ecx,s
        sub ecx,i
        mov eax,0
        cmp ecx,0
        jz done

        L2:
        add eax,[esi]
        add esi,4
        loop L2

        mov sum,eax
    }
}