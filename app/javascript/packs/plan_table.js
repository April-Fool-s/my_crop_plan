document.addEventListener('turbolinks:load', () => {
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