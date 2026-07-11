// solstd/math/math.sol

pi() out float
    return 3.14159265

e() out float
    return 2.71828183

tau() out float
    return 6.28318531

abs_f(float x) out float
    if x < 0.0
        return -x
    return x

max(float a, float b) out float
    if a > b
        return a
    return b

min(float a, float b) out float
    if a < b
        return a
    return b

clamp(float x, float lo, float hi) out float
    if x < lo
        return lo
    if x > hi
        return hi
    return x

lerp(float a, float b, float t) out float
    return a + (b - a) * t

fsqrt(float x) out float
    float r -> 0.0
    C -> "r = sqrtf(x);"
    return r

fsin(float x) out float
    float r -> 0.0
    C -> "r = sinf(x);"
