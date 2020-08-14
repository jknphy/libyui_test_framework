module LibyuiTestFramework
  module Distributions
    module Sle
      class Current15
        def get_expert_partitioner(app)
          Controllers::ExpertPartitioner::Libstorageng::V4::ExpertPartitionerController.new(app)
        end
      end
    end
  end
end
