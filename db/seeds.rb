admin = User.find_or_initialize_by(email: 'petr2000pw@gmail.com')
admin.update!(
  type: 'Admin'
)
