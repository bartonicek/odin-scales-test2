package main

import "core:fmt"
import "expanse"
import "scale"

main :: proc() {


    exp1 := expanse.point([]string{"foo", "bar"})
    exp2 := expanse.continuous(0, 800)

    scale1 := scale.new(exp1, exp2)

    fmt.println(scale.pushforward(scale1, "foo")) // 266.666, true
    fmt.println(scale.pullback(scale1, 266)) // "foo", true

    // Test 10% margins on each side
    exp3 := expanse.continuous(1, 10)
    scale2 := scale.new(exp3, exp2)

    fmt.println(scale.pushforward(scale2, 5))

    scale2.zero = 0.1
    scale2.one = 0.9

    fmt.println(scale.pushforward(scale2, 5))

}