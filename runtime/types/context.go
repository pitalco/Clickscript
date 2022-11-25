package types

type Context struct {
	Memory map[string]interface{}
}

func NewContext() Context {
	mem := make(map[string]interface{})
	return Context{
		Memory: mem,
	}
}
