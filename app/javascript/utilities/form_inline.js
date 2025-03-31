document.addEventListener('turbo:load', function() {
  // var controls = document.querySelectorAll('.form-inline-link')

  // if (controls.length) {
  //   for (var i = 0; i < controls.length; i++ ) {
  //     controls[i].addEventListener('click', formInlineLinkHandler)
  //   }
  // }

  $('.form-inline-link').on('click', formInlineLinkHandler)

//   var errors = document.querySelector('.resource-errors')

//   if (errors) {
//     var resourceId = this.dataset.resourceId
//     formInlineHandler(resourceId)
//   }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  // var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  // var formInline = document.querySelector('.from-inline[data-test-id="' + testId + '"]')

  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.from-inline[data-test-id="' + testId + '"]')


  $testTitle.toggle()
  $formInline.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = document.querySelector('.nav-link.active').textContent.trim() === 'Рус' ?  "Отмена" : "Cancel"
  } else {
    link.textContent = document.querySelector('.nav-link.active').textContent.trim() === 'Рус' ?  "Редактировать" : "Edit"
  }



  // if (formInline.classList.contains('hide')) { 
  //   testTitle.classList.add('hide')
  //   formInline.classList.remove('hide')
  //   link.textContent = 'Cancel'
  // } else {
  //   testTitle.classList.remove('hide')
  //   formInline.classList.add('hide')
  //   link.textContent = 'Edit'
  // }
}
