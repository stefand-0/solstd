import "solstd/math/math.sol" as math

fun vec2(x: float, y: float): list
  ret [x, y]
end

fun vec3(x: float, y: float, z: float): list
  ret [x, y, z]
end

fun add(a: list, b: list): list
    if (list.len(a) == 2)
        ret [a[0] + b[0], a[1] + b[1]]
    end
    ret [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
end

fun sub(a: list, b: list): list
    if (list.len(a) == 2)
        ret [a[0] - b[0], a[1] - b[1]]
    end
    ret [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
end

fun scale(v: list, s: float): list
    if (list.len(v) == 2)
        ret [v[0] * s, v[1] * s]
    end
    ret [v[0] * s, v[1] * s, v[2] * s]
end

fun div(v: list, s: float): list
    if (s == 0.0)
        ret v
    end
    ret scale(v, 1.0 / s)
end

fun dot(a: list, b: list): float
    if (list.len(a) == 2)
        ret (a[0] * b[0]) + (a[1] * b[1])
    end
    ret (a[0] * b[0]) + (a[1] * b[1]) + (a[2] * b[2])
end

fun cross(a: list, b: list): list
    // 3D Cross Product
    imm cx: float -> (a[1] * b[2]) - (a[2] * b[1])
    imm cy: float -> (a[2] * b[0]) - (a[0] * b[2])
    imm cz: float -> (a[0] * b[1]) - (a[1] * b[0])
    ret [cx, cy, cz]
end

fun mag_sq(v: list): float
    ret dot(v, v)
end

fun mag(v: list): float
    ret math.sqrt(mag_sq(v))
end

fun norm(v: list): list
    imm len: float -> mag(v)
    if (len == 0.0)
        ret v
    end
    ret div(v, len)
end

fun dist(a: list, b: list): float
    ret mag(sub(b, a))
end

fun lerp(a: list, b: list, t: float): list
    // Vector linear interpolation
    imm diff: list -> sub(b, a)
    ret add(a, scale(diff, t))
end

fun rotate2d(v: list, angle_rad: float): list
    imm cos_a: float -> math.cos(angle_rad)
    imm sin_a: float -> math.sin(angle_rad)
    imm nx: float -> (v[0] * cos_a) - (v[1] * sin_a)
    imm ny: float -> (v[0] * sin_a) + (v[1] * cos_a)
    ret [nx, ny]
end

// --- 3D Rotations ---

// Rotate 3D vector around X-axis
fun rotate_x(v: list, angle_rad: float): list
    imm cos_a: float -> math.cos(angle_rad)
    imm sin_a: float -> math.sin(angle_rad)
    imm ny: float -> (v[1] * cos_a) - (v[2] * sin_a)
    imm nz: float -> (v[1] * sin_a) + (v[2] * cos_a)
    ret [v[0], ny, nz]
end

// Rotate 3D vector around Y-axis
fun rotate_y(v: list, angle_rad: float): list
    imm cos_a: float -> math.cos(angle_rad)
    imm sin_a: float -> math.sin(angle_rad)
    imm nx: float -> (v[0] * cos_a) + (v[2] * sin_a)
    imm nz: float -> (-v[0] * sin_a) + (v[2] * cos_a)
    ret [nx, v[1], nz]
end

// Rotate 3D vector around Z-axis
fun rotate_z(v: list, angle_rad: float): list
    imm cos_a: float -> math.cos(angle_rad)
    imm sin_a: float -> math.sin(angle_rad)
    imm nx: float -> (v[0] * cos_a) - (v[1] * sin_a)
    imm ny: float -> (v[0] * sin_a) + (v[1] * cos_a)
    ret [nx, ny, v[2]]
end

fun rotate3d(v: list, axis: list, angle_rad: float): list
    imm cos_a: float -> math.cos(angle_rad)
    imm sin_a: float -> math.sin(angle_rad)
    imm k: list -> norm(axis) // Normalize axis to a unit vector
    
    // Rodrigues' formula: v_rot = v*cos(a) + (k x v)*sin(a) + k*(k . v)*(1 - cos(a))
    imm term1: list -> scale(v, cos_a)
    imm term2: list -> scale(cross(k, v), sin_a)
    imm k_dot_v: float -> dot(k, v)
    imm term3: list -> scale(k, k_dot_v * (1.0 - cos_a))

    ret add(add(term1, term2), term3)
end
