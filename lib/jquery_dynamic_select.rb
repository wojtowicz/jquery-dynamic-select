require "jquery_dynamic_select/version"
require "jquery_dynamic_select/form_helper"
require "jquery_dynamic_select/dynamic_select"

module JqueryDynamicSelect
  autoload :Orm, 'dynamic_select/lib/jquery_dynamic_select/orm'
end
class ActionController::Base
  include JQueryDynamicSelect::DynamicSelect
end