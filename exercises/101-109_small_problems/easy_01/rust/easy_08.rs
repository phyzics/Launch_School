// Array Average
fn main() {
    println!("{}", average(vec![1, 5, 87, 45, 8, 8]) == 25);
    println!("{}", average(vec![9, 47, 23, 95, 16, 52]) == 40);
}

fn average(nums: Vec<i32>) -> i32 {
    let count = nums.len() as i32;
    let sum = nums.iter().fold(0, |acc, x| acc + x);

    sum / count
}
