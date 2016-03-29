class Image < ApplicationRecord
  has_attached_file :image,
                    styles: { big: "1500x1500>" },
                    convert_options: { big: "-quality 75 -strip" }
  validates_attachment :image,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


  def url style=nil
    self.image.url(style)
  end
end
