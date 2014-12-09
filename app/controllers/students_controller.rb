class StudentsController < ApplicationController
  before_filter :authenticate_user!
    def new
      if is_student?
       if no_student_detail?
         @admission_number = ("CL_ST_" + rand(36**5).to_s(36)).upcase
         @student = Student.new()
         else
         flash[:alert] = 'Profile Already Exist'
         redirect_to home_index_path
       end
     else 
      flash[:alert] = 'No Permission!!!'
      redirect_to home_index_path
  end
  end
  def create
    
    @student = Student.new(student_params)
    @student.user_id = current_user.id
      if@student.save
         redirect_to students_path
          flash[:notice] ='The Student is saved successfully!'
        else
         flash[:error] ='Missing Field'
         redirect_to new_student_path
       end
  end
  

  def show
      
     @student = Student.find(params[:id])
  end
  
  def index
     if is_admin?
      @students = Student.all
    else
      @students = Student.where(:user_id =>current_user.id)
    end
  end
  
  def destroy
      if is_admin?
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to students_path
      else
        flash[:alert] = 'No Permission!!!'
        redirect_to students_path
      end
  end
  
  def edit
      @student = Student.find(params[:id])
  end
  def update
      @student = Student.find(params[:id])
       if@student.update_attributes(student_params)
        redirect_to students_path
        flash[:notice] ='The Student is Updated successfully!'
    
       else
        flash[:error] ='Missing Field'
        redirect_to new_student_path
    end 
  end
  
  private
    def student_params
  	  params.require(:student).permit(:admission_no, :admission_date, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :blood_group, :language, :address, :phone, :resume_filename, :user_id, :course_id )
    end
end










