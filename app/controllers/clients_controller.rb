class ClientsController < ApplicationController
  
  def index
  #	@clients=Clients.all
    @clients=Clients.order(params[:id]).page(params[:page]).per_page(5)


     
  end

  def show
     #@search_clients = Clients.search(params[:search])
  end

  def create
  	@client=Clients.new(client_params)
  	 if @client.save
  	 	redirect_to clients_index_path
  	 	flash.now[:saved] = 'CLIENT SAVED'
     else
      flash.now[:saved] = 'INVALID CLIENT DATA'
      render 'new'
     end
  end

  
  def edit
     
  end

  def search_page
    @search_clients = Clients.search(params[:search])
   
     @pagination=@search_clients.order(params[:id]).page(params[:page]).per_page(7)

    if @pagination.blank?
       # @search_clients.blank?
        flash[:no_client_found] = 'NO CLIENT FOUND' 
        #@pagination = nil
  end
end
  
  #end
  

  
  def new
  	@client=Clients.new
  end

  def destroy
    @client=Clients.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private
  	def client_params
  		params.require(:client).permit(:first_name,:last_name,:email,:address,
  			:city,:state,:country,:phone_number,:gender)
  	end
end
