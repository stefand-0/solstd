// std/random.sol — Random number generation

// Seed the random number generator
pub seed(int s)
    C -> "srand((unsigned int)s);"

// Random integer in range [0, max)
pub rand_int(int max) out int
    C -> "int result = rand() % max;"
    return result

// Random float in range [0.0, 1.0)
pub rand_float() out float
    C -> "float result = (float)rand() / (float)RAND_MAX;"
    return result
