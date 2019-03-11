package main

import "fmt"

func countOccurrences(vehicles []string)  {
  count := map[string]int{}

  for _, v := range vehicles {
    count[v]++
  }

  for k, v := range count {
    fmt.Printf("%s => %v\n", k, v)
  }
}

func main() {
  vehicles := []string{"car", "car", "truck", "car", "SUV", "truck", "motorcycle", "motorcycle", "car", "truck"}

  countOccurrences(vehicles)
}
