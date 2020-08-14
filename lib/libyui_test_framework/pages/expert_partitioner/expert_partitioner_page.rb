module LibyuiTestFramework
  module Pages
    module ExpertPartitioner      
      class ExpertPartitionerPage
        attr_reader :app

        WIZARD_LABEL =     { id: 'wizard' }
        SYSTEM_VIEW_TREE = { id: '"Y2Partitioner::Widgets::OverviewTree"' }
        HELP_BUTTON =      { label: 'Help' }
        ABORT_BUTTON =     { id: 'abort', label: 'Abort' }
        NEXT_BUTTON =      { id: 'next' }

        def initialize(app)
          @app = app         
          
          app.tree(SYSTEM_VIEW_TREE).exists?
        end

        def select_hard_disk_on_system_view(node)
          app.tree(SYSTEM_VIEW_TREE).select(node)
        end

        def press_help
          app.button(HELP_BUTTON).click
        end

        def press_abort
          app.button(ABORT_BUTTON).click
        end

        def press_next
          app.button(NEXT_BUTTON).click
        end
      end
    end
  end
end
      