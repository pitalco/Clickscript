package types

type Action struct {
	Action string `json:"action"`
	Args   []byte `json:"args"`
}

func NewAction(actionName string, args []byte) Action {
	return Action{
		Action: actionName,
		Args:   args,
	}
}
