class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def is_admin?
    if current_user.role_id == Role.find_by_roletype("admin").id
      return true
    else
      return false
    end
  end
  def is_student?
    if current_user.role_id == Role.find_by_roletype("student").id
      return true
    else
      return false
    end
  end
  def is_trainer?
    if current_user.role_id == Role.find_by_roletype("trainer").id
      return true
    else
      return false
    end
  end

  def after_sign_in_path_for(user)
    if is_admin?
      admin_index_path
    elsif is_student?
      home_index_path
    elsif is_trainer?
      home_index_path
    end
  end

  def after_sign_up_path_for(user)
    if is_admin?
      admin_index_path
    elsif is_student?
      home_index_path
    elsif is_trainer?
      home_index_path
    end
  end
  
  private
  def authenticate_inviter!
    unless is_admin?
      redirect_to home_index_path, :alert => "Access Denied"
    end
    super
  end
def no_trainer_detail?
    a = current_user.id
    b = Trainer.where(:user_id => a).first
    if !b
      return true
    else
      return false
    end
   end
def no_student_detail?
    a = current_user.id
    b = Student.where(:user_id => a).first
    if !b
      return true
    else
      return false
    end
   end

  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :role_id, :f_name) }
          
          devise_parameter_sanitizer.for(:accept_invitation) do |u|
              u.permit(:f_name,:phone, :role_id,:password, :password_confirmation,
                       :invitation_token)
      
      end
      end 




end
