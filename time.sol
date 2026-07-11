// std/time.sol — Time utilities

pub sleep(int seconds)
    C -> "#ifdef _WIN32"
    C -> "    Sleep(seconds * 1000);"
    C -> "#else"
    C -> "    sleep(seconds);"
    C -> "#endif"

pub millis() out int
    C -> "#include <sys/time.h>"
    C -> "struct timeval tv;"
    C -> "gettimeofday(&tv, NULL);"
    C -> "int result = (int)(tv.tv_sec * 1000 + tv.tv_usec / 1000);"
    return result
