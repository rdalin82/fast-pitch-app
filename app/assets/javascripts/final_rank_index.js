$(document).ready(callAll);

$(document).ajaxComplete(function () {
    callAll();
  });

function callAll() {
  const button = document.querySelectorAll('.final_rank_button');
  const buttonUpdate = document.querySelectorAll('.final_rank_button_update');

  function showForm() {
    presenterId = this.id.slice(2);
    this.outerHTML = `
      <label>Please enter a final rank</label>
      <input class="info_i_need" type='number' style="width:90px">
      <button class="button_submit btn btn-new" type='submit'>Submit</button>`;
    const submitButton = document.querySelectorAll('.button_submit');
    for (var i = 0; i < submitButton.length; i++) {
      submitButton[i].addEventListener('click', function () {
        ajaxForm(presenterId);
      });
    }
  }

  function showForm2() {
    presenterId = this.id.slice(2);
    this.outerHTML = `
      <label>Please enter a final rank</label>
      <input class="info_i_need" type='number' style="width:90px">
      <button class="button_submit btn btn-primary" type='submit'>Submit</button>`;
    const submitButton = document.querySelectorAll('.button_submit');
    for (var i = 0; i < submitButton.length; i++) {
      submitButton[i].addEventListener('click', function () {
        ajaxForm2(presenterId);
      });
    }
  }

  function ajaxForm(presenterId) {
    const data = document.querySelectorAll('.info_i_need');
    for (var i = 0; i < data.length; i++) {
      $.ajax({
        type: 'POST',
        url: '/final_ranks',
        data: { final_rank: data[i].value, presenter_id: presenterId },
        success: function () {
          for (var i = 0; i < button.length; i++) {
            button[i].addEventListener('click', showForm);
          }
        },
      });
    }
  }

  function ajaxForm2(presenterId) {
    const data = document.querySelectorAll('.info_i_need');
    for (var i = 0; i < data.length; i++) {
      $.ajax({
        type: 'PATCH',
        url: `/final_ranks/${presenterId}`,
        data: { final_rank: data[i].value, presenter_id: presenterId },
        success: function () {
          for (var i = 0; i < buttonUpdate.length; i++) {
            buttonUpdate[i].addEventListener('click', showForm2);
          };
        },
      });
    }
  }

  for (var i = 0; i < button.length; i++) {
    button[i].addEventListener('click', showForm);

  }

  for (var i = 0; i < buttonUpdate.length; i++) {
    buttonUpdate[i].addEventListener('click', showForm2);
  }
};
