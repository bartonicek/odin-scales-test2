package expanse

Value :: union { f64, string, }
Expanse :: union { ExpanseContinuous, ExpansePoint }

continuous :: proc(min, max: f64) -> ExpanseContinuous {
    return ExpanseContinuous{min, max}
}

point :: proc(labels: []string) -> ExpansePoint {
    return ExpansePoint{labels}
}

normalize :: proc(expanse: Expanse, value: Value) -> (f64, bool) {
	switch e in expanse {
	case ExpanseContinuous:
		return normalize_continuous(e, value)
    case ExpansePoint:
        return normalize_point(e, value)
	case:
		panic("Unreachable")
	}
}

unnormalize :: proc(expanse: Expanse, value: f64) -> Value {
    switch e in expanse {
        case ExpanseContinuous:
            return unnormalize_continuous(e, value)
        case ExpansePoint:
            return unnormalize_point(e, value)
        case:
            panic("Unreachable")
    }
}