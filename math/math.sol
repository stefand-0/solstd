pub pi() out float
    return 3.14159265

pub abs(float x) out float
    if x < 0.0
        return -x
    return x

pub max(float a, float b) out float
    if a > b
        return a
    return b

pub min(float a, float b) out float
    if a < b
        return a
    return b

pub clamp(float x, float lo, float hi) out float
    if x < lo
        return lo
    if x > hi
        return hi
pub lerp(float a, float b, float t) out float
    return a + (b - a) * t
    
pub sqrt(float x) out float
    float r -> 0.0
    C -> "r = sqrtf(x);"
    return r

pub sin(float x) out float
    float r -> 0.0
    C -> "r = sinf(x);"
    return r

pub cos(float x) out float
    float r -> 0.0
    C -> "r = cosf(x);"
    return r

pub atan2(float x, float y) out float
    float r -> 0.0
    C -> "r = atan2f(x, y);"
    return r
