# class AdminsController < ApplicationController
#     rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

#     def create
#         admin = Admin.create(admin_params)
#         if admin.valid?
#             session[:admin_id] = admin.id
#             render json: admin, status: :created
#         else
#             render json: {errors: admin.errors.full_messages}, status: :unprocessable_entity
#         end
#     end

#     def show
#         admin = Admin.find_by(id: session[:admin_id])
        
#         if admin
#             render json: admin, status: :created
#         else
#             render json: {error: "Not authorized"}, status: :unauthorized
#         end
#     end


#     private

#     def admin_params
#         params.permit(:name, :email, :password, :password_confirmation, :avatar_url)
#     end

#     def render_unprocessable_entity_response(invalid)
#         render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
#     end
# end
