// std/crypto.sol — Cryptographic utilities (placeholder)
// NEVER use these for real security, they're educational only!

pub hash_string(string s) out int
    // Dumb hash — not cryptographically secure!
    int hash -> 5381
    int i -> 0
    while (s[i] != '\0')
        hash -> ((hash << 5) + hash) + s[i]
        i++
    return hash

pub xor_encrypt(string data, string key) out string
    // XOR cipher — trivially broken, demo only!
    C -> "int len = strlen(data);"
    C -> "int key_len = strlen(key);"
    C -> "for (int i = 0; i < len; i++) data[i] ^= key[i % key_len];"
    return data

pub simple_checksum(int[] data, int len) out int
    int sum -> 0
    for (int i -> 0; i < len; i++)
        sum -> sum + data[i]
    return sum & 0xFFFF
