// How old is Teddy?
extern crate rand;

use rand::Rng;

fn main() {
    let mut rng = rand::thread_rng();
    println!("Teddy is {} years old!", rng.gen_range(20, 201));
}
