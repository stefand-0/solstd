// std/vec3.sol — 3D vector math

struct Vec3
    float x
    float y
    float z

pub vec3(float x, float y, float z) out Vec3
    Vec3 v
    v.x -> x
    v.y -> y
    v.z -> z
    return v

pub vec3_add(Vec3 a, Vec3 b) out Vec3
    return vec3(a.x + b.x, a.y + b.y, a.z + b.z)

pub vec3_sub(Vec3 a, Vec3 b) out Vec3
    return vec3(a.x - b.x, a.y - b.y, a.z - b.z)

pub vec3_mul(Vec3 v, float s) out Vec3
    return vec3(v.x * s, v.y * s, v.z * s)

pub vec3_div(Vec3 v, float s) out Vec3
    return vec3(v.x / s, v.y / s, v.z / s)

pub vec3_neg(Vec3 v) out Vec3
    return vec3(-v.x, -v.y, -v.z)

pub vec3_dot(Vec3 a, Vec3 b) out float
    return a.x * b.x + a.y * b.y + a.z * b.z

pub vec3_cross(Vec3 a, Vec3 b) out Vec3
    float x -> a.y * b.z - a.z * b.y
    float y -> a.z * b.x - a.x * b.z
    float z -> a.x * b.y - a.y * b.x
    return vec3(x, y, z)

pub vec3_len_sq(Vec3 v) out float
    return v.x * v.x + v.y * v.y + v.z * v.z

pub vec3_dist_sq(Vec3 a, Vec3 b) out float
    float dx -> a.x - b.x
    float dy -> a.y - b.y
    float dz -> a.z - b.z
    return dx * dx + dy * dy + dz * dz

pub vec3_lerp(Vec3 a, Vec3 b, float t) out Vec3
    return vec3(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t, a.z + (b.z - a.z) * t)

pub vec3_min(Vec3 a, Vec3 b) out Vec3
    float x -> a.x < b.x ? a.x : b.x
    float y -> a.y < b.y ? a.y : b.y
    float z -> a.z < b.z ? a.z : b.z
    return vec3(x, y, z)

pub vec3_max(Vec3 a, Vec3 b) out Vec3
    float x -> a.x > b.x ? a.x : b.x
    float y -> a.y > b.y ? a.y : b.y
    float z -> a.z > b.z ? a.z : b.z
    return vec3(x, y, z)

pub vec3_floor(Vec3 v) out Vec3
    float x -> 0.0
    float y -> 0.0
    float z -> 0.0
    C -> "x = floorf(v.x);"
    C -> "y = floorf(v.y);"
    C -> "z = floorf(v.z);"
    return vec3(x, y, z)

pub vec3_ceil(Vec3 v) out Vec3
    float x -> 0.0
    float y -> 0.0
    float z -> 0.0
    C -> "x = ceilf(v.x);"
    C -> "y = ceilf(v.y);"
    C -> "z = ceilf(v.z);"
    return vec3(x, y, z)

pub vec3_round(Vec3 v) out Vec3
    float x -> 0.0
    float y -> 0.0
    float z -> 0.0
    C -> "x = roundf(v.x);"
    C -> "y = roundf(v.y);"
    C -> "z = roundf(v.z);"
    return vec3(x, y, z)

pub vec3_abs(Vec3 v) out Vec3
    float x -> v.x < 0.0 ? -v.x : v.x
    float y -> v.y < 0.0 ? -v.y : v.y
    float z -> v.z < 0.0 ? -v.z : v.z
    return vec3(x, y, z)

pub vec3_eq(Vec3 a, Vec3 b) out int
    return a.x == b.x && a.y == b.y && a.z == b.z

pub vec3_zero() out Vec3
    return vec3(0.0, 0.0, 0.0)

pub vec3_one() out Vec3
    return vec3(1.0, 1.0, 1.0)

pub vec3_up() out Vec3
    return vec3(0.0, 1.0, 0.0)

pub vec3_forward() out Vec3
    return vec3(0.0, 0.0, 1.0)

pub vec3_right() out Vec3
    return vec3(1.0, 0.0, 0.0)