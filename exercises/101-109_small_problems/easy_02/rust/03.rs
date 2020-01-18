// Tip calculator
use std::io::{stdin,stdout,Write};

fn main() {
    println!("What is the bill? ");
    let mut bill_str = String::new();
    let _ = stdout().flush();
    stdin()
        .read_line(&mut bill_str)
        .expect("Could not read line");
    bill_str = bill_str.trim().to_string();
    let bill = bill_str.parse::<f64>().unwrap();

    println!("What is the tip percentage? ");
    let mut tip_percent_str = String::new();
    let _ = stdout().flush();
    stdin()
        .read_line(&mut tip_percent_str)
        .expect("Could not read line");
    tip_percent_str = tip_percent_str.trim().to_string();
    let mut tip_percent = tip_percent_str.parse::<f64>().unwrap();
    tip_percent = tip_percent / 100.00;

    let tip = bill * tip_percent;
    let total = bill + tip;
    println!("The tip is ${:.1}", tip);
    println!("The total is ${:.1}", total);
}
