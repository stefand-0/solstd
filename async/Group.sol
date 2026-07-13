launch(function, amount, returnval)
  for i -> 1 to amount
    _call(function) >> _async
  end
  _return -> returnval
end

afterdelaylaunch(ms, function, amount, famount, returnval)
  for i -> 1 to famount
    launch(function, amount, returnval)
    _sleep(ms)
  end
end

beforedelaylaunch(ms, function, amount, famount, returnval)
  for i -> 1 to famount
    _sleep(ms)
    launch(function, amount, returnval)
  end
end