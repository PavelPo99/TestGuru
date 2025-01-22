class TestsController < ApplicationController

  before_action :find_test, only: %i[show]


  def index
    render inline: "<h1>Tests:</h1>
                    <ol>
                      <% Test.all.each do |test| %>
                        <li><a href='tests/<%= test.id %>/questions' rel='nofollow noopener'> <%= test.title %> </a></li>
                      <% end %>
                    </ol>"
  end


  private

  def find_test
    @test = Test.find(params[:id])
  end
end
