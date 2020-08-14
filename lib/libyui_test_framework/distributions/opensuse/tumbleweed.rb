module LibyuiTestFramework
  module Distributions
    module Opensuse
      class Tumbleweed
        def get_expert_partitioner(app)
          Controllers::ExpertPartitioner::Libstorageng::V3::ExpertPartitionerController.new(app)
        end
      end
    end
  end
end
