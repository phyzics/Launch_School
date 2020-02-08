// Sum of Digits
fn main() {
    println!("{}", sum(23) == 5);
    println!("{}", sum(496) == 19);
    println!("{}", sum(123_456_789) == 45);
}

fn sum(n: i32) -> i32 {
    let digits = digit_list(n);
    digits.iter().fold(0, |acc, x| acc + x)
}

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
    list
}
