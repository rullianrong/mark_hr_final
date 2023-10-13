class ApplicationController < ActionController::Base
    protected

  # Customize the redirect after sign-in based on user's role
  def after_sign_in_path_for(resource)
    if resource.admin?
      # Redirect to the admin dashboard or any other admin-specific page
      admin_index_path
    else
      # Redirect to the client dashboard or any other client-specific page
      client_index_path
    end
     end
end
