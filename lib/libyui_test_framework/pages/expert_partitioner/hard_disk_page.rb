module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class HardDiskPage
        attr_reader :app

        WIZARD_LABEL = { id: 'wizard' }
        OVERVIEW_PARTITIONS_TAB = { id: '"Y2Partitioner::Widgets::DumbTabPager"' }
        ADD_PARTITION_BUTTON = { id: '"Y2Partitioner::Widgets::PartitionAddButton"' }

        def initialize(app)
          @app = app
        end

        def select_overview_tab
          app.tab(OVERVIEW_PARTITIONS_TAB).select('&Overview')
        end

        def select_partitions_tab
          app.tab(OVERVIEW_PARTITIONS_TAB).select('&Partitions')
        end

        def press_add_partition
          app.button(ADD_PARTITION_BUTTON).click
        end
      end
    end
  end
end
      