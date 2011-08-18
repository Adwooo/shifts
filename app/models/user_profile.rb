class UserProfile < ActiveRecord::Base
  
  validates_attachment_size :photo, :less_than => 3.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  
  has_attached_file :photo, #generates profile picture 
      :styles => { :large => "500x500>", :medium => "250x250>", :small => "150x150>", :thumbnail => "100x100#", :pico => "22x22#"}, 
      :processors => [:cropper],
      :default_url => "/assets/user_profiles/default.jpg",
      :url => "/assets/user_profiles/:id/:style/:normalized_photo_name.extension", 
      :path => ":rails_root/public/assets/user_profiles/:id/:style/:normalized_photo_name.extension"
  belongs_to :user
  has_many :user_profile_entries
  
  Paperclip.interpolates :normalized_photo_name do |attachment, style|
    attachment.instance.normalized_photo_name
  end
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_photo , :if => :cropping?
  
  def cropping?  
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?  
  end

  def normalized_photo_name
    "#{self.id}-#{self.photo_file_name.gsub( /[^a-zA-Z0-9_\.]/, '_')}" 
  end
  
  private  
  def reprocess_photo  
    photo.reprocess!  
  end                     
end
