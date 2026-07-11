// std/mem.sol — Memory utilities (raw C malloc/free)

pub malloc(int bytes) out int
    C -> "void* ptr = malloc(bytes);"
    C -> "int result = (int)(intptr_t)ptr;"
    return result

pub free(int ptr)
    C -> "free((void*)(intptr_t)ptr);"

pub memcpy(int dest, int src, int n)
    C -> "memcpy((void*)(intptr_t)dest, (void*)(intptr_t)src, n);"

pub memset(int ptr, int val, int n)
    C -> "memset((void*)(intptr_t)ptr, val, n);"
