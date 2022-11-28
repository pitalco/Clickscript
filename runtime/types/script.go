package types

type Script struct {
	FileName string `json:"file_name"`
	Script   []Line `json:"script"`
}

type Line struct {
	Action     Action `json:"action"`
	Notes      string `json:"notes"`
	LineNumber int    `json:"line"`
}
