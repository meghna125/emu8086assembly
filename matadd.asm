data segment
    
    matrix1 dw 1,2,3,4,5,6,7,8,9
    matrix2 dw 2,3,4,6,2,7,4,8,9
    result dw 9 dup(?)
    
data ends

code segment
    assume ds:data
    start:
          mov ax,data
          mov ds,ax
          
          xor ax,ax
          xor cx,cx
          mov cx,3
          mov bx,0
          push cx
    loop1:mov si,0
          push cx
          mov cx,3
    
    loop2:mov ax,matrix1[bx][si]
          add ax,matrix2[bx][si]
          mov result[bx][si],ax
          
          inc si
          inc si
          loop loop2
          
          add bx,6
          loop loop1
          

code ends
    end start
    
    