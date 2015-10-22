class AddAttachmentBookImgToBooks < ActiveRecord::Migration
  def change
      add_attachment :books,:book_img
  end
end
