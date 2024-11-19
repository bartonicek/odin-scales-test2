package scale

import "core:fmt"
import "../expanse"

Scale :: struct {
    domain: expanse.Expanse,
    codomain: expanse.Expanse,

    zero: f64,
    one: f64,
}

new :: proc(domain: expanse.Expanse, codomain: expanse.Expanse) -> Scale {
    zero, one := 0.0, 1.0
    return Scale{domain, codomain, zero, one}
}

pushforward :: proc(scale: Scale, value: expanse.Value) -> (expanse.Value, bool) {
    v, ok := expanse.normalize(scale.domain, value)
    if (!ok) do return 0, false

    v = apply_props_forward(scale, v)

    return expanse.unnormalize(scale.codomain, v), true
}

pullback :: proc(scale: Scale, value: expanse.Value) -> (expanse.Value, bool) {
    v, ok := expanse.normalize(scale.codomain, value)

    if (!ok) do return 0, false

    return expanse.unnormalize(scale.domain, v), true
}

apply_props_forward :: proc(scale: Scale, value: f64) -> f64 {
    return (value - scale.zero) * (scale.one - scale.zero)
}