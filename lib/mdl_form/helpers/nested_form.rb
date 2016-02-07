begin
  require 'nested_form/builder_mixin'

  module MdlForm
    class NestedFormBuilder < ::MdlForm::FormBuilder
      include ::NestedForm::BuilderMixin
    end
  end

  module MdlForm
    module Helpers
      module NestedForm
        def mdl_nested_form_for(object, options = {}, &block)
          options.reverse_merge!({builder: MdlForm::NestedFormBuilder})
          mdl_form_for(object, options) do |f|
            capture(f, &block).to_s << after_nested_form_callbacks
          end
        end
      end
    end
  end

rescue LoadError
  module MdlForm
    module Helpers
      module NestedForm
        def mdl_nested_form_for(object, options = {}, &block)
          raise 'nested_forms was not found. Is it in your Gemfile?'
        end
      end
    end
  end
end
