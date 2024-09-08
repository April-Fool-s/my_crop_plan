document.addEventListener('turbolinks:load', () => {
  // 動的入力フォーム
  const addButton = document.getElementById("add_button");
  const wrapper = document.getElementById("wrapper");
  let x = 1;

  // 編集時にxの初期値を設定
  const existingFields = document.querySelectorAll('.nested-fields');
  if (existingFields.length > 0) {
    // 既存のフィールドから最大の番号を取得
    x = Math.max(...Array.from(existingFields).map(field => {
      const match = field.querySelector('input[name*="[name]"]').name.match(/\[(\d+)\]/);
      return match ? parseInt(match[1], 10) : 0;
    })) + 1;
  }

  addButton.addEventListener("click", function(e) {
    e.preventDefault();
    const addFieldSection = document.querySelector('#add_field_section') !== null;
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
            <input type="text" class="form-control plan_crop_name" name="plan[plan_crops_attributes][${x}][name]" placeholder="植付作物名" list="crop-list">
            <datalist id="crop-list">
              <% Crop.all.each do |crop| %>
                <option value="<%= crop.name %>">
              <% end %>
            </datalist>
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

    wrapper.insertAdjacentHTML('beforeend', formHtml);
    x++; // 新しいフォームを追加した後にxをインクリメント
  });

  // fields/newまたはeditでfield_sectionsの入力フォームを削除するための記述
  document.addEventListener("click", function(e) {
    if (e.target.closest(".remove_field")) {
      e.preventDefault();

      if (confirm('この区画を削除してもよろしいですか？\n紐付いている計画が削除される可能性があります')) {
        const removeButton = e.target.closest(".remove_field");
        const nestedFields = removeButton.closest('.nested-fields');
        const destroyField = nestedFields.querySelector('.destroy-field');

        if (destroyField) {
          destroyField.value = 'true';
          nestedFields.style.display = 'none';

          const inputs = nestedFields.querySelectorAll('input');
          inputs.forEach(input => input.classList.add('hidden'));
        } else {
          nestedFields.remove();
        }
      }
    }
  });
});
