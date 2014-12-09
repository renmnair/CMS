class RolesController < ApplicationController
  
  def new
     @role = Role.new()
  end
  
  def create
    @role = Role.new(role_params)
      if@role.save
         redirect_to roles_path
          flash[:notice] ='The role is saved successfully!'
    
      else
         flash[:error] ='Missing Field'
         redirect_to new_role_path
       end
  end
  
  def show
     @role = Role.find(params[:id])
  end
  
  def index
     @roles = Role.all
  end
  
  def destroy
      @role = Role.find(params[:id])
      @role.destroy
      redirect_to roles_path
  end
  
  def edit
      @role = Role.find(params[:id])
  end
  def update
      @role = Role.find(params[:id])
       if@role.update_attributes(role_params)
        redirect_to roles_path
        flash[:notice] ='The Role is Updated successfully!'
    
       else
        flash[:error] ='Missing Field'
        redirect_to new_role_path
    end 
  end

  private
    def role_params
  	  params.require(:role).permit(:roletype, :description ,:id)
    end
end

