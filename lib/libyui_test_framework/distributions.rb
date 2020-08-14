module LibyuiTestFramework
  module Distributions    
    require 'libyui_test_framework/distributions/opensuse/tumbleweed'
    require 'libyui_test_framework/distributions/sle/current15'
    require 'libyui_test_framework/controllers'
    
    class DistributionProvider
      def self.provide
        return Sle::Current15.new if ENV['DISTRI'] == '15-SP2'
        return Opensuse::Tumbleweed.new
      end
    end
  end
end
