module DynamicAttributeSupport

  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def dynamic_attributes
      attributes.keys - fields.keys
    end

    def static_attributes
      fields.keys - dynamic_attributes
    end
  end

end