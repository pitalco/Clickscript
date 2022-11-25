package types

type Script struct {
	FileName string `json:"file_name"`
	Script   []Line `json:"line"`
}

type Line struct {
	Action      Action `json:"action"`
	Description string `json:"description"`
}
