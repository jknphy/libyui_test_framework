module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class WarningOnlyUseThisProgramPage
        # Constructor
        def initialize(**opts)
          @app = opts[:app]

          @yes_button_locator = opts[:yes_button_locator]
        end

        # Method to press 'Yes' button
        def press_yes
          @app.button(@yes_button_locator).click
        end
      end
    end
  end
end
      