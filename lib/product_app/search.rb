module ProductApp
  class Search
    def self.criterias(params, model)
      return {} if params.blank?

      search_params = params.select do |field, value|
        field.include?('_search') && value.present?
      end

      product_feed_table = model.arel_table
      query = search_params.collect do |field, value|
        search_term = ["%#{value}%"]
        product_feed_table[:"#{field.gsub('_search', '')}"].matches_any(search_term).expr
      end
      query.reduce(:and)
    end
  end
end