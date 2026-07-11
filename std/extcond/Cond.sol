when(a, b, action)
  _get("solstd/std/extdata/Infinity.sol")
  j -> Infinity.new()
  for i -> 0 to j
    a == b ? _return -> action
  end
end

forif(f, check1, check2, op, out)
  for i -> 0 to f
    if op = "="
      if check1 = check2
        _return -> out
      end
    end
    if op = "<"
      if check1 < check2
        _return -> out
      end
    end
    if op = ">"
      if check1 > check2
        _return -> out
      end
    end
  end 
end