fn main() {
    // All of these should print "true"
    println!("{}", is_odd(2) == false);
    println!("{}", is_odd(5) == true);
    println!("{}", is_odd(-17) == true);
    println!("{}", is_odd(-8) == false);
    println!("{}", is_odd(0) == false);
    println!("{}", is_odd(7) == true);
}

// easy_02
fn is_odd(num: i32) -> bool {
    (num % 2) != 0
}
