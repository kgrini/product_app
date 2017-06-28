require 'csv'

class Import < ActiveRecord::Base

  def initialize(params = {})
    file = params.delete(:file)
    super
    if file
      self.filename = sanitize_filename(file.original_filename)
      self.content_type = file.content_type
      self.file_contents = file.read
    end
  end

  validates :title, presence: true
  validate  :file_presence, :file_format, :validate_csv_content

  def file_presence
    if self.filename.blank?
      errors[:file] << 'Field could not be blank. Please add a .csv file'
    end
  end

  def file_format
    unless self.filename.present? && valid_extension?(self.filename)
      errors[:file] << 'Invalid file format. Unpoaded file should be only .csv'
    end
  end

  def valid_extension?(filename)
    ext = File.extname(filename)
    %w(.csv).include? ext.downcase
  end

  def parse_file
    CSV.parse(
      file_contents,
      col_sep: ',',
      quote_char: '"',
      :headers => true
    )
  end

  def update_state_and_send_result
    update_attributes(
      imported_at: Time.now,
      state: 'done'
    )

    ResultEmail.prepare(self).deliver
  end


  def validate_csv_content
    if self.file_contents.blank?
      errors[:file] << "Csv content could not be empty"
    end
  end

  private

  def sanitize_filename(filename)
    return File.basename(filename)
  end

end
