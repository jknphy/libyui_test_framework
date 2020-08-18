require 'rspec'
require 'libyui_client'
require 'libyui_test_framework'

module LibyuiTestFramework
  RSpec.describe "Once Expert partitioner is launched" do
    before :all do
      @app = LibyuiClient::App.new(host: '192.168.200.146' , port: '9999')
      
      local_process = LibyuiClient::LocalProcess.new
      local_process.start_app('YUI_REUSE_PORT=1 YUI_HTTP_PORT=9999 yast2 partitioner --qt')
      local_process.start_app("xterm -e 'YUI_REUSE_PORT=1 YUI_HTTP_PORT=9999 yast2 partitioner --ncurses'")
      
      @distri = Distributions::DistributionProvider.provide
      @expert_partitioner = @distri.get_expert_partitioner(@app)
    end

    after :all do
      # ensure module is closed
      @local_process.kill_app
    end

    it "creates default partitioning on 2nd disk" do
      @expert_partitioner.continue_despite_warning
      @expert_partitioner.select_hard_disk('susetest|Hard Disks|vdb')
      @expert_partitioner.add_partition
      @expert_partitioner.abort_changes
    end
  end
end
