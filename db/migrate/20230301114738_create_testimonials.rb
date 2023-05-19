class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :testimonial
      t.string :author_avatar
      t.string :author
      t.string :status
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
