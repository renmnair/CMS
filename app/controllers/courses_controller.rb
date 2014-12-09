class CoursesController < ApplicationController
  before_filter :authenticate_user! 
   
   def new
     if is_admin?
     @course = Course.new()
   else
    redirect_to home_index_path
  end
  end
  
  def create
    @course = Course.new(course_params)
      if@course.save
         redirect_to courses_path
          flash[:notice] ='The Course is saved successfully!'
    
      else
         flash[:error] ='Missing Field'
         redirect_to new_course_path
       end
  end
  
  def show
     @course = Course.find(params[:id])
  end
  
  def index
     @courses = Course.all
  end
  
  def destroy
      if is_admin?
      @course = Course.find(params[:id])
      @course.destroy
      redirect_to courses_path
     else
      flash[:alert] = 'No Permission!!!'
    redirect_to courses_path
  end
  end
  
  def edit
      if is_admin?
      @course = Course.find(params[:id])
      else
      flash[:alert] = 'No Permission!!!'
    redirect_to courses_path
  end
  end
  def update
      @course = Course.find(params[:id])
       if@course.update_attributes(course_params)
        redirect_to courses_path
        flash[:notice] ='The Course is Updated successfully!'
    
       else
        flash[:error] ='Missing Field'
        redirect_to new_course_path
    end 
  end

  private
    def course_params
  	  params.require(:course).permit(:course_name, :duration ,:id)
    end
 
end
