$(() => {
  const Templates = {};
  let contacts;
  let tagBank = [];

  $('script[type="text/x-handlebars"]').each((i, template) => {
    const $template = $(template);
    Templates[$template.attr('id')] = Handlebars.compile($template.html());
  });

  Handlebars.registerPartial('contactTemplate', $('#contactTemplate').html());
  Handlebars.registerPartial('tagsPartial', $('#tagsPartial').html());
  Handlebars.registerHelper('parseTags', tags => {
    if (tags) {
      let tagsArr = tags.split(',').map(tag => {
        return {tag: tag};
      });

      return tagsArr;
    }
  });
  Handlebars.registerHelper('noContacts', () => {
    return contacts.length === 0;
  });

  const UI = {
    $wrapper: $('div.wrapper'),
    duration: 500,
    slideUp ($div) {
      let height = $div.height();

      $div.css({
        overflow: 'hidden',
        'margin-top': height,
        height: 0,
        position: 'absolute',
        top: 0,
      }).animate({
        'margin-top': 0,
        height: height,
      }, {
          duration: this.duration,
          queue: false,
          done: () => {
            $div.css({
              overflow: '',
              position: '',
              height: '',
            });

            $div.prevAll().remove();
          },
        });
    },

    appendToWrapper (template) {
      this.$wrapper.append(template);
    },

    appendTemplate (element, template) {
      element.append(template);
    },

    appendElement ($element, $targetElement) {
      $element.appendTo($targetElement);
    },

    determineTemplate (url) {
      if (/#home/.test(url)) {
        this.appendToWrapper(Templates.searchbarTemplate());
        this.appendToWrapper(Templates.userActionsTemplate({ contacts: contacts }));
      } else if (/#contacts\/new/.test(url)) {
        this.appendToWrapper(Templates.newContactTemplate(this.formatTags()));
        this.appendTemplate($('#all_tags .tag_list'), Templates.tagsPartial(this.formatTags()))
      } else if (/#contacts\/edit/.test(url)) {
        this.appendToWrapper(Templates.editContactTemplate(this.getContact(url)));
        this.appendTemplate($('#all_tags .tag_list'), Templates.tagsPartial(this.formatTags()))
      } else {
        this.appendToWrapper(Templates.tagsTemplate(this.formatTags()));
      }
    },

    isNewUrl (url, regex) {
      return !regex.test(url);
    },

    initialRender () {
      this.$wrapper.hide()
      this.determineTemplate(document.URL);
      this.$wrapper.slideDown(this.duration);
    },

    renderTagErrorMessage (error) {
      $('.error_message').text(error);
    },

    renderTagPage (e) {
      if (this.isNewUrl(document.URL, /#tags/)) {
        this.appendToWrapper(Templates.tagsTemplate(this.formatTags()));

        let $div = $('div.tag_bank');
        this.slideUp($div);
      }
    },

    renderContactForm (e) {
      if (this.isNewUrl(document.URL, /#contacts\/new/)) {
        this.appendToWrapper(Templates.newContactTemplate(this.formatTags()));
        this.appendTemplate($('#all_tags .tag_list'), Templates.tagsPartial(this.formatTags()))

        let $div = $('div.create_contact');
        this.slideUp($div);
      }
    },

    formatTags () {
      return { tags: tagBank.map(tag => ({ tag: tag })) }
    },

    renderHome (e) {
      if (this.isNewUrl(document.URL, /#home/)) {
        const header = Templates.searchbarTemplate();

        this.appendToWrapper(Templates.userActionsTemplate({ contacts: contacts }));

        const mainPage = $('#main_page');
        mainPage.prepend(header);
        this.slideUp(mainPage);

        setTimeout(() => {
          const $header = $('.user_actions');

          this.$wrapper.prepend($header)
        }, 1000);
      }
    },

    getContact (url) {
      url = url.split('/');
      const id = Number(url[url.length - 1]);

      return contacts.filter(contact => contact.id === id)[0];
    },

    renderEdit (e) {
      if (this.isNewUrl(document.URL, /#contacts\/edit/)) {
        const url = $(e.target).attr('href');

        this.appendToWrapper(Templates.editContactTemplate(this.getContact(url)));
        this.appendTemplate($('#all_tags .tag_list'), Templates.tagsPartial(this.formatTags()));

        let $div = $('div.create_contact');
        this.slideUp($div);
      }
    },

    renderMatches (matches) {
      $('#main_page').remove();
      this.appendToWrapper(Templates.userActionsTemplate({ contacts: matches }));
    },

    renderByTag (matches) {
      this.renderMatches(matches);
    },

    renderTags () {
      const $tagList = $('.tag_list');

      $tagList.find('li').remove();
      this.appendTemplate($tagList, Templates.tagsPartial(this.formatTags()));
    },

    renderByName (matches, value) {
      this.renderMatches(matches);

      if (matches.length <= 0) this.renderNoMatches(value);
    },

    renderNoMatches (value) {
      $('#no_contacts').addClass('visible').text(`There are no contacts starting with ${value}.`);
    },

    getErrorMessage (id) {
      switch (id) {
        case 'full_name':
          return 'name';
        case 'email':
          return 'valid email';
        case 'phone_number':
          return 'phone';
      }
    },

    getErrorParagraph ($input) {
      return $input.next();
    },

    getLabel ($input) {
      return $input.parent().prev().find('label');
    },

    renderFieldError (input) {
      const $input = $(input);
      const $p = this.getErrorParagraph($input);
      const $label = this.getLabel($input);
      let error = `Please enter the ${this.getErrorMessage($input.attr('id'))} field.`;

      $p.text(error);
      $input.addClass('invalid');
      $label.addClass('invalid');
    },

    resetForm ($form) {
      $form.find('p').text('');
      $form.find('input').removeClass('invalid');
      $form.find('label').removeClass('invalid');
    },

    resetTagInput (input, $errorMessage) {
      input.value = '';
      $errorMessage.text('');
    },

    removeUser ($contact) {
      $contact.remove();
    },

    bindEvents () {
      $('.wrapper').on('click', 'a.add_contact', this.renderContactForm.bind(this));
      $('body').on('click', 'a[href="#home"]', this.renderHome.bind(this));
      $('.wrapper').on('click', 'a.add_tags', this.renderTagPage.bind(this));
      $('.wrapper').on('click', '.edit_button', this.renderEdit.bind(this));
    },

    init () {
      this.initialRender();
      this.bindEvents();
    }
  };


  const Application = {
    getAllContacts () {
      $.ajax({
        url: '/api/contacts',
        type: 'GET',
        dataType: 'json',
        success (json) {
          contacts = json;
        },
      });
    },

    parseTags () {
      contacts.forEach(contact => {
        if (contact.tags) {
          let tags = contact.tags.split(',');

          tags.forEach(tag => {
            if (!tagBank.includes(tag)) {
              tagBank.push(tag);
            }
          });
        }
      });
    },

    filterByTag (e) {
      const tagValue = $(e.target).val();
      const matches = contacts.filter(contact => {
        if (contact.tags) {
          return contact.tags.indexOf(tagValue) !== -1;
        }
      });

      UI.renderByTag(matches);
    },

    searchByName (e) {
      const sValue = $(e.target).val().trim();
      const matches = contacts.filter(contact => {
        const cName = contact.full_name.toLowerCase();

        if (cName.indexOf(sValue.toLowerCase()) !== -1) return contact;
      });

      UI.renderByName(matches, sValue);
    },

    doesTagExist (tag) {
      return tagBank.includes(tag);
    },

    hasInvalidChars (tag) {
      return /\s|,/.test(tag);
    },

    isInvalidTag (tag) {
      let isInvalid = false;

      if (this.hasInvalidChars(tag)) {
        UI.renderTagErrorMessage("Tag cannot have ',' or whitespace!");
        isInvalid = true;
      } else if (tag.length === 0) {
        UI.renderTagErrorMessage('Tag must contain text!');
        isInvalid = true;
      } else if (this.doesTagExist(tag)) {
        UI.renderTagErrorMessage('That tag already exists!');
        isInvalid = true;
      }

      return isInvalid;
    },

    addTag (e) {
      if (e.which === 13) {
        const value = e.target.value.trim().toLowerCase();

        if (this.isInvalidTag(value)) {
          return;
        } else {
          tagBank.push(value);
          UI.resetTagInput(e.target, $('.error_message'));
          UI.renderTags();
        }
      }
    },

    userHasTag (value) {
      const $matches = $('#current_tags span').filter((i, tag) => tag.textContent === value);

      return $matches.length > 0;
    },

    addTagToUser (e) {
      const $target = $(e.target);
      const value = $target.text();

      if (!this.userHasTag(value)) {
        let $tagList = $('#current_tags .tag_list');

        UI.appendElement($target.parent().clone(), $tagList);
      }
    },

    removeTagFromUser (e) {
      const $target = $(e.target);

      $target.parent().remove();
    },

    anyFieldsEmpty ($form) {
      const $input = $form.find('input');
      const $matches = $input.filter((i, input) => input.value.trim() === '');

      if ($matches.length > 0) {
        $matches.each((i, input) => UI.renderFieldError(input));
        return true;
      }

      return false;
    },

    formatTagsToJSON ($tags) {
      const tagsArr = [];

      $tags.each((i, tag) => tagsArr.push(tag.textContent));

      return tagsArr.join(',');
    },

    createContactObject (dataArr, tags) {
      const json = {};

      dataArr.forEach(obj => json[obj.name] = obj.value);
      json.tags = tags;

      return json;
    },

    getContact (id) {
      return contacts.filter(contact => contact.id === id)[0];
    },

    getContactIndex (contact) {
      return contacts.indexOf(contact);
    },

    filterOldData (data, id) {
      const contact = this.getContact(id);
      let key;

      for (key in data) {
        if (data[key] === contact[key]) delete data[key];
      }
    },

    addContact (json) {
      contacts.push(json);
    },

    updateContact (id, json) {
      const contact = this.getContact(id);

      contacts[contacts.indexOf(contact)] = json;
    },

    sendRequest (e, $tags) {
      const $form = $(e.target);
      const id = Number($form.attr('data-id'));
      const method = $form.attr('method');
      const tags = this.formatTagsToJSON($tags);
      const data = this.createContactObject($form.serializeArray(), tags);

      if (method === 'put') this.filterOldData(data, id);

      $.ajax({
        url: $form.attr('action'),
        method: method,
        data: JSON.stringify(data),
        dataType: 'json',
        headers: {'Content-Type': 'application/json'},
        success (json) {
          if (method === 'post') {
            Application.addContact(json);
          } else {
            Application.updateContact(id, json);
          }
          UI.renderHome();
          window.location = 'http://localhost:3000/#home';
        },
      });
    },

    validateForm (e) {
      e.preventDefault();

      const $form = $(e.target);
      UI.resetForm($form);

      if (this.anyFieldsEmpty($form)) {
        return;
      }

      this.sendRequest(e, $('#current_tags span'));
    },

    deleteUser (e) {
      const $target = $(e.target);
      const id = $target.attr('data-id');

      if (confirm('Do you want to delete the contact?')) {
        $.ajax({
          url: `/api/contacts/${id}`,
          method: 'delete',
          success () {
            const contact = Application.getContact(id);
            const idx = Application.getContactIndex(contact);

            contacts.splice(idx, 1);
            UI.removeUser($target.parents('.contact'));
          }
        });
      }
    },

    bindEvents () {
      $('body').on('click', 'span.tag', this.filterByTag.bind(this));
      $('body').on('input', '#searchbar', this.searchByName.bind(this));
      $('body').on('keydown', '#tag_input', this.addTag.bind(this));
      $('body').on('click', '#all_tags li', this.addTagToUser.bind(this));
      $('body').on('click', '#current_tags li', this.removeTagFromUser.bind(this));
      $('body').on('submit', 'form', this.validateForm.bind(this));
      $('body').on('click', '.delete_button', this.deleteUser.bind(this));
    },

    init () {
      $.ajax({
        url: '/api/contacts',
        type: 'GET',
        dataType: 'json',
        success (json) {
          contacts = json;
          Application.parseTags();
          UI.init();
        },
      });

      this.bindEvents();
    },
  };

  Application.init();
});
