// Stringy Strings
fn main() {
    println!("{}", stringy(6) == "101010");
    println!("{}", stringy(9) == "101010101");
    println!("{}", stringy(4) == "1010");
    println!("{}", stringy(7) == "1010101");
}

fn stringy(l: i32) -> String {
    let mut result = "".to_string();

    for n in 0..l {
        if n % 2 == 0 {
            result = result + "1";
        } else {
            result = result + "0";
        }
    }

    result
}
