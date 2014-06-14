class Entry < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  def as_json(options)
    {
       :id => id, 
       :name => name, 
       :file => {
         :base64encoded => self.get_file_base64, 
         :checksum => self.generate_file_checksum
       }, 
       :created_at => created_at, 
       :updated_at => updated_at
    }
  end
  def generate_file_checksum
    Digest::SHA256.hexdigest self.get_file_base64
  end
  def get_file_base64
    Base64.encode64(open(file.current_path){ |io| io.read })
  end
end
