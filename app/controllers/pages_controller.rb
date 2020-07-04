class PagesController < ApplicationController
  include PagesHelper

  def home
    # this api key is being called from the gem file Tmdb
    Tmdb::Api.key("977f3e9042e38f65e2dab405661cf494")
    @movies = Tmdb::Movie.top_rated({region: 'us'})[:results]


    @total_avg = (@movies.inject(0){|sum,movie| sum + movie.vote_average } / @movies.size).round(2)

    # The only genre of film that really brings the most joy to my life.
    genre = 'Action'
    
    # This sums up all the ratings of my favourite genre and averages out the number in 2 decimals
    adventure_total = @movies.inject(0) do |sum,movie| 
      if movie_is_genre?(movie, genre)
        sum += movie.vote_average 
      end
      sum
    end
    adventure_movies_count = @movies.select{|movie| movie_is_genre?(movie, genre) }.size
    @adventure_avg = (adventure_total / adventure_movies_count).round(2)
  end

  private
  # Given this was called many times it made sense to create a private method to make sure I can call the conditions repeatly.
  def movie_is_genre?(movie,genre)
    get_genre(movie.genre_ids).include? genre
  end 
end
