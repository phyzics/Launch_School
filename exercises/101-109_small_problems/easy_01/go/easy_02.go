package main

import "fmt"

func is_odd(num int) bool  {
  return num % 2 != 0
}

func main() {
  fmt.Println(is_odd(2) == false)
  fmt.Println(is_odd(5) == true)
  fmt.Println(is_odd(-17) == true)
  fmt.Println(is_odd(-8) == false)
  fmt.Println(is_odd(0) == false)
  fmt.Println(is_odd(7) == true)
}
