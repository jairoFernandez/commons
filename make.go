package main

import (
	"flag"
	"fmt"
	"os/exec"
)

type Color string

const (
	ColorBlack  Color = "\u001b[30m"
	ColorRed          = "\u001b[31m"
	ColorGreen        = "\u001b[32m"
	ColorYellow       = "\u001b[33m"
	ColorBlue         = "\u001b[34m"
	ColorReset        = "\u001b[0m"
)

func colorize(color Color, message string) {
	fmt.Println(string(color), message, string(ColorReset))
}

func main() {
	// useColor := flag.Bool("color", false, "display colorized output")
	flag.Parse()

	colorize(ColorGreen, "-------------------")
	colorize(ColorGreen, "🙌 CircuitBooking")
	colorize(ColorGreen, "-------------------")

	cmdStr := "docker-compose ps"
	out, _ := exec.Command("/bin/sh", "-c", cmdStr).Output()
	fmt.Printf("%s", out)
	return
}
