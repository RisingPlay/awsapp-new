class MyurlsController < ApplicationController

  layout false

  def index
  	@myurls = Myurl.all
  end

  def new
  	@myurl = Myurl.new({:url => "http://www.", :key => nil})
  end

  def create
    @myurl = Myurl.new(myurl_params)

    if @myurl.valid?

    	if @myurl.key.nil? || !Myurl.find_by_key(@myurl.key).nil?
        @myurl.save
        @myurl.key = @myurl.id.to_s(16)
    	end

    	@myurl.save

      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def delete
    Myurl.find(params[:myurl_id]).destroy
    redirect_to(:action => 'index')
  end

  def redirect
  	redirect_to(myurl.find_by_key(params[:key]).url)
  end

  private

    def myurl_params
      params.require(:myurl).permit(:key,:url)
    end
end
