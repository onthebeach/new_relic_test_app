module NewRelicTest
  module Dependencies
    module_function

    def check!(*dependencies)
      delegate_to_each(dependencies, :check!)
    end

    def configure(*dependencies)
      delegate_to_each(dependencies, :configure)
    end

    def delegate_to_each(dependencies, method)
      dependencies.each do |dependency|
        const_get(dependency, false).public_send(method)
      end
    end

    module Monitoring
      module_function

      def configure
        require 'newrelic_rpm'
        NewRelic::Agent.manual_start
        GC::Profiler.enable
      end

      def check!
        # nothing to see here
      end
    end

  end
end
