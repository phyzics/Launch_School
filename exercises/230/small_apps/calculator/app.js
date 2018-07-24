$(() => {
  const Calculator = {
    currentNumber: '0',
    stack: [],
    replaceNumber: true,

    replaceMode () {
      this.replaceNumber = true;
    },

    insertMode () {
      this.replaceNumber = false;
    },

    setCurrentNumber (value) {
      if (this.replaceNumber) {
        if (value === '.') {
          this.currentNumber += '.'
        } else {
          this.currentNumber = value;
        }

        this.insertMode();
      } else {
        if (this.currentNumber === '0' && value !== '.') {
          this.currentNumber = value;
        } else {
          this.currentNumber += value;
        }
      }
    },

    setStack (operation) {
      this.stack.push(this.currentNumber);
      if (operation) this.stack.push(operation);
    },

    resetStack () {
      this.stack = [];
    },

    calculate (values) {
      let a, op, b;
      [a, op, b] = values;
      a = Number(a);
      b = Number(b);

      switch (op) {
        case 'x':
          return String(a * b);
        case '/':
          return String(a / b);
        case '+':
          return String(a + b);
        case '-':
          return String(a - b);
        case '%':
          return String(a % b);
      }
    },

    attemptCalculation () {
      Calculator.replaceMode();

      if (this.stack.length < 3) {
        return;
      } else {
        let operationArr = this.stack.splice(0, 3);
        let result = this.calculate(operationArr);

        this.setCurrentNumber(result);
        this.stack.unshift(result);
      }

      Calculator.replaceMode();
    },

    resetCurrentNumber () {
      this.currentNumber = '0';
    },

    negateNumber () {
      this.currentNumber = String(Number(this.currentNumber) * -1);
    },

    hasDecimal () {
      return this.currentNumber.indexOf('.') !== -1;
    },
  };

  const UI = {
    $currentNumber: $('#current_number p'),
    $operations: $('#operations p'),
    runningStack: $('#operations p').text(),
    renderCurrentNumber () {
      this.$currentNumber.text(Calculator.currentNumber);
    },

    renderStack (number, operation) {
      this.runningStack += `${number} ${operation} `;
      this.$operations.text(this.runningStack);
    },

    resetStack () {
      this.runningStack = '';
      this.$operations.text(this.runningStack);
    },

    init () {
      this.renderCurrentNumber();
    },
  };

  const Application = {
    addDigit (e) {
      const number = $(e.target).attr('data-id');

      Calculator.setCurrentNumber(number);
      UI.renderCurrentNumber();
    },

    addDecimal () {
      if (!Calculator.hasDecimal()) {
        Calculator.setCurrentNumber('.')
        UI.renderCurrentNumber();
      }
    },

    addOperation (e) {
      const operation = $(e.target).attr('data-id');

      Calculator.setStack(operation);
      UI.renderStack(Calculator.currentNumber, operation);
      Calculator.attemptCalculation();
      Calculator.replaceMode();
      UI.renderCurrentNumber();
    },

    getCalculation () {
      Calculator.setStack();
      Calculator.attemptCalculation();
      Calculator.resetStack();
      UI.resetStack();
      UI.renderCurrentNumber();
    },

    negateNumber () {
      Calculator.negateNumber();
      UI.renderCurrentNumber();
    },

    clearCurrent () {
      Calculator.resetCurrentNumber();
      UI.renderCurrentNumber();
    },

    clearAll () {
      Calculator.resetCurrentNumber();
      Calculator.resetStack();
      UI.resetStack();
      UI.renderCurrentNumber();
    },

    bindEvents () {
      $('.num').on('click', this.addDigit.bind(this));
      $('#c').on('click', this.clearCurrent.bind(this));
      $('#ce').on('click', this.clearAll.bind(this));
      $('#decimal').on('click', this.addDecimal.bind(this));
      $('#neg').on('click', this.negateNumber.bind(this));
      $('.op').on('click', this.addOperation.bind(this));
      $('#equals').on('click', this.getCalculation.bind(this));
    },

    init () {
      UI.init();
      this.bindEvents();
    },
  };

  Application.init();
});
