class TrainersController < ApplicationController
 before_filter :authenticate_user!
 
 def new
  if is_trainer?
   if no_trainer_detail?
  #@user = current_user
  @employee_number = ("CL_TR_" + rand(36**5).to_s(36)).upcase
  @trainer = Trainer.new()
   else
    flash[:alert] = 'Profile Already Exist'
    redirect_to home_index_path
  end
 else
  flash[:alert] = 'No Permission!!!'
 end
end
 
 def create
    @trainer = Trainer.new(trainer_params)
    @trainer.user_id = current_user.id  
  
  if@trainer.save
   redirect_to trainers_path
   flash[:notice] ='The Trainer is saved successfully!'
   
 else
   flash[:error] ='Missing Field'
   redirect_to new_trainer_path
 end
end
 
      
def show
 @trainer = Trainer.find(params[:id])
end

def index
 if is_admin?
 @trainers = Trainer.all
elsif is_student?
  flash[:error] ='Not Permitted'
         redirect_to home_index_path
  elsif is_trainer?
  @trainers=Trainer.where(:user_id =>current_user.id)       
  end

end

def destroy
  if is_admin?
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect_to trainers_path
else 
  flash[:alert] ='Not Permitted'
         redirect_to trainers_path
  end
end

def edit
  #@employee_number = ("CL_TR_" + rand(36**5).to_s(36)).upcase
  @trainer = Trainer.find(params[:id])
end
def update
  @trainer = Trainer.find(params[:id])
  if@trainer.update_attributes(trainer_params)
    redirect_to trainers_path
    flash[:notice] ='The TrainerDetails Updated successfully!'
    
  else
    flash[:error] ='Missing Field'
    redirect_to new_trainer_path
  end 
end

private
def trainer_params
 params.require(:trainer).permit(:employee_number, :joining_date, :first_name, :middle_name, :last_name, :qualification, :gender, :experience_detail, :experience_year, :home_address, :mobile_phone, :user_id, :course_id )
end
end

