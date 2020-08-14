module LibyuiTestFramework
  module Controllers
    module ExpertPartitioner
      module Libstorageng
        module V4
          class ExpertPartitionerController
            attr_reader :app

            def initialize(app)
              @app = app
            end
                
            def continue_despite_warning
              warning_only_use_this_program_page = Pages::ExpertPartitioner::WarningOnlyUseThisProgramPage.new(app)
              warning_only_use_this_program_page.press_yes

              available_storage_page = Pages::ExpertPartitioner::AvailableStoragePage.new(app)
            end
            
            def select_hard_disk(disk)
              expert_partitioner_page = Pages::ExpertPartitioner::ExpertPartitionerPage.new(app)
              expert_partitioner_page.select_hard_disk_on_system_view(disk)
            end

            def add_partition             
              hard_disk_page = Pages::ExpertPartitioner::HardDiskPage.new(app)
              hard_disk_page.select_partitions_tab
              hard_disk_page.press_add_partition

              add_partition_page = Pages::ExpertPartitioner::AddPartitionPage.new(app)
              add_partition_page.press_next_after_setup_new_partition_size
              add_partition_page.press_next_after_setup_role
              add_partition_page.press_next_after_formating_options
            end

            def abort_changes
              expert_partitioner_page = Pages::ExpertPartitioner::ExpertPartitionerPage.new(app)
              expert_partitioner_page.press_abort
              abort_page = Pages::ExpertPartitioner::AbortDialogPage.new(app)
              abort_page.press_yes
            end

            def accept_changes
              expert_partitioner_page = Pages::ExpertPartitioner::ExpertPartitionerPage.new(app)
              expert_partitioner_page.press_next
              summary_page = Pages::ExpertPartitioner::SummaryPage.new(app)
              summary_page.press_next
            end
          end
        end
      end
    end
  end
end
