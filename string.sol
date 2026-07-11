// std/string.sol — String manipulation utilities

pub strlen(string s) out int
    int len -> 0
    while (s[len] != '\0')
        len++
    return len

pub str_equals(string a, string b) out bool
    int i -> 0
    while (a[i] != '\0' && b[i] != '\0')
        if (a[i] != b[i])
            return false
        i++
    return a[i] == b[i]

pub starts_with(string s, string prefix) out bool
    int i -> 0
    while (prefix[i] != '\0')
        if (s[i] != prefix[i])
            return false
        i++
    return true

pub char_at(string s, int index) out char
    return s[index]

pub int_to_string(int n) out string
    // Simplified — returns a C string via sprintf
    C -> "char buf[32];"
    C -> "sprintf(buf, \"%d\", n);"
    // This is a hack — real implementation needs buffer management
    return "TODO"
