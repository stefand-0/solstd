// std/math.sol — Mathematical utilities

pub abs(int n) out int
    return n < 0 ? -n : n

pub abs_float(float n) out float
    return n < 0.0 ? -n : n

pub max(int a, int b) out int
    return a > b ? a : b

pub min(int a, int b) out int
    return a < b ? a : b

pub clamp(int val, int min_val, int max_val) out int
    return val < min_val ? min_val : val > max_val ? max_val : val

pub pow(int base, int exp) out int
    int result -> 1
    for (int i -> 0; i < exp; i++)
        result -> result * base
    return result

pub is_even(int n) out bool
    return n % 2 == 0

pub is_odd(int n) out bool
    return n % 2 != 0

pub factorial(int n) out int
    if (n <= 1)
        return 1
    return n * factorial(n - 1)

pub gcd(int a, int b) out int
    while (b != 0)
        int temp -> b
        b -> a % b
        a -> temp
    return a

pub fibonacci(int n) out int
    if (n <= 0)
        return 0
    if (n == 1)
        return 1
    int a -> 0
    int b -> 1
    for (int i -> 2; i <= n; i++)
        int temp -> a + b
        a -> b
        b -> temp
    return b
