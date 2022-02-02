module ElasticsearchQuery
  module FilterFormatter
    class Terms < Base
      def to_hash
        { terms: { @name => value } }
      end

      private

      def value
        @value.split(",")
      end
    end
  end
end
