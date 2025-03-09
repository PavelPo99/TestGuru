class GistQuestionServices

  GistResult = Struct.new(:success?, :html_url)

  ACCESS_TOKEN = ENV.fetch('GITHUB_ACCESS_GIST_TOKEN')

  def initialize(test_passage, user, client = default_client)
    @test_passage = test_passage
    @question = test_passage.current_question
    @test = @question.test
    @user = user
    @client = client #|| default_client
  end

  def call
    gist = @client.create_gist(gist_params)

    if gist.html_url.present?
      GistsController.new.create(question: @question.id, gist_url: gist.html_url, user: @user.id)
        
      GistResult.new(true, gist.html_url)
    else
      GistResult.new(false, nil)
    end
  end


  private

  def gist_params
    {
      description: I18n.t('services.gist.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }    
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
