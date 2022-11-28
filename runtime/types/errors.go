package types

import (
	"errors"
)

var (
	ErrArgNotFound  = errors.New("arg not found")
	ErrTypeNotFound = errors.New("type not found")
	ErrUndefined    = errors.New("undefined")
)
