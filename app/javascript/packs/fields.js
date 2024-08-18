document.addEventListener('turbolinks:load', () => {

  // fields/newまたはeditでfield_sectionsの入力フォームを追加するための記述
  let wrapper = '#field_sections_wrapper';
  let addButton = '#add_field_sections';
  let x = 1;

  $(document).on("click", addButton, function(e) {
    e.preventDefault();
    x++;

    let formHtml = `
      <div class="row nested-fields">
        <div class="col-10 mt-4">
          <input type="text" class="form-control field_section_name" name="field[field_sections_attributes][${x}][name]" placeholder="追加区画名">
        </div>
        <div class="col-2 d-flex align-items-center mt-4">
          <a href="#" class="remove_field btn btn-danger">
            <i class="fa-solid fa-trash" style="color: #ffffff;"></i>
          </a>
        </div>
        <input type="hidden" name="field[field_sections_attributes][${x}][_destroy]" class="destroy-field" value="false">
      </div>
    `;

    $(wrapper).append(formHtml);

  });

  // fields/newでfield_sectionsの入力フォームを削除するための記述
  $(document).on("click", ".remove_field", function(e) {
    e.preventDefault();

    // fields/editでfield_sectionsの入力フォームを削除するための記述
    if(confirm('この詳細を削除してもよろしいですか？')) {
      let removeButton = $(e.target);
      let nestedFields = removeButton.closest('.nested-fields');
      let destroyField = nestedFields.find('.destroy-field');
      if (destroyField.length > 0) {
        destroyField.val('true');
        removeButton.closest('.nested-fields').hide();
        nestedFields.find('input').addClass('hidden');

      } else {
        removeButton.closest('.nested-fields').remove();
      }

    }
  });
});