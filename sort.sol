// std/sort.sol — Sorting algorithms

pub bubble_sort(int[] arr, int len)
    for (int i -> 0; i < len - 1; i++)
        for (int j -> 0; j < len - i - 1; j++)
            if (arr[j] > arr[j + 1])
                int temp -> arr[j]
                arr[j] -> arr[j + 1]
                arr[j + 1] -> temp

pub selection_sort(int[] arr, int len)
    for (int i -> 0; i < len - 1; i++)
        int min_idx -> i
        for (int j -> i + 1; j < len; j++)
            if (arr[j] < arr[min_idx])
                min_idx -> j
        int temp -> arr[i]
        arr[i] -> arr[min_idx]
        arr[min_idx] -> temp

pub is_sorted(int[] arr, int len) out bool
    for (int i -> 1; i < len; i++)
        if (arr[i - 1] > arr[i])
            return false
    return true
