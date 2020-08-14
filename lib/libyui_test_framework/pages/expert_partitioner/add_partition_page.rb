module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class AddPartitionPage
        attr_reader(
          :app,
          :next_button_locator,
          :max_size_radiobutton_locator,
          :role_operating_system_radiobutton_locator,
          :formating_options_label_locator
        )

        def initialize(**opts)
          @app = opts[:app]
          @next_button_locator = opts[:next_button_locator]
          @max_size_radiobutton_locator = opts[:max_size_radiobutton_locator]
          @role_operating_system_radiobutton_locator = opts[:role_operating_system_radiobutton_locator]
          @formating_options_label_locator = opts[:formating_options_label_locator]
        end

        def press_next_after_setup_new_partition_size
          app.radiobutton(max_size_radiobutton_locator).exists?
          app.button(next_button_locator).click
        end

        def press_next_after_setup_role
          app.radiobutton(role_operating_system_radiobutton_locator).exists?
          app.button(next_button_locator).click
        end

        def press_next_after_formating_options
          app.label(formating_options_label_locator).exists?
          app.button(next_button_locator).click
        end
      end
    end
  end
end
      