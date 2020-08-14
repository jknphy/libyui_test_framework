module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class HardDiskPage
        attr_reader(
          :app,
          :overview_partitions_tab_locator,
          :add_partition_button_locator
        )

        def initialize(**opts)
          @app = opts[:app]
          @overview_partitions_tab_locator = opts[:overview_partitions_tab_locator]
          @add_partition_button_locator = opts[:add_partition_button_locator]
        end

        def select_overview_tab
          app.tab(overview_partitions_tab_locator).select('&Overview')
        end

        def select_partitions_tab
          app.tab(overview_partitions_tab_locator).select('&Partitions')
        end

        def press_add_partition
          app.button(add_partition_button_locator).click
        end
      end
    end
  end
end
      