// std/io.sol — Input/Output utilities

pub println(string msg)
    out("%s\n", msg)

pub print_int(int val)
    out("%d", val)

pub print_float(float val)
    out("%.2f", val)

pub print_bool(bool val)
    out("%s\n", val ? "true" : "false")

pub read_int(string prompt) out int
    out("%s", prompt)
    int result
    in(result)
    return result

pub read_string(string prompt) out string
    out("%s", prompt)
    string result
    in(result)
    return result
