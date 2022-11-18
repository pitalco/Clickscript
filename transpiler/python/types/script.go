package types

type Script struct {
	FileName string   `json:"file_name"`
	Script   []Action `json:"script"`
	Length   uint64   `json:"length"`
}
