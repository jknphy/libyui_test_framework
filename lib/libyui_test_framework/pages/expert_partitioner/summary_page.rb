module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class SummaryPage
        attr_reader(
          :app,
          :changes_to_partitioning_richtext_locator,
          :next_button_locator
        )

        def initialize(**opts)
          @app = opts[:app]
          @changes_to_partitioning_richtext_locator = opts[:changes_to_partitioning_richtext_locator]
          @next_button_locator = opts[:next_button_locator]

          app.richtext(changes_to_partitioning_richtext_locator).exists?
        end

        def press_next
          app.button(next_button_locator).click
        end
      end
    end
  end
end
      