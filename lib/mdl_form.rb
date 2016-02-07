require 'mdl_form/form_builder'
require 'mdl_form/helper'

module MdlForm
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

ActionView::Base.send :include, MdlForm::Helper
