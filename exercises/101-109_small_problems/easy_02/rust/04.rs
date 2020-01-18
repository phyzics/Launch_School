// When will I Retire?
use std::io::{stdin,stdout,Write};

fn main() {
    const CURRENT_YEAR: i32 = 2020;
    println!("What is your age? ");
    let mut age_str = String::new();
    let _ = stdout().flush();
    stdin()
        .read_line(&mut age_str)
        .expect("error: could not read stdin");
    age_str = age_str.trim().to_string();
    let age = age_str.parse::<i32>().unwrap();

    println!("At what age would you like to retire? ");
    let mut retire_str = String::new();
    let _ = stdout().flush();
    stdin()
        .read_line(&mut retire_str)
        .expect("error: could not read stdin");
    retire_str = retire_str.trim().to_string();
    let retire_age = retire_str.parse::<i32>().unwrap();
    let years_left = retire_age - age;

    println!("It's {}. You will retire in {}.", CURRENT_YEAR, CURRENT_YEAR + years_left);
    println!("You only have {} years of work to go!", years_left);
}
