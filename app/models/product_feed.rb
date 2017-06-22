class ProductFeed < ActiveRecord::Base

  before_destroy :add_to_history
  after_update :add_to_history

  validates :title, :description, :affiliate_code, presence: true

  alias_attribute :image_urls, :image_url
  alias_attribute :aff_code, :affiliate_code

  scope :visible, -> { where(deleted: false) }

  def self.create_records(file_records)
    file_records.each do |row|
      create(row.to_hash)
    end
  end

  private

  def add_to_history
    history = History.find_or_initialize_by(
      product_feed_id: self.id
    )

    history.updated = Time.now if self.changed?
    history.deleted = Time.now unless self.changed?

    history.save
  end

end
