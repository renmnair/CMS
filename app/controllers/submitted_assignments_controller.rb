class SubmittedAssignmentsController < ApplicationController
   before_filter :authenticate_user!

   def new
     @submitted_assignment = SubmittedAssignment.new
  end
  
  def create
    @submitted_assignment = SubmittedAssignment.new(submitted_assignment_params)
      if@submitted_assignment.save
         redirect_to submitted_assignments_path
          flash[:notice] ='The Assignment is Submitted successfully!'
    
      else
         flash[:error] ='Missing Field'
         redirect_to new_submitted_assignment_path
       end
  end
  
  def show
     @submitted_assignment = SubmittedAssignment.find(params[:id])
  end
  
  def index
     if is_admin?
      

      @submitted_assignments = SubmittedAssignment.all
    
    elsif is_student?
     student_id = Student.where(:user_id =>current_user.id).first.id
     @submitted_assignments = SubmittedAssignment.where(:student_id => student_id)
     /course_id = Student.where(:user_id =>current_user.id).first.course_id
     student_id = Student.where(:course_id =>course_id).first.id
     @submitted_assignment = SubmittedAssignment.where(:student_id =>student_id)
     #@assignments = Assignment.all/
   
     elsif is_trainer?
     

     course_id = Trainer.where(:user_id =>current_user.id).first.course_id
     assign =Assignment.where(:course_id=>course_id)
     @submitted_assignments = SubmittedAssignment.where(:assignment_id =>assign)
     /course_id = Trainer.where(:user_id =>current_user.id).first.course_id
     student_id = Student.where(:course_id =>course_id).first.id
     @submitted_assignment = SubmittedAssignment.where(:student_id =>student_id)/
     #@submitted_assignments = SubmittedAssignment.all
   end
  end
  
  def destroy
     if is_admin?
      @submitted_assignment = SubmittedAssignment.find(params[:id])
      @submitted_assignment.destroy
      redirect_to submitted_assignments_path
     else
       flash[:alert] ='No permission!!!'
         redirect_to home_index_path
       end
  end
  
  def edit
      if is_admin?
      @submitted_assignment = SubmittedAssignment.find(params[:id])
      else
       flash[:alert] ='No permission!!!'
         redirect_to home_index_path
       end

  end
  def update
      @submitted_assignment = SubmittedAssignment.find(params[:id])
       if@submitted_assignment.update_attributes(submitted_assignment_params)
        redirect_to submitted_assignments_path
        flash[:notice] ='The Assignment is Submitted successfully!'
    
       else
        flash[:error] ='Missing Field'
        redirect_to new_submitted_assignment_path
    end 
  end

  private
    def submitted_assignment_params
  	  params.require(:submitted_assignment).permit(:attach, :assignment_answer, :assignment_id, :student_id, :id)
    end
 















end
