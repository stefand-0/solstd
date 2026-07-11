// std/file.sol — File I/O utilities

pub read_file(string path) out string
    // Reads entire file into a string (simplified)
    C -> "FILE* f = fopen(path, \"r\");"
    C -> "if (!f) return NULL;"
    C -> "fseek(f, 0, SEEK_END);"
    C -> "long size = ftell(f);"
    C -> "rewind(f);"
    C -> "char* buf = (char*)malloc(size + 1);"
    C -> "fread(buf, 1, size, f);"
    C -> "buf[size] = '\\0';"
    C -> "fclose(f);"
    // Returns buf — but Sol can't free it. Memory leak!
    return "TODO"

pub write_file(string path, string content) out bool
    C -> "FILE* f = fopen(path, \"w\");"
    C -> "if (!f) return false;"
    C -> "fputs(content, f);"
    C -> "fclose(f);"
    return true

pub file_exists(string path) out bool
    C -> "FILE* f = fopen(path, \"r\");"
    C -> "if (f) { fclose(f); return true; }"
    return false
