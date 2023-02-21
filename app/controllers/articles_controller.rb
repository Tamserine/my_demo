# frozen_string_literal: true

# Controller for Articles Handles the Favorites cookie display
class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @articles = Article.all

    @favorites = parse_cookie
  end

  def parse_cookie
    if request.cookies['favorites']
      JSON.parse(request.cookies['favorites'])
    else
      []
    end
  end

  def toggle_favorite
    @favorites = parse_cookie

    if @favorites.include? params[:id].to_i
      @favorites -= [params[:id].to_i]

    else
      @favorites << params[:id].to_i
    end

    # I ran into problems with setting the cookie using cookies[:cookie_name] = 'cookie'
    # which I suspect may have something to do with running on local host and the fact
    # I've been messing around with CORS settings
    response.set_cookie(
      :favorites,
      {
        value: JSON.generate(@favorites),
        expires: 1.month.from_now,
        path: '/',
        secure: false,
        httponly: false
      }
    )

    render json: params[:id]
  end
end
