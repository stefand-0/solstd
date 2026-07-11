// std/vec2.sol — 2D vector math

struct Vec2
    float x
    float y

pub vec2(float x, float y) out Vec2
    Vec2 v
    v.x -> x
    v.y -> y
    return v

pub vec2_add(Vec2 a, Vec2 b) out Vec2
    return vec2(a.x + b.x, a.y + b.y)

pub vec2_sub(Vec2 a, Vec2 b) out Vec2
    return vec2(a.x - b.x, a.y - b.y)

pub vec2_mul(Vec2 v, float s) out Vec2
    return vec2(v.x * s, v.y * s)

pub vec2_div(Vec2 v, float s) out Vec2
    return vec2(v.x / s, v.y / s)

pub vec2_neg(Vec2 v) out Vec2
    return vec2(-v.x, -v.y)

pub vec2_dot(Vec2 a, Vec2 b) out float
    return a.x * b.x + a.y * b.y

pub vec2_cross(Vec2 a, Vec2 b) out float
    return a.x * b.y - a.y * b.x

pub vec2_len_sq(Vec2 v) out float
    return v.x * v.x + v.y * v.y

pub vec2_dist_sq(Vec2 a, Vec2 b) out float
    float dx -> a.x - b.x
    float dy -> a.y - b.y
    return dx * dx + dy * dy

pub vec2_perp(Vec2 v) out Vec2
    return vec2(-v.y, v.x)

pub vec2_lerp(Vec2 a, Vec2 b, float t) out Vec2
    return vec2(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t)

pub vec2_min(Vec2 a, Vec2 b) out Vec2
    float x -> a.x < b.x ? a.x : b.x
    float y -> a.y < b.y ? a.y : b.y
    return vec2(x, y)

pub vec2_max(Vec2 a, Vec2 b) out Vec2
    float x -> a.x > b.x ? a.x : b.x
    float y -> a.y > b.y ? a.y : b.y
    return vec2(x, y)

pub vec2_floor(Vec2 v) out Vec2
    float x -> 0.0
    float y -> 0.0
    C -> "x = floorf(v.x);"
    C -> "y = floorf(v.y);"
    return vec2(x, y)

pub vec2_ceil(Vec2 v) out Vec2
    float x -> 0.0
    float y -> 0.0
    C -> "x = ceilf(v.x);"
    C -> "y = ceilf(v.y);"
    return vec2(x, y)

pub vec2_round(Vec2 v) out Vec2
    float x -> 0.0
    float y -> 0.0
    C -> "x = roundf(v.x);"
    C -> "y = roundf(v.y);"
    return vec2(x, y)

pub vec2_abs(Vec2 v) out Vec2
    float x -> v.x < 0.0 ? -v.x : v.x
    float y -> v.y < 0.0 ? -v.y : v.y
    return vec2(x, y)

pub vec2_eq(Vec2 a, Vec2 b) out int
    return a.x == b.x && a.y == b.y

pub vec2_zero() out Vec2
    return vec2(0.0, 0.0)

pub vec2_one() out Vec2
    return vec2(1.0, 1.0)

pub vec2_up() out Vec2
    return vec2(0.0, 1.0)

pub vec2_right() out Vec2
    return vec2(1.0, 0.0)