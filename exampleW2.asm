int main(int argc, char ** argv){
00EF1030  push        ebp  
00EF1031  mov         ebp,esp  
00EF1033  push        ecx  ; way for ms compiler to allocating 4 byte space for a
							;not saving because ecx is caller-save register; 
							;there would be corresponding pop if it were 
	int a;
	a = atoi(argv[1]);
00EF1034  mov         eax,dword ptr [ebp+0Ch]  ;[ebp  + 0ch] has address of pointer to argument(string); move the address to eax
00EF1037  mov         ecx,dword ptr [eax+4]  ;since argv[1] is getting used, add 4 bytes to increment pointer and store the addresss to ecx
00EF103A  push        ecx  
00EF103B  call        dword ptr ds:[00EF6238h]  
00EF1041  add         esp,4  
00EF1044  mov         dword ptr [ebp-4],eax  
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