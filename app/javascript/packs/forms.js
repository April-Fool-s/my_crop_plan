document.addEventListener('turbolinks:load', () => {

  // 動的入力フォーム
  // fields/newまたはeditでfield_sectionsの入力フォームを追加するための記述
  let wrapper = '#wrapper';
  let addButton = '#add_button';
  let x = 1;

  $(document).on("click", addButton, function(e) {
    e.preventDefault();
    x++;

    let addFieldSection = document.querySelector('#add_field_section') !== null;

    let formHtml;

    if (addFieldSection) {
      formHtml = `
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
    } else {
      formHtml = `
        <div class="row nested-fields">
          <div class="col-10">
            植付作物<span class="text-left" style="color: red;">*</span>
            <input type="text" class="form-control plan_crop_name" name="plan[plan_crops_attributes][${x}][name]" placeholder="植付作物名">
          </div>
          <div class="col-2 d-flex align-items-center mt-4">
            <a href="#" class="remove_field btn btn-danger">
              <i class="fa-solid fa-trash" style="color: #ffffff;"></i>
            </a>
          </div>
          <div class="col-12">
            植付方法
            <input type="radio" value="播種" checked="checked" name="plan[plan_crops_attributes][${x}][planting_method]" id="plan_plan_crops_attributes_${x}_planting_method_播種">
            <label for="plan_plan_crops_attributes_${x}_planting_method_播種">播種</label>
            <input type="radio" value="育苗" name="plan[plan_crops_attributes][${x}][planting_method]" id="plan_plan_crops_attributes_${x}_planting_method_育苗">
            <label for="plan_plan_crops_attributes_${x}_planting_method_育苗">育苗</label><br>

            <div class="row">
              <div class="col">
                <label for="plan_plan_crops_attributes_${x}_start_date">作業開始予定日</label>
                <input class="form-control mb-3" type="date" name="plan[plan_crops_attributes][${x}][start_date]" id="plan_plan_crops_attributes_${x}_start_date">
              </div>
              <div class="col">
                <label for="plan_plan_crops_attributes_${x}_end_date">作業終了予定日</label>
                <input class="form-control mb-3" type="date" name="plan[plan_crops_attributes][${x}][end_date]" id="plan_plan_crops_attributes_${x}_end_date">
              </div>
            </div>

            <textarea class="form-control my-3" name="plan[plan_crops_attributes][${x}][note]" placeholder="メモ"></textarea>
          </div>
          <input type="hidden" name="plan[plan_crops_attributes][${x}][_destroy]" class="destroy-field" value="false">
        </div>
      `;

    }

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