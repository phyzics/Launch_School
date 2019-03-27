package main

import (
	"fmt"
	"strings"
)

func reverseWords(s string) string {
	words := strings.Split(s, " ")
	reversed := []string{}

	for _, word := range words {
		if len([]rune(word)) > 4 {
			runes := []rune(word)

			for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
				runes[i], runes[j] = runes[j], runes[i]
			}

			word = string(runes)
		}

		reversed = append(reversed, word)
	}

	return strings.Join(reversed, " ")
}

func main() {
	fmt.Println(reverseWords("Professional"))
	fmt.Println(reverseWords("Walk around the block"))
	fmt.Println(reverseWords("Launch School"))
}
