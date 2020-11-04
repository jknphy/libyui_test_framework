module LibyuiTestFramework
  module Helpers
    require 'libyui_test_framework/helpers/local_module_helper'
    # wait until condition returns result, can be used, for instance,
    # to assert that new entry was added to the table, as doesn't appear
    # immediatelly
    # @example:
    #   expect(wait_until { table.items.include?(new_entry) }).to be(true), "New entry is not shown"
    def wait_until(condition: nil)
      YuiRestClient::Wait.until(timeout: YuiRestClient.timeout, interval: YuiRestClient.interval) do
        result = yield(condition)
        return result if result
      end
      nil
    end
  end
end
