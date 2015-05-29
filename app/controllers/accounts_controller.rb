class AccountsController < ApplicationController

  layout 'main'
  #before_action :confirm_logged_in, :except => [:index]
  def index
    #render('main')
  end

  def show
    
  end

  

  def create
  	@account = Account.new(account_params)
    @account.images.build(:url => "profile_default.png", :image_use => "profile_pic")
  	if @account.save
      
      session[:logged_in] = true
      session[:user_id] = @account.id
      session[:email] = account_params[:email]
      session[:name] = account_params[:display_name]

      session[:picture] = @account.images.profile_pic.first.url

  		redirect_to(:controller => 'topics', :action =>'index')
      
  	
  	else 
  		render('index')
  	end
  end

  def edit
    #liks to the edit page (view)
  end

  def delete
  #if the need to delete a user account ever arizes, this will link to the delete page
  end
  def destroy
    @topic_to_delete = Article.find(params[:id])
    if @account_to_delete.destroy
      flash[:notice] = "accont destroyed successfully"
      redirect_to(:controller=> 'admin', :action => "articles")
    else
      redirect_to(:controller=> 'admin', :action => "stats_redirects")
    end
  end

  private 
  def account_params
  	params.require(:account).permit(:first_name, :last_name, :display_name, :email, :password)
  end
end

