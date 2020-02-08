// What's my Bonus?
fn main() {
    println!("{}", calculate_bonus(2800, true) == 1400);
    println!("{}", calculate_bonus(1000, false) == 0);
    println!("{}", calculate_bonus(50000, true) == 25000);
}

fn calculate_bonus(salary: i32, bonus: bool) -> i32 {
    if bonus {
        salary / 2
    } else {
        0
    }
}
