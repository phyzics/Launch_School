use std::collections::HashMap;

fn main() {
    // easy_01
    repeat("Hello", 3);
    println!("---");
    // easy_02
    // All of these should print "true"
    println!("{}", is_odd(2) == false);
    println!("{}", is_odd(5) == true);
    println!("{}", is_odd(-17) == true);
    println!("{}", is_odd(-8) == false);
    println!("{}", is_odd(0) == false);
    println!("{}", is_odd(7) == true);
    println!("---");
    // easy_03
    println!("{}", digit_list(12345) == [1, 2, 3, 4, 5]);
    println!("{}", digit_list(7) == [7]);
    println!("{}", digit_list(375290) == [3, 7, 5, 2, 9, 0]);
    println!("{}", digit_list(444) == [4, 4, 4]);
    println!("---");
    // easy_04
    count_occurences(&[
        String::from("car"),
        String::from("car"),
        String::from("truck"),
        String::from("car"),
        String::from("SUV"),
        String::from("truck"),
        String::from("motorcycle"),
        String::from("motorcycle"),
        String::from("car"),
        String::from("truck"),
    ]);
    println!("---");
    // easy_05
    println!("{}", reverse_sentence(""));
    println!("{}", reverse_sentence("Hello World"));
    println!("{}", reverse_sentence("Reverse these words"));
}

// easy_01
fn repeat(string: &str, times: i32) {
    for _n in 0..times {
        println!("{}", string)
    }
}

// easy_02
fn is_odd(num: i32) -> bool {
    (num % 2) != 0
}

// easy_03
fn digit_list(num: i32) -> Vec<i32> {
    let mut n = num;
    let mut list = vec![];

    loop {
        list.push(n % 10);
        n /= 10;
        if n == 0 {
            break;
        }
    }
    list.reverse();
    list
}

// easy_04
fn count_occurences(cars: &[String]) {
    let mut seen = HashMap::new();

    for car in cars {
        let count = seen.entry(car).or_insert(0);
        *count += 1;
    }

    for (k, v) in seen.iter() {
        println!("{} => {}", k, v)
    }
}

// easy_05
fn reverse_sentence(s: &str) -> String {
    let mut sen: Vec<&str> = s.split_whitespace().collect::<Vec<_>>();
    sen.reverse();
    sen.join(" ")
}

// easy_06
fn reverse_words(s: String) -> String {
    let mut words: Vec<&str> = s.split_whitespace().collect::<Vec<_>>();
    let mut i = 0;
    for word in words.iter() {
        if word.len() >= 5 {
            replace(words, word, i)
        }
        i += 1;
    }

    String::from("foo")
}

fn replace(words: Vec<&str>, word: &str, i: usize) {
    words[i] = word
}
