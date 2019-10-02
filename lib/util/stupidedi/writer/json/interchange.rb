module Stupidedi
  using Refinements

  module Writer
    class Json
      class Interchange
        attr_reader :node

        def_delegators :node, :children

        def initialize(node)
          @node = node
        end

        def reduce(memo)
          memo[key] = children.map do |c|
            yield(c)
          end
        end

        def key
          :interchanges
        end
      end
    end
  end
end
