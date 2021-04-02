module Readers
  class HomeController < ReadersController
    def index
=begin 
(https://stackoverflow.com/questions/7475639/in-rails-how-do-i-retrieve-10-most-recent-entries-in-a-model) 
=end
      @posts = Post.order(created_at: :desc).limit(20)
    end
  end
end


