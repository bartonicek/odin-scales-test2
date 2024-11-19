package expanse

ExpanseContinuous :: struct {
	min, max: f64,
}

@(private)
normalize_continuous :: proc(expanse: ExpanseContinuous, value: Value) -> (f64, bool) {
    v, ok := value.(f64)
	if !ok do return 0, false

    normalized := (v - expanse.min) / (expanse.max - expanse.min)
    return normalized, true
}

@(private)
unnormalize_continuous :: proc(expanse: ExpanseContinuous, value: f64) -> Value {
	return Value(expanse.min + f64(value) * (expanse.max - expanse.min))
}
