class Book < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :book_img, styles:  { medium: "250x350>", thumb:"325x475>" }, :default_url => "/images/:style/missing.png"
     validates_attachment_content_type :book_img, :content_type => /\Aimage\/.*\Z/,
     :storage => :dropbox,

     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
     :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{book_img.original_filename}" },
     :unique_filename => true }
     validates :book_img, :attachment_presence => true 
end
