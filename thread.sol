// std/thread.sol — Threading utilities (placeholder)
// Real threading needs pthreads or Windows threads.

pub spawn(int func_ptr) out int
    // func_ptr is a raw function pointer cast to int
    C -> "pthread_t thread;"
    C -> "pthread_create(&thread, NULL, (void*(*)(void*))func_ptr, NULL);"
    C -> "int result = (int)(intptr_t)thread;"
    return result

pub join(int thread_id)
    C -> "pthread_join((pthread_t)(intptr_t)thread_id, NULL);"

pub sleep_ms(int ms)
    C -> "#ifdef _WIN32"
    C -> "    Sleep(ms);"
    C -> "#else"
    C -> "    usleep(ms * 1000);"
    C -> "#endif"

pub current_thread_id() out int
    C -> "int result = (int)(intptr_t)pthread_self();"
    return result
