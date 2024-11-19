package expanse

ExpanseContinuous :: struct {
	min, max: f64,
}

@(private)
normalize_continuous :: proc(expanse: ExpanseContinuous, value: Value) -> (Normalized, bool) {
    v, ok := value.(f64)
	if !ok do return 0, false

    normalized := Normalized((v - expanse.min) / (expanse.max - expanse.min))
    return normalized, true
}

@(private)
unnormalize_continuous :: proc(expanse: ExpanseContinuous, value: Normalized) -> Value {
	return Value(expanse.min + f64(value) * (expanse.max - expanse.min))
}
