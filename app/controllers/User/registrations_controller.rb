class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def new
    build_resource({})
    resource.build_emp_detail
    respond_with self.resource
    super
  end

  def create
    build_resource(sign_up_params)

    # Save the user without bypassing validation
    resource_saved = resource.save

    yield resource if block_given?

    if resource_saved
      # If you're navigating users based on some condition, then modify this path
      redirect_to admin_index_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role])
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
      .tap { |whitelisted| whitelisted[:role] = params[:user][:role] == "true" ? 1 : 0 }
  end

  def after_sign_up_path_for(resource)
    # Define the path to the admin dashboard here
    admin_index_path
  end
end