// std/json.sol — Minimal JSON utilities (placeholder)
// Full JSON parsing requires dynamic memory — Sol is limited here.

pub parse_int_field(string json, string field) out int
    // Very naive: finds "field":123 and returns 123
    // Real JSON needs a full parser — use C -> "..." for cJSON, etc.
    C -> "char* p = strstr(json, field);"
    C -> "if (!p) return 0;"
    C -> "p = strchr(p, ':');"
    C -> "if (!p) return 0;"
    C -> "p++;"
    C -> "int result = atoi(p);"
    return result

pub bool_field_exists(string json, string field) out bool
    C -> "return strstr(json, field) != NULL ? true : false;"
    return false
