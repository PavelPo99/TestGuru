class TestsController < ApplicationController

  def index
    render inline: "<h1>Tests:</h1>
      <ol>
        <% Test.all.each do |test| %>
          <li><a href='tests/<%= test.id %>/questions' rel='nofollow noopener'> <%= test.title %> </a></li>
        <% end %>
      </ol>"
  end
end
