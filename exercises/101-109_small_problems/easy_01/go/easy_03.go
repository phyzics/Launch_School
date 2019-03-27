package main

import (
	"fmt"
	"strconv"
	"strings"
)

func digitList(num int) []int {
	chars := strings.Split(strconv.Itoa(num), "")
	digits := []int{}

	for i := 0; i < len(chars); i++ {
		digit, _ := strconv.Atoi(chars[i])
		digits = append(digits, digit)
	}

	return digits
}

func main() {
	fmt.Println(digitList(12345))
	fmt.Println(digitList(7))
	fmt.Println(digitList(375290))
	fmt.Println(digitList(444))
}
