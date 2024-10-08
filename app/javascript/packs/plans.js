document.addEventListener('turbolinks:load', () => {
  // 動的セレクトフォーム
  const fieldSelect = document.getElementById('plan_field_id');
  const fieldSectionSelect = document.getElementById('plan_field_section_id');
  const planForm = document.getElementById('plan-form');

  // フォームのコンテキストを取得
  const context = planForm ? planForm.getAttribute('data-context') : 'new';

  const updateFieldSections = () => {
    const fieldId = fieldSelect.value;

    // 区画選択を初期化
    fieldSectionSelect.innerHTML = '';

    if (fieldId) {
      // 区画情報を取得
      fetch(`/fields/field_section_list?field_id=${fieldId}`)
        .then(response => response.json())
        .then(data => {
          fieldSectionSelect.length = data.length + 1;
          fieldSectionSelect.children[0].text = '区画名を選択してください';
          data.forEach((field_section, i) => Object.assign(fieldSectionSelect.children[i + 1], {
            text: field_section.name,
            value: field_section.id,
          }));
        });
    } else {
      fieldSectionSelect.length = 1;
      fieldSectionSelect.children[0].text = '区画を選択してください';
    }
  };

  // 新規作成時のみ、ページロード時に更新
  if (context === 'new') {
    updateFieldSections();
  }

  // 畑が変更されたときに更新
  fieldSelect.addEventListener('change', updateFieldSections);


  // 動的入力フォーム
  const addButton = document.getElementById("add_button");
  const wrapper = document.getElementById("wrapper");
  let x = 1;

  // IDの生成と管理
  const existingFields = document.querySelectorAll('.nested-fields');
  if (existingFields.length > 0) {
    // 既存のフィールドから最大の番号を取得
    x = Math.max(...Array.from(existingFields).map(field => {
      const match = field.querySelector('select[name*="[crop_id]"]').name.match(/\[(\d+)\]/);
      return match ? parseInt(match[1], 10) : 0;
    })) + 1;
  }

  // AJAXリクエストで作物情報を取得
  function fetchCrops() {
    return fetch('/crops/crop_list')
      .then(response => response.json())
      .then(data => data);
  }

  // 作物の選択肢を生成
  function generateCropOptions(crops, selectedCropId = null) {
    return crops.map(crop => {
      const selected = selectedCropId === crop.id ? 'selected' : '';
      return `<option value="${crop.id}" ${selected}>${crop.name}</option>`;
    }).join('');
  }

  addButton.addEventListener("click", function(e) {
    e.preventDefault();

    // AJAXリクエストで作物情報を取得し、フォームを生成する
    fetchCrops().then(crops => {
      const cropOptions = generateCropOptions(crops);

      const formHtml= `
        <div class="row nested-fields">
          <div class="col-10">
            植付作物名<span class="text-left" style="color: red;">*</span>
            <select name="plan[plan_crops_attributes][${x}][crop_id]" id="plan_plan_crops_attributes_${x}_crop_id" class="crop-select">
              <option value="">作物を選択してください</option>
              ${cropOptions}
            </select>
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

      wrapper.insertAdjacentHTML('beforeend', formHtml);
      x++; // 新しいフォームを追加した後にxをインクリメント
    });
  });

  // fields/newまたはeditでfield_sectionsの入力フォームを削除するための記述
  document.addEventListener("click", function(e) {
    if (e.target.closest(".remove_field")) {
      e.preventDefault();

      if (confirm('削除してもよろしいですか？')) {
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

  // 作付計画表年度絞り込み
  const currentYearSpan = document.getElementById('current-year');
  let currentYear = parseInt(currentYearSpan.textContent);

  document.getElementById('prev-year').addEventListener('click', function () {
    currentYear--;
    updateYear(currentYear);
  });

  document.getElementById('next-year').addEventListener('click', function () {
    currentYear++;
    updateYear(currentYear);
  });

  function updateYear(year) {
    currentYearSpan.textContent = year;

    fetch(`/plans/plan_table?year=${year}`)
      .then(response => response.text())
      .then(html => {
        // HTMLをパースして、`plan-body` 部分を取り出す
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const newPlanBody = doc.querySelector('#plan-body').innerHTML;

        // `plan-body` を更新
        document.getElementById('plan-body').innerHTML = newPlanBody;
      })
      .catch(error => console.error('Error:', error));
  }
});