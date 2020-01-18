// How big is the room?
use std::io::{stdin,stdout,Write};

fn main() {
    const METER_TO_FEET: f64 = 10.7639;
    println!("Enter the length of the room in meters:\n");
    let mut len_str = String::new();
    let _ = stdout().flush();
    stdin()
        .read_line(&mut len_str)
        .expect("Did not enter a string");
    len_str = len_str.trim().to_string();
    println!("Enter the width of the room in meters:\n");
    let mut w_str = String::new();
    let _ = stdout().flush();
    stdin()
        .read_line(&mut w_str)
        .expect("Did not enter a string");
    w_str = w_str.trim().to_string();
    let l = len_str.parse::<f64>().unwrap();
    let w = w_str.parse::<f64>().unwrap();
    let sq_mtr = l * w;
    let sq_ft = sq_mtr * METER_TO_FEET;
    println!("The area of the room is {:.2} square meters ({:.2} square feeet).", sq_mtr, sq_ft);
}
