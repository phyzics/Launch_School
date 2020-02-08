use std::collections::HashMap;

fn main() {
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
}

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
