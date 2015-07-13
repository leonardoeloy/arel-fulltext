module Arel
  module Nodes
    class FullTextMatch < Arel::Nodes::Binary
      attr_accessor :opts

      def initialize left, right, opts = nil
        super(left, right)
        @opts = opts
      end
    end
  end
end