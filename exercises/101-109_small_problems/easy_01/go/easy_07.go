package main

import "fmt"

func stringy(num int) string {
	i := 0
	str := ""

	for i < num {
		if i%2 == 0 {
			str += "1"
		} else {
			str += "0"
		}

		i++
	}

	return str
}

func main() {
	fmt.Println(stringy(6))
	fmt.Println(stringy(9))
	fmt.Println(stringy(4))
	fmt.Println(stringy(7))
}
