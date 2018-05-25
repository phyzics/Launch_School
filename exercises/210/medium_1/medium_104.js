// medium_104.js - Stack Machine Interpretation
/* PEDAC
P:
  - register is current value (not part of stack)
  - operation uses register and last-in value from stack (removes it)
    - result is stored in register
  - stack = []
  - register = 0
  - programs are in a string, and must be read left to right

DA:
  data structure = array strings for the program

  A:
    1) format the program
      - split(' ');
    2) execute the program
      - loop over the program array
      - switch
        - whats described for each operation
*/

function minilang(program) {
  var register = 0;
  var stack = [];

  program = program.split(' ').map(function (operation) {
    return /\d+/.test(operation) ? Number(operation) : operation;
  });

  program.forEach(function (operation) {
    if (!isNaN(operation)) {
      register = operation;
    } else {
      switch (operation) {
        case 'PUSH':
          stack.push(register);
          break;
        case 'ADD':
          register += stack.pop();
          break;
        case 'SUB':
          register -= stack.pop();
          break;
        case 'MULT':
          register *= stack.pop();
          break;
        case 'DIV':
          register = Math.floor(register / stack.pop());
          break;
        case 'MOD':
          register %= stack.pop();
          break;
        case 'POP':
          register = stack.pop();
          break;
        case 'PRINT':
          console.log(register);
      }
    }
  });
}

minilang('PRINT');
console.log();
minilang('5 PUSH 3 MULT PRINT');
console.log();
minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
console.log();
minilang('5 PUSH POP PRINT');
console.log();
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
console.log();
minilang('3 PUSH PUSH 7 DIV MULT PRINT');
console.log();
minilang('4 PUSH PUSH 7 MOD MULT PRINT');
console.log();
minilang('-3 PUSH 5 SUB PRINT');
console.log();
minilang('6 PUSH');
console.log();
