$(() => {
  const $questionTemplate = $('#questionTemplate').remove();
  const template = Handlebars.compile($questionTemplate.html());
  const Application = {
    questions: [
      {
        id: 1,
        description: "Who is the author of <cite>The Hitchhiker's Guide to the Galaxy</cite>?",
        options: ['Dan Simmons', 'Douglas Adams', 'Stephen Fry', 'Robert A. Heinlein']
      },
      {
        id: 2,
        description: 'Which of the following numbers is the answer to Life, the \
                      universe and everything?',
        options: ['66', '13', '111', '42']
      },
      {
        id: 3,
        description: 'What is Pan Galactic Gargle Blaster?',
        options: ['A drink', 'A machine', 'A creature', 'None of the above']
      },
      {
        id: 4,
        description: 'Which star system does Ford Prefect belong to?',
        options: ['Aldebaran', 'Algol', 'Betelgeuse', 'Alpha Centauri']
      }
    ],
    answerKey: { '1': 'Douglas Adams', '2': '42', '3': 'A drink', '4': 'Betelgeuse' },

    getCorrectAnswer (id) {
      return this.answerKey[id];
    },

    renderEmptyMessage (div) {
      const $div = $(div);
      const errorText = 'You did not answer this question. Correct answer is: ';
      const correctAnswer = this.getCorrectAnswer($div.attr('data-id'));

      $(div).find('.answer_feedback').show().addClass('incorrect').text(errorText + correctAnswer);
    },

    renderIncorrectMessage (id) {
      const $div = $(`div[data-id="${id}"]`);
      const correctAnswer = this.getCorrectAnswer($div.attr('data-id'));

      $div.find('.answer_feedback').show().addClass('incorrect').text(`Wrong answer. The correct answer is: ${correctAnswer}`);
    },

    renderCorrectMessage (id) {
      const $div = $(`div[data-id="${id}"]`);
      $div.find('.answer_feedback').show().addClass('correct').text('Correct Answer');
    },

    checkForEmptyAnswers ($answers) {
      $('div.question').each((i, div) => {
        const $matches = $answers.filter((i, input) => $(input).attr('data-id') === $(div).attr('data-id'));

        if ($matches.length < 1) this.renderEmptyMessage(div);
      });
    },

    checkAnswers (e) {
      e.preventDefault();

      const $answers = $('input:checked');

      this.checkForEmptyAnswers($answers);

      $answers.each((i, answer) => {
        const $answer = $(answer);
        const id = $answer.attr('data-id');

        if ($answer.val() === this.getCorrectAnswer(id)) {
          this.renderCorrectMessage(id)
        } else {
          this.renderIncorrectMessage(id);
        }
      });

      $('#submit').prop('disabled', true);
      $('#reset').prop('disabled', false);
    },

    resetQuiz () {
      const $feedback = $('.answer_feedback');

      $feedback.removeClass().addClass('answer_feedback');
      $feedback.text('');
      $('input[type="radio"]:checked').prop('checked', false);
      $('#submit').prop('disabled', false);
      $('#reset').prop('disabled', true);

      // enable
    },

    bindEvents () {
      $('form').on('submit', this.checkAnswers.bind(this));
      $('#reset').on('click', this.resetQuiz.bind(this));
    },

    init () {
      $('form').prepend(template({ questions: this.questions }));
      this.bindEvents();
    },
  };

  Application.init();
});
