document.addEventListener('turbo:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler)
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  const testId = this.dataset.testId
  const cancelText = this.dataset.cancel;
  const editText = this.dataset.edit;

  formInlineHandler(testId, cancelText, editText)  
}

function formInlineHandler(testId, cancelText, editText) {
  const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

  let $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  let $formInline = $('.from-inline[data-test-id="' + testId + '"]')


  $testTitle.toggle()
  $formInline.toggle()

  link.textContent = $formInline.is(':visible') ? cancelText : editText;
}
