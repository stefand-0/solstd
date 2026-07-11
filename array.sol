// std/array.sol — Array manipulation utilities

pub length(int[] arr) out int
    // Arrays in Sol are pointers — we can't get true length
    // This is a placeholder. Track length separately.
    return 0

pub sum(int[] arr, int len) out int
    int total -> 0
    for (int i -> 0; i < len; i++)
        total -> total + arr[i]
    return total

pub max_in_array(int[] arr, int len) out int
    int max_val -> arr[0]
    for (int i -> 1; i < len; i++)
        if (arr[i] > max_val)
            max_val -> arr[i]
    return max_val

pub min_in_array(int[] arr, int len) out int
    int min_val -> arr[0]
    for (int i -> 1; i < len; i++)
        if (arr[i] < min_val)
            min_val -> arr[i]
    return min_val

pub reverse(int[] arr, int len)
    for (int i -> 0; i < len / 2; i++)
        int temp -> arr[i]
        arr[i] -> arr[len - 1 - i]
        arr[len - 1 - i] -> temp

pub contains(int[] arr, int len, int val) out bool
    for (int i -> 0; i < len; i++)
        if (arr[i] == val)
            return true
    return false

pub fill(int[] arr, int len, int val)
    for (int i -> 0; i < len; i++)
        arr[i] -> val
