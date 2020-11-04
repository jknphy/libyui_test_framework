require 'rspec'
require 'yui_rest_client'
require 'libyui_test_framework'

module LibyuiTestFramework
  RSpec.describe "Once Expert partitioner is launched" do
    before :all do
      port = '9999'
      @app = YuiRestClient::App.new(host: 'localhost' , port: port)

      @local_process = Helpers::LocalModule.new(port: port, name: 'partitioner')
      @local_process.start_qt

      @distri = Distributions::DistributionProvider.provide
      @expert_partitioner = @distri.get_expert_partitioner(@app)
      @app.connect
    end

    after :all do
      # ensure module is closed
      @local_process.kill
    end

    it "creates default partitioning on 2nd disk" do
      @expert_partitioner.continue_despite_warning
      @expert_partitioner.select_hard_disk('susetest|Hard Disks|vdb')
      @expert_partitioner.add_partition
      @expert_partitioner.abort_changes
    end
  end
end
