// std/net.sol — Minimal networking (placeholder)
// Real networking needs sockets — use C -> "..." for full control.

pub http_get(string url) out string
    // This is a stub. Use libcurl via C -> "..." for real HTTP.
    C -> "// TODO: curl_easy_init(), curl_easy_setopt(), etc."
    return "TODO"

pub tcp_connect(string host, int port) out int
    C -> "int sock = socket(AF_INET, SOCK_STREAM, 0);"
    C -> "// ... setsockopt, connect, etc."
    C -> "int result = sock;"
    return result
