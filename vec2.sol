// std/vec2.sol — 2D vector math

struct Vec2
    float x
    float y

pub vec2_add(Vec2 a, Vec2 b) out Vec2
    Vec2 result
    result.x -> a.x + b.x
    result.y -> a.y + b.y
    return result

pub vec2_sub(Vec2 a, Vec2 b) out Vec2
    Vec2 result
    result.x -> a.x - b.x
    result.y -> a.y - b.y
    return result

pub vec2_mul(Vec2 v, float scalar) out Vec2
    Vec2 result
    result.x -> v.x * scalar
    result.y -> v.y * scalar
    return result

pub vec2_dot(Vec2 a, Vec2 b) out float
    return a.x * b.x + a.y * b.y

pub vec2_length(Vec2 v) out float
    // No sqrt yet — simplified
    return v.x * v.x + v.y * v.y

pub vec2_normalize(Vec2 v) out Vec2
    float len -> vec2_length(v)
    if (len == 0.0)
        return v
    return vec2_mul(v, 1.0 / len)

pub vec2_distance(Vec2 a, Vec2 b) out float
    float dx -> a.x - b.x
    float dy -> a.y - b.y
    return dx * dx + dy * dy
