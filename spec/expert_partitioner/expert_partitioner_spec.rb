require 'rspec'
require 'libyui_client'
require 'libyui_test_framework'

module LibyuiTestFramework
  RSpec.describe "Once Expert partitioner is launched" do
    before :all do
      @app = LibyuiClient::App.new(host: '192.168.200.179' , port: '9999')
      @distri = Distributions::DistributionProvider.provide
      @expert_partitioner = @distri.get_expert_partitioner(@app)
    end

    after :all do
      # ensure module is closed
    end

    it "creates default partitioning on 2nd disk" do
      @expert_partitioner.continue_despite_warning
      @expert_partitioner.wait_default_view_loaded
      @expert_partitioner.select_hard_disk('susetest|Hard Disks|vdb')
      @expert_partitioner.add_partition
      @expert_partitioner.abort_changes
    end
  end
end
