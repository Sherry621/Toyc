    .text
    add:
    addi sp, sp, -256
    lw t1, -4(sp)
    lw t2, -8(sp)
    add t0, t1, t2
    mv a0, t0
    addi sp, sp, 256
    ret
    .globl main
    main:
    addi sp, sp, -256
    li t3, 0
    sw t3, -4(sp)
    li t4, 0
    sw t4, -8(sp)
    loop_0:
    lw t6, -8(sp)
    li t0, 10
    slt t5, t6, t0
    beqz t5, endloop_1
    lw t2, -8(sp)
    li t3, 5
    sub t1, t2, t3
    seqz t1, t1
    beqz t1, else_2
    lw t5, -8(sp)
    li t6, 1
    add t4, t5, t6
    sw t4, -8(sp)
    j loop_0
    j endif_3
    else_2:
    endif_3:
    lw t1, -8(sp)
    li t2, 8
    sub t0, t1, t2
    seqz t0, t0
    beqz t0, else_4
    j endloop_1
    j endif_5
    else_4:
    endif_5:
    lw t4, -4(sp)
    lw t6, -8(sp)
    mv a0, t6
    li t0, 1
    mv a1, t0
    call add
    mv t5, a0
    add t3, t4, t5
    sw t3, -4(sp)
    lw t2, -8(sp)
    li t3, 1
    add t1, t2, t3
    sw t1, -8(sp)
    j loop_0
    endloop_1:
    lw t4, -4(sp)
    mv a0, t4
    addi sp, sp, 256
    ret
