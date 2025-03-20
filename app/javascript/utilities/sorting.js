document.addEventListener('turbo:load', function() {
  const control = document.querySelector('.sort-by-title');
  if (!control) return;

  if (control) { control.addEventListener('click', sortRowsByTitle) }
});

function sortRowsByTitle () {
  var table = document.querySelector('.container-rows')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('.col-card')

  var sortedRows = []
  for (var i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }  
  

  var sortedTable = document.createElement('container-rows')

  sortedTable.classList.add('container-rows')

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc (row1, row2) {
  var testTitle1 = row1.querySelector('.card-title').textContent
  var testTitle2 = row2.querySelector('.card-title').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('.card-title').textContent
  var testTitle2 = row2.querySelector('.card-title').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
