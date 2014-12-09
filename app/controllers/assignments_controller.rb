class AssignmentsController < ApplicationController
   before_filter :authenticate_user!
    def new
    if is_trainer?
       @assignment = Assignment.new()
     else
      flash[:alert] ='No Permission'
      redirect_to home_index_path
    end
  end
  
  def create
    
    @assignment = Assignment.new(assignment_params)
      
      if @assignment.save
         redirect_to assignments_path
          flash[:notice] ='The Assignment is saved successfully!'
    
      else
         flash[:error] ='Missing Field'
         redirect_to new_assignment_path
       end
  end
  
  def show
     @assignment = Assignment.find(params[:id])
  end
  
  def index
    
    if is_admin?
      @assignments = Assignment.all
    
    elsif is_student?
     
     course_id = Student.where(:user_id =>current_user.id).first.course_id
     @assignments = Assignment.where(:course_id =>course_id)
     #@assignments = Assignment.all
   
     elsif is_trainer?
    
     course_id = Trainer.where(:user_id =>current_user.id).first.course_id
     @assignments = Assignment.where(:course_id =>course_id)
   end
  end
  
  def destroy
      if !is_student?
      @assignment = Assignment.find(params[:id])
      @assignment.destroy
      redirect_to assignments_path
    else
       flash[:alert] ='No permission!!!'
         redirect_to home_index_path
       end

  end
  
  def edit
      if !is_student?
      @assignment = Assignment.find(params[:id])
      else
       flash[:alert] ='No permission!!!'
         redirect_to home_index_path
       end
  end
  def update
      @assignment = Assignment.find(params[:id])
       if@assignment.update_attributes(assignment_params)
        redirect_to assignments_path
        flash[:notice] ='The Assignment is Updated successfully!'
    
       else
        flash[:error] ='Missing Field'
        redirect_to new_assignment_path
    end 
  end
  
  private
    def assignment_params
  	  params.require(:assignment).permit(:assignment_title, :start_date, :end_date, :course_id, :id)
    end
 





end
