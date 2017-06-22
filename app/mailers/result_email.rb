class ResultEmail < ActionMailer::Base
  default from: "chirill@gmail.com"

  def prepare(import)
    @import = import
    @product_feed_count = ProductFeed.count
    @total_updated = History.where.not(updated: nil).count
    @total_deleted = History.where.not(deleted: nil).count

    mail(to: 'email@example.com', subject: 'Import result')
  end
end