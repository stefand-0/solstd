// std/debug.sol — Debugging helpers

pub assert(bool condition, string msg)
    if (!condition)
        out("ASSERT FAILED: %s\n", msg)
        C -> "exit(1);"

pub assert_eq(int a, int b, string msg)
    if (a != b)
        out("ASSERT_EQ FAILED: %d != %d — %s\n", a, b, msg)
        C -> "exit(1);"

pub dump_int(string label, int val)
    out("[DEBUG] %s = %d\n", label, val)

pub dump_float(string label, float val)
    out("[DEBUG] %s = %.4f\n", label, val)

pub dump_bool(string label, bool val)
    out("[DEBUG] %s = %s\n", label, val ? "true" : "false")

pub dump_string(string label, string val)
    out("[DEBUG] %s = \"%s\"\n", label, val)

pub breakpoint()
    C -> "// Set a breakpoint here in your debugger"
    C -> "volatile int _trap = 0;"
    C -> "_trap = 1;"
