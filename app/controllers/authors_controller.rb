class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find( params[:id] )
  end

  def names
    authors = Author.all
    names = authors.map( &:name )

    respond_to do |format|
      format.html{}
      format.json do
        render :json => names; # dont have to call to_json
      end
    end
  end

end
