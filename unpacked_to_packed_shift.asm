;THIS CODE CONVERTS UNPACKED ARRAY INTO PACKED ARRAY USING SHIFT OPEARTION

data segment
    unpacked db 01h,02h,03h,04h,05h,06h,07h,08h,01h,02h,03h,04h,05h,06h,07h,08h
    packed db 8 dup(?)
data ends

code segment
    assume ds:data
           
    start: 
 
      mov ax,data
      mov ds,ax
      mov ax,0
      mov di,0h
      mov cx,08h
      mov si,0h
 
 next:mov ax,word ptr unpacked[si]
      shl al,4
      shr ax,4
      mov packed[di],al
      inc si
      inc si
      inc di
      loop next
      
      

      
code ends
end start






