#include <stdlib.h>
int sub(int x, int y){
00EF1020  push        ebp  
00EF1021  mov         ebp,esp  
	return 2*x+y;
00EF1023  mov         eax,dword ptr [ebp+8]  
00EF1026  mov         ecx,dword ptr [ebp+0Ch]  
00EF1029  lea         eax,[ecx+eax*2]  
}
00EF102C  pop         ebp  
00EF102D  ret  


int main(int argc, char ** argv){
00EF1030  push        ebp  
00EF1031  mov         ebp,esp  
00EF1033  push        ecx  ; way for ms compiler to allocating 4 byte space for a
							;not saving because ecx is caller-save register; 
							;there would be corresponding pop if it were 
	int a;
	a = atoi(argv[1]);
00EF1034  mov         eax,dword ptr [ebp+0Ch]  ;[ebp  + 0ch] has address of pointer to cmd line argument(string); move the address to eax
00EF1037  mov         ecx,dword ptr [eax+4]  ;pointer increment. basically argv[1]. argv[1] points to address of 2nd argument
00EF103A  push        ecx  ;push argv[1] onto stack. pointer to second argument
00EF103B  call        dword ptr ds:[00EF6238h]  ;call to atoi, return value at eax
00EF1041  add         esp,4  ;cdecl, caller cleans up the stack parameters
00EF1044  mov         dword ptr [ebp-4],eax  ; store return value into variable allocated in 00EF1033
	return sub(argc,a);
00EF1047  mov         edx,dword ptr [ebp-4]  
00EF104A  push        edx  
00EF104B  mov         eax,dword ptr [ebp+8]  
00EF104E  push        eax  
00EF104F  call        00EF1005  
00EF1054  add         esp,8  
}
00EF1057  mov         esp,ebp  
00EF1059  pop         ebp  
00EF105A  ret  