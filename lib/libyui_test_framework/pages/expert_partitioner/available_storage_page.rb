module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class AvailableStoragePage
        attr_reader :app
        
        AVAILABLE_STORAGE_TABLE = { id: '"Y2Partitioner::Widgets::ConfigurableBlkDevicesTable"' }

        def initialize(app)
          @app = app

          app.table(AVAILABLE_STORAGE_TABLE).exists?
        end
      end
    end
  end
end
      