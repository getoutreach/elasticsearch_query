module ElasticsearchQuery
  module FilterFormatter
    autoload :Base,  'elasticsearch_query/filter_formatter/base'
    autoload :Custom,'elasticsearch_query/filter_formatter/custom'
    autoload :Match, 'elasticsearch_query/filter_formatter/match'
    autoload :Range, 'elasticsearch_query/filter_formatter/range'
    autoload :Terms, 'elasticsearch_query/filter_formatter/terms'

    class << self
      ARRAY_REGEX = Regexp.new(',')
      RANGE_REGEX = Regexp.new('\.\.')

      def formatter_for( value )
        case value
        when String && RANGE_REGEX
          FilterFormatter::Range
        when String && ARRAY_REGEX
          FilterFormatter::Terms
        when String
          FilterFormatter::Match
        when Hash
          FilterFormatter::Custom
        end
      end
    end
  end
end