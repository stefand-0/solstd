// ============================================================
//  RaySync -- Sol Async Futures
//  _get("solstd/raysync/async.sol") at the top of the program
// ============================================================

// --- Struct -------------------------------------------------------
Future{}
    val -> 0
    done -> 0
end

// --- Primitives ----------------------------------------------

ray_alloc()
    f -> Future{}
    _return -> f
end

ray_promise(fut, value)
    fut.val -> value
    fut.done -> 1
end

ray_ready(fut)
    _return -> fut.done
end

ray_get(fut)
    _return -> fut.val
end

ray_await(fut)
    while ray_ready(fut) = 0
        _sleep(10)
    end
    _return -> ray_get(fut)
end

// --- Combinators --------------------------------------------------

ray_join2(a, b)
    while ray_ready(a) = 0
        _sleep(10)
    end
    while ray_ready(b) = 0
        _sleep(10)
    end
    _return -> 1
end

ray_join3(a, b, c)
    while ray_ready(a) = 0
        _sleep(10)
    end
    while ray_ready(b) = 0
        _sleep(10)
    end
    while ray_ready(c) = 0
        _sleep(10)
    end
    _return -> 1
end

ray_race2(a, b)
    while 1 = 1
        if ray_ready(a) = 1
            _return -> a
        end
        if ray_ready(b) = 1
            _return -> b
        end
        _sleep(10)
    end
end

ray_race3(a, b, c)
    while 1 = 1
        if ray_ready(a) = 1
            _return -> a
        end
        if ray_ready(b) = 1
            _return -> b
        end
        if ray_ready(c) = 1
            _return -> c
        end
        _sleep(10)
    end
end
