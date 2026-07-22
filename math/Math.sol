// Constants:
imm pi: float -> 3.141592653589793
imm e: float -> 2.718281828459045
imm tau: float -> 6.283185307179586

fun sq(n: integer): integer 
  ret n * n
end

fun cube(n: integer): integer
  ret n * n * n
end

fun isEven(n: integer): boolean
  ret (n % 2) == 0
end

fun isOdd(n: integer): boolean
  ret (n % 2) != 0
end

fun abs(n: integer): integer
  if (n < 0)
    ret -n
  end
  ret n
end

fun factorial(n: integer): integer
  if (n <= 1)
    ret 1
  end
  ret n * factorial(n - 1)
end

fun sign(x: float): float
  if (x > 0.0)
    ret 1.0
  elseif (x < 0.0)
    ret -1.0
  end
  ret x
end

fun min(a: float, b: float): float
  if (a < b)
    ret a
  end
  ret b
end

fun max(a: float, b: float): float
    if (a > b)
        ret a
    end
    ret b
end

fun clamp(val: float, min_val: float, max_val: float): float
    if (val < min_val)
        ret min_val
    elseif (val > max_val)
        ret max_val
    end
    ret val
end

// Square root, but Newton's method!!

fun sqrt(x: float): float
    if (x <= 0.0)
        ret 0.0
    end
    nonimm guess: float -> x / 2.0
    nonimm i: integer -> 0
    while (i < 20)
        guess -> (guess + x / guess) / 2.0
        i -> i + 1
    end
    ret guess
end

// Game + graphics helpers

fun lerp(a: float, b: float, t: float): float
    ret a + (b - a) * t
end

fun deg2rad(deg: float): float
    ret deg * (PI / 180.0)
end

fun rad2deg(rad: float): float
    ret rad * (180.0 / PI)
end


// Trigonometry::

fun sin(x: float): float
    // Normalize angle to -PI..PI
    nonimm rad: float -> x % TAU
    if (rad > PI)
        rad -> rad - TAU
    end

    // Polynomial approximation
    imm term1: float -> rad
    imm term2: float -> (rad ** 3.0) / 6.0
    imm term3: float -> (rad ** 5.0) / 120.0
    imm term4: float -> (rad ** 7.0) / 5040.0

    ret term1 - term2 + term3 - term4
end

fun cos(x: float): float
    ret sin(x + (PI / 2.0))
end
