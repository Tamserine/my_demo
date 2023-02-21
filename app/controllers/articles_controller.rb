# frozen_string_literal: true

class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @articles = Article.all

    @favorites =  parse_cookie
    
    #@favorites = if request.cookies['favorites']

    #             JSON.parse(request.cookies['favorites'])

    #             else
    #               []
    #             end

    # puts "hi there #{articles_url}  #{cookies[:faves]}"
  end

  def parse_cookie
       
      if request.cookies['favorites']
         cookie = JSON.parse(request.cookies['favorites'])
     else
       cookie = []
     end
    
    return cookie
   
  end 

  def toggle_favorite
    # puts "current cookie #{request.cookies['favorites']} trying to add #{params[:id]}"

    @favorites = if request.cookies['favorites']
                   JSON.parse(request.cookies['favorites'])
                 else
                   []
                 end
    # puts "current cookie #{@favorites}"

    if @favorites.include? params[:id].to_i
      # puts "removing #{@favorites[params[:id].to_i]}"
      @favorites -= [params[:id].to_i]
      # puts "cookie now #{@favorites}"

    else
      # puts 'adding'
      # puts "cookie array #{@favorites}"
      @favorites << params[:id].to_i
    end
    # puts "cookie array #{@favorites}"

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
