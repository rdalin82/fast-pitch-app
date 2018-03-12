$(document).ready(function () {
  const button = document.querySelectorAll('.final_rank_button');
  const finalRankForm = document.querySelectorAll('.final_rank_form');

  function showForm() {
    this.outerHTML = `
      <label>Please enter a final rank</label>
      <input class="info_i_need" type='number' style="width:90px">
      <button class="button_submit btn btn-new" type='submit'>Submit</button>`;
    const submitButton = document.querySelectorAll('.button_submit');
    for (var i = 0; i < submitButton.length; i++) {
      submitButton[i].addEventListener('click', ajaxForm);
    }
  }

  function ajaxForm() {
    const data = document.querySelectorAll('.info_i_need');
    for (var i = 0; i < data.length; i++) {
      $.ajax({
        type: 'POST',
        url: '/final_ranks',
        data: { final_rank: { final_rank: data[i].value } },
        dataType: 'json'
      });
    }
  }

  for (var i = 0; i < button.length; i++) {
    button[i].addEventListener('click', showForm);
  }
});
