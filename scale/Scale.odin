package scale

import "../expanse"

Scale :: struct {
    domain: expanse.Expanse,
    codomain: expanse.Expanse
}

new :: proc(domain: expanse.Expanse, codomain: expanse.Expanse) -> Scale {
    return Scale{domain, codomain}
}

pushforward :: proc(scale: Scale, value: expanse.Value) -> (expanse.Value, bool) {
    v, ok := expanse.normalize(scale.domain, value)
    if (!ok) do return 0, false

    return expanse.unnormalize(scale.codomain, v), true
}

pullback :: proc(scale: Scale, value: expanse.Value) -> (expanse.Value, bool) {
    v, ok := expanse.normalize(scale.codomain, value)

    if (!ok) do return 0, false

    return expanse.unnormalize(scale.domain, v), true
}