require "jquery_dynamic_select/version"
require "jquery_dynamic_select/form_helper"
require "jquery_dynamic_select/dynamic_select"

module JQueryDynamicSelect
  autoload :Orm, "jquery_dynamic_select/orm"
end
class ActionController::Base
  include JQueryDynamicSelect::DynamicSelect
end