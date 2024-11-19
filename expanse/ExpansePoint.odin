package expanse

import "core:math"

ExpansePoint :: struct {
	labels: []string,
}

@(private)
normalize_point :: proc(expanse: ExpansePoint, value: Value) -> (f64, bool) {
    v, ok := value.(string)
	if (!ok) do return 0, false

	index := findIndex(expanse.labels, v)
	normalized := f64(index + 1) / f64(len(expanse.labels) + 1)
    
    return normalized, true
}

@(private)
unnormalize_point :: proc(expanse: ExpansePoint, value: f64) -> Value {
	value := f64(value) * f64((len(expanse.labels) + 1)) - 1.0
	index := int(math.round(value)) // This gives the wrong result for value < (1 / len) but let's ignore that for now

    return expanse.labels[index]
}

findIndex :: proc(slice: []$T, value: T) -> int {
	for i := 0; i < len(slice); i += 1 {
		if (slice[i] == value) {return i}
	}
	return -1
}
