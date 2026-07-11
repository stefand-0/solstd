// std/color.sol — RGB color utilities

struct Color
    uint8 r
    uint8 g
    uint8 b

pub rgb(int r, int g, int b) out Color
    Color c
    c.r -> r
    c.g -> g
    c.b -> b
    return c

pub hex(string hex_str) out Color
    // Stub — parse "#RRGGBB" string
    return rgb(0, 0, 0)

pub red() out Color
    return rgb(255, 0, 0)

pub green() out Color
    return rgb(0, 255, 0)

pub blue() out Color
    return rgb(0, 0, 255)

pub white() out Color
    return rgb(255, 255, 255)

pub black() out Color
    return rgb(0, 0, 0)

pub lerp(Color a, Color b, float t) out Color
    Color result
    result.r -> a.r + (b.r - a.r) * t
    result.g -> a.g + (b.g - a.g) * t
    result.b -> a.b + (b.b - a.b) * t
    return result
