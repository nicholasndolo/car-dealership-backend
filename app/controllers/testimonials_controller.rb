class TestimonialsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Testimonial.all, status: :ok
    end
    def create
        testimonial = Testimonial.create!(testimonial_params)
        render json: Testimonial.all, status: :created
    end

    def update
        testimonial = find_testimonial
        testimonial.update!(testimonial_params)
        render json: testimonial, status: :accepted
    end

    private
    def testimonial_params
        params.permit(:testimonial, :author_avatar, :author, :status, :admin_id)
    end

    def find_testimonial
        Testimonial.find(params[:id])
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
