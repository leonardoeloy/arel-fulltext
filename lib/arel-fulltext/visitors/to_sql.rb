module Arel
  module Visitors
    class ToSql < Arel::Visitors::Reduce
      def visit_Arel_Nodes_FullTextMatch o, collector
        print_fulltext_fallback_warning

        collector = visit o.left, collector
        collector << ' LIKE '
        collector << quote(o.right)

        collector
      end

      private
      def print_fulltext_fallback_warning
        unless defined?($arel_silence_type_casting_deprecation) && $arel_silence_type_casting_deprecation
          warn "It seems Arel Full-Text doesn't support your database. I will fallback to a plain LIKE. You may want to fix this."
        end
      end
    end
  end
end
