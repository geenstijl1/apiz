class AdminsController < ApplicationController

  def index
    @admins = Admin.all
    render json: @admins
  end

  def login
    
    success = { message: 'Success for Admins'}
    email_incorrect = { message: 'Email or Username are Incorrects' }

    @admin = Admin.find_by_email(params[:email])
    @adminname = Admin.find_by_name(params[:name])

    if @admin and @adminname
      @name = Admin.where(name: params[:name]).take
      render json: @name
    else
      render json: email_incorrect
    end

  end

  def register

    @admin = Admin.create admin_params

    if @admin.save                                                                                        
      response = { message: 'User created successfully'}                        
      render json: response, status: :created                                                            
    else                                                                                                 
      responseBad = { message: 'Email repetido' }                                                        
      render json: responseBad                                                                           
    end                                                                                                  

  end 

  
  private
     def admin_params
       params.permit(:name, :email, :password)
     end

end
