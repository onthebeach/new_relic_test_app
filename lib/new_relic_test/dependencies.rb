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

  end
end
