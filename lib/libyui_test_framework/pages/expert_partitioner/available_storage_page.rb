module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class AvailableStoragePage
        attr_reader(
          :app,
          :available_storage_table_locator
        )

        def initialize(**opts)
          @app = opts[:app]
          @available_storage_table_locator = opts[:available_storage_table_locator]

          app.table(available_storage_table_locator).exists?
        end
      end
    end
  end
end
      