module LibyuiTestFramework
  module Controllers
    module ExpertPartitioner
      module Libstorageng
        module V4
          class ExpertPartitionerController
            attr_reader(
              :app,
              :abort_page_locators,  
              :add_partition_page_locators,
              :available_storage_page_locators,
              :expert_partitioner_page_locators,
              :hard_disk_page_locators,
              :summary_page_locators,
              :warning_only_use_this_program_page_locators
            )

            def initialize(app)
              @app = app
              @abort_page_locators =
                { yes_button_locator: { label: 'Yes' } }
              @add_partition_page_locators =
                { next_button_locator: { id: 'next' },
                  max_size_radiobutton_locator: { id: 'max_size' },
                  role_operating_system_radiobutton_locator: { id: 'system'},
                  formating_options_label_locator: { label: 'Formatting Options'}}
              @expert_partitioner_page_locators =
                { wizard_label_locator:      { id: 'wizard' },
                  system_view_tree_locator:  { id: '"Y2Partitioner::Widgets::OverviewTree"' },
                  help_button_locator:       { label: 'Help' },
                  abort_button_locator:      { id: 'abort', label: 'Abort' },
                  next_button_locator:       { id: 'next' }}
              @available_storage_page_locators =
                { available_storage_table_locator: { id: '"Y2Partitioner::Widgets::ConfigurableBlkDevicesTable"' }}
              @hard_disk_page_locators =
                { wizard_label_locator: { id: 'wizard' },
                  overview_partitions_tab_locator: { id: '"Y2Partitioner::Widgets::DumbTabPager"' },
                  add_partition_button_locator: { id: '"Y2Partitioner::Widgets::PartitionAddButton"' }}
              @summary_page_locators =
                { changes_to_partitioning_richtext_locator: { id: '"Y2Partitioner::Widgets::SummaryText"' },
                  next_button_locator: { id: 'next' }}
              @warning_only_use_this_program_page_locators =
                { yes_button_locator: { label: 'Yes' } }
            end
                
            def continue_despite_warning
              warning_only_use_this_program_page = Pages::ExpertPartitioner::WarningOnlyUseThisProgramPage.new(
                app: app, **warning_only_use_this_program_page_locators)
              warning_only_use_this_program_page.press_yes
            end

            def wait_default_view_loaded
              available_storage_page = Pages::ExpertPartitioner::AvailableStoragePage.new(
                app: app, **available_storage_page_locators)
            end
            
            def select_hard_disk(disk)
              expert_partitioner_page = Pages::ExpertPartitioner::ExpertPartitionerPage.new(
                app: app, **expert_partitioner_page_locators)
              expert_partitioner_page.select_hard_disk_on_system_view(disk)
            end

            def add_partition             
              hard_disk_page = Pages::ExpertPartitioner::HardDiskPage.new(
                app: app, **hard_disk_page_locators)
              hard_disk_page.select_partitions_tab
              hard_disk_page.press_add_partition

              add_partition_page = Pages::ExpertPartitioner::AddPartitionPage.new(
                app: app, **add_partition_page_locators)
              add_partition_page.press_next_after_setup_new_partition_size
              add_partition_page.press_next_after_setup_role
              add_partition_page.press_next_after_formating_options
            end

            def abort_changes
              expert_partitioner_page = Pages::ExpertPartitioner::ExpertPartitionerPage.new(
                app: app, **expert_partitioner_page_locators)
              expert_partitioner_page.press_abort
              abort_page = Pages::ExpertPartitioner::AbortDialogPage.new(app: app, **abort_page_locators)
              abort_page.press_yes
            end

            def accept_changes
              expert_partitioner_page = Pages::ExpertPartitioner::ExpertPartitionerPage.new(
                app: app, **expert_partitioner_page_locators)
              expert_partitioner_page.press_next
              summary_page = Pages::ExpertPartitioner::SummaryPage.new(app, **summary_page_locators)
              summary_page.press_next
            end
          end
        end
      end
    end
  end
end
