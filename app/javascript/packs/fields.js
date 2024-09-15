document.addEventListener('turbolinks:load', () => {
  // 動的入力フォーム
  const addButton = document.getElementById("add_button");
  const wrapper = document.getElementById("wrapper");
  let x = 1;

  // IDの生成と管理
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

    const formHtml= `
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
