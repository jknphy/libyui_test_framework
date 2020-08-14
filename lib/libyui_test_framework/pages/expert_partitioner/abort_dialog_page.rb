module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class AbortDialogPage
        attr_reader :app
        
        YES_BUTTON = { label: 'Yes' }

        def initialize(app)
          @app = app
        end

        def press_yes
          app.button(YES_BUTTON).click
        end
      end
    end
  end
end
      