launch(function, amount, returnval)
  for i -> 1 to amount
    _call(function) >> _async
  end
  _return -> returnval
end