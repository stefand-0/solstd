// std/flags.sol — Command-line flag parsing (very minimal)

pub has_flag(int argc, int[] argv, string flag) out bool
    // argv is int[] of pointers — this is a hack
    C -> "for (int i = 1; i < argc; i++) {"
    C -> "    if (strcmp((char*)argv[i], flag) == 0) return true;"
    C -> "}"
    return false

pub get_flag_value(int argc, int[] argv, string flag) out string
    // Returns value after flag: --name John
    C -> "for (int i = 1; i < argc - 1; i++) {"
    C -> "    if (strcmp((char*)argv[i], flag) == 0)"
    C -> "        return (char*)argv[i + 1];"
    C -> "}"
    return ""
