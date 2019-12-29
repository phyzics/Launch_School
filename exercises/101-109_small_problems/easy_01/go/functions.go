package main

import (
	"fmt"
	"strconv"
	"strings"
)

// easy_01
func repeat(str string, num int) {
	for i := 0; i < num; i++ {
		fmt.Println(str)
	}
}

// easy_02
func isOdd(num int) bool {
	return num%2 != 0
}

// easy_03
func digitList(num int) []int {
	chars := strings.Split(strconv.Itoa(num), "")
	digits := []int{}

	for i := 0; i < len(chars); i++ {
		digit, _ := strconv.Atoi(chars[i])
		digits = append(digits, digit)
	}

	return digits
}

// easy_04
func countOccurrences(vehicles []string) {
	count := map[string]int{}

	for _, v := range vehicles {
		count[v]++
	}

	for k, v := range count {
		fmt.Printf("%s => %d\n", k, v)
	}
}

// easy_05
func reverseSentence(s string) string {
	words := strings.Split(s, " ")
	reversed := []string{}

	for i := len(words) - 1; i >= 0; i-- {
		reversed = append(reversed, words[i])
	}

	return strings.Join(reversed, " ")
}

// easy_06
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

// easy_07
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

// easy_08
func average(nums []int) int {
	l := len(nums)
	var sum int
	for _, n := range nums {
		sum += n
	}
	return sum / l
}
