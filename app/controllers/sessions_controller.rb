class SessionsController < ApplicationController
    wrap_parameters format: []
    def create
        admin = Admin.find_by(email: admin_params[:email])
        if admin&.authenticate(admin_params[:password])
            session[:admin_id] = admin.id
            render json: admin, status: :created
        else
            render json: {errors: ["Invalid username or password"]}, status: :unprocessable_entity
        end
    end

    def destroy
        if session.include? :admin_id
            session.delete :admin_id
            head :no_content
        else
            render json: {errors: ["Not authorized"]}, status: :unprocessable_entity
        end
    end

    private
    def admin_params
        params.permit(:email, :password)
    end
end
