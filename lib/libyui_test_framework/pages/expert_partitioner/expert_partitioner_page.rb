module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class ExpertPartitionerPage
        attr_reader(
          :app,
          :wizard_label_locator,
          :system_view_tree_locator,
          :help_button_locator,
          :abort_button_locator,
          :finish_button_locator,
          :next_button_locator
        )

        # Constructor
        def initialize(**opts)
          @app = opts[:app]
          @wizard_label_locator = opts[:wizard_label_locator]
          @system_view_tree_locator = opts[:system_view_tree_locator]
          @help_button_locator = opts[:help_button_locator]
          @abort_button_locator = opts[:abort_button_locator]
          @next_button_locator = opts[:next_button_locator]

          app.tree(system_view_tree_locator).exists?
        end

        def select_hard_disk_on_system_view(node)
          app.tree(system_view_tree_locator).select(node)
        end

        def press_help
          app.button(help_button_locator).click
        end

        def press_abort
          app.button(abort_button_locator).click
        end

        def press_next
          app.button(next_button_locator).click
        end
      end
    end
  end
end
      