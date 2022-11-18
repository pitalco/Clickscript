package types

type Action struct {
	Order   uint64  `json:"order"`
	Action  string  `json:"action"`
	Args    []Arg   `json:"args"`
	Actions Actions `json:"actions"`
}

type Actions []Action

func NewAction(actionName string, args []Arg, actions Actions) Action {
	return Action{
		Action:  actionName,
		Args:    args,
		Actions: actions,
	}
}

func NewActions(actions ...Action) Actions {
	actionsList := Actions{}
	for _, action := range actions {
		actionsList = append(actionsList, action)
	}
	return actionsList
}
