document.addEventListener('turbolinks:load', () => {

  // 動的セレクトフォーム
  const fieldSelect = document.getElementById('plan_field_id');
  const fieldSectionSelect = document.getElementById('plan_field_section_id');

  fieldSelect.addEventListener('change', function() {
    const fieldId = this.value;

    // 区画選択を初期化
    fieldSectionSelect.innerHTML = '';

    if (fieldId) {
      // 区画情報を取得
      fetch(`/fields/field_section_list?field_id=${fieldId}`)
        .then(response => response.json())
        .then(data => {
          fieldSectionSelect.length = data.length + 1;
          fieldSectionSelect.children[0].text = '区画名を選択してください';
          data.forEach((field_section, i) => Object.assign(fieldSectionSelect.children[i + 1],
            {
              text: field_section.name,
              value: field_section.id,
            }
          ));
        });
    } else {
      fieldSectionSelect.length = 1;
      fieldSectionSelect.children[0].text = '区画を選択してください';
    }
  });
});