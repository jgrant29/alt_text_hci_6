class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	include Pundit
  helper_method :super_admin
  helper_method :referee
  helper_method :contributor
  helper_method :image_check

  protected

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def super_admin
    if user_signed_in? && current_user.super_user == true && (current_user.email == "kate@seven.army" || current_user.email == "mleon11@ucsc.edu")
      current_user
    else
      nil
    end
  end

  def referee
    if user_signed_in? && current_user.referee == true
      current_user
    else
      nil
    end
  end

  def contributor
    if user_signed_in? && current_user.contributor == true
      current_user
    else
      nil
    end
  end

   def image_check
    file = params[:file].tempfile.read
    
    '''data = JSON.parse(file)
    file1 = URI.parse(a.image_url).open
    puts file1.class
   
    img_mod = Phashion::Image.new(file1.path)
    count = 0
    Alt.all.map { |u| 

       puts u.title
      
       file2 = URI.parse(u.image.url).open
      
      
       if img_mod.duplicate?(Phashion::Image.new(file2.path)) == true
          count = count + 1
          if count == 2
            return true 
          end 
       end 
    }
    return false'''
  end
end
