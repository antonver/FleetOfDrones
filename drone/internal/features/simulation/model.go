package simulation

type DronState{
	ID string `json:"id"`
	Status string `json:"status"`
	BatteryCharge string `json:"battery_charge"`
	Version float64 `json:"version"`
	X float64 `json:"x"`
	Y float64 `json:"y"`
	Z float64 `json:"z`
	MaxKg float64 `json:"max_kg"`
	Model string `json:"moder"`
}

type CommandRequest struct {
	TargetX float64 `json: "target_x`
	TartgetY float64 `json: target_y`
	TargetZ float64 `json target_z`
}