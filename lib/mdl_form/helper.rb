require_relative 'helpers/nested_form'

module MdlForm
  module Helper
    include ::MdlForm::Helpers::NestedForm

    def mdl_form_with(options = {}, &block)
      options.reverse_merge!({builder: MdlForm::FormBuilder})

      options[:html] ||= {}
      options[:html][:role] ||= 'form'

      layout = case options[:layout]
        when :inline
          "form-inline"
        when :horizontal
          "form-horizontal"
      end

      if layout
        options[:html][:class] = [options[:html][:class], layout].compact.join(" ")
      end

      temporarily_disable_field_error_proc do
        form_with(options, &block)
      end
    end

    def mdl_form_for(object, options = {}, &block)
      options.reverse_merge!({builder: MdlForm::FormBuilder})

      options[:html] ||= {}
      options[:html][:role] ||= 'form'

      layout = case options[:layout]
        when :inline
          "form-inline"
        when :horizontal
          "form-horizontal"
      end

      if layout
        options[:html][:class] = [options[:html][:class], layout].compact.join(" ")
      end

      temporarily_disable_field_error_proc do
        form_for(object, options, &block)
      end
    end

    def mdl_form_tag(options = {}, &block)
      options[:acts_like_form_tag] = true

      mdl_form_for("", options, &block)
    end

    def temporarily_disable_field_error_proc
      original_proc = ActionView::Base.field_error_proc
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      yield
    ensure
      ActionView::Base.field_error_proc = original_proc
    end
  end
end
