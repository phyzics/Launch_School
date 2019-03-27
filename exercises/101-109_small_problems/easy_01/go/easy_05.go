package main

import (
	"fmt"
	"strings"
)

func reverseSentence(s string) string {
	words := strings.Split(s, " ")
	reversed := []string{}

	for i := len(words) - 1; i >= 0; i-- {
		reversed = append(reversed, words[i])
	}

	return strings.Join(reversed, " ")
}

func main() {
	fmt.Println(reverseSentence(""))
	fmt.Println(reverseSentence("Hello World"))
	fmt.Println(reverseSentence("Reverse these words"))
}
