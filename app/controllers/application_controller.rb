class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def search_criterias
    return {} if params.blank?

    search_params = params.select do |field, value|
      field.include?('_search') && value.present?
    end

    product_feed_table = ProductFeed.arel_table
    query = search_params.collect do |field, value|
      search_term = ["%#{value}%"]
      product_feed_table[:"#{field.gsub('_search', '')}"].matches_any(search_term).expr
    end
    query.reduce(:and)
  end
end
