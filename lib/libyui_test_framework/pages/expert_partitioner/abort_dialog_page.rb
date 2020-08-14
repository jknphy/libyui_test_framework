module LibyuiTestFramework
  module Pages
    module ExpertPartitioner
      class AbortDialogPage

        def initialize(**opts)
          @app = opts[:app]

          @yes_button_locator = opts[:yes_button_locator]
        end

        def press_yes
          @app.button(@yes_button_locator).click
        end
      end
    end
  end
end
      