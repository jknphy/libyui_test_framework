module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class SummaryPage
        attr_reader :app

        CHANGES_TO_PARTITIONING_RICHTEXT = { id: '"Y2Partitioner::Widgets::SummaryText"' }
        NEXT_BUTTON = { id: 'next' }

        def initialize(app)
          @app = app

          app.richtext(CHANGES_TO_PARTITIONING_RICHTEXT).exists?
        end

        def press_next
          app.button(NEXT_BUTTON).click
        end
      end
    end
  end
end
      