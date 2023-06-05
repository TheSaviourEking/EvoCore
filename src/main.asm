org 0x7c00              ;tells assembler where we expect our code to be loaded.
                        ; The assembler uses this information to calculate label addresses.

bits 16                 ; Tells assembler to emit 16/32/64-bit code.
 
main:
    hlt                 ; Stops CPU from executing (it can be resumed by an interrupt).

.halt:
    jmp .halt           ; Jumps to given location, unconditionally (equivalent 
                        ; with goto instruction in C).

times 510-($-$$) db 0   ; DB byte 1, byte 2, byte 3...(directive)
                        ; Stands for "define byte(s)". Writes given byte(s) to
                        ; the assembled binary file
                        ; TIMES number instruction/data (directive)
                        ; Repeats given instruction or piece of data a number of times.
                        ; $ - Special symbol which is equal to the memory offset of current line
                        ; $$ - Special symbol which is equal to the memory offset of the beginning 
                        ; of the current section (in our case, program)
                        ; ($-$$) - Gives the size of our program so far (in bytes).

dw 0xaa55               ; DW word 1, word 2, word 3...(directive)
                        ; Stands for "define word(s)". writes given word(s) (2 byte value, 
                        ; encoded in little endian) to the assembled binary file.
