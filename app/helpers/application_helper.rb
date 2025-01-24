module ApplicationHelper
  
  PERSONAL_LINK = { "Pavel" =>  'https://github.com/PavelPo99', "Test Guru" => 'https://github.com/PavelPo99/TestGuru' }

  def current_year
    Time.current.year
  end

  def github_url(link)
    PERSONAL_LINK[link]
  end
end
