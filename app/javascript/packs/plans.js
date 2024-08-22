document.addEventListener('turbolinks:load', function() {
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
          let options = '<option value="">区画名を選択してください</option>';
          data.forEach(function(field_section) {
            options += `<option value="${field_section.id}">${field_section.name}</option>`;
          });
          fieldSectionSelect.innerHTML = options;
        });
    } else {
      fieldSectionSelect.innerHTML = '<option value="">区画を選択してください</option>';
    }
  });
});