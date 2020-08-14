module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class WarningOnlyUseThisProgramPage
        attr_reader :app
        
        YES_BUTTON = { label: 'Yes' } 

        def initialize(app)
          @app = app
        end

        # Method to press 'Yes' button
        def press_yes
          app.button(YES_BUTTON).click
        end
      end
    end
  end
end
      