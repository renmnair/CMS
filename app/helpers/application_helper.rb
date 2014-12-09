module ApplicationHelper
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

end
