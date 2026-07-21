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
