module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class AddPartitionPage
        attr_reader :app

        NEXT_BUTTON = { id: 'next' }
        MAX_SIZE_RADIOBUTTON = { id: 'max_size' }
        ROLE_OPERATING_SYSTEM= { id: 'system'}
        FORMATING_OPTIONS_LABEL = { label: 'Formatting Options'}

        def initialize(app)
          @app = app
        end

        def press_next_after_setup_new_partition_size
          app.radiobutton(MAX_SIZE_RADIOBUTTON).exists?
          app.button(NEXT_BUTTON).click
        end

        def press_next_after_setup_role
          app.radiobutton(ROLE_OPERATING_SYSTEM).exists?
          app.button(NEXT_BUTTON).click
        end

        def press_next_after_formating_options
          app.label(FORMATING_OPTIONS_LABEL).exists?
          app.button(NEXT_BUTTON).click
        end
      end
    end
  end
end
      