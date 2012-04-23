module ApplicationHelper
  def dynamic_select_selected(object_name, method)
    if(params.key?(:car) && params[:car].key?(:model_id) && params[:car][:model_id] != '')
      params[:car][:model_id]
    elsif params[:id]
      obj = Module.const_get(object_name.to_s.capitalize)
      object = obj.find(params[:id])
      return object.send(method)
    else
      0
    end
  end
end
module ActionView
  module Helpers
    module FormHelper
      def dynamic_select(object_name, method, source, change, choices={}, options ={}, html ={})
        html["dynamic-select"] = source
        html["dynamic-select-change"] = object_name.to_s+'_'+change.to_s
        begin
          html["dynamic-select-selected"] = dynamic_select_selected(object_name, method)
        rescue RuntimeError => e
        end
        select(object_name, method, choices, options, html)
      end
    end
    module FormTagHelper
      def dynamic_select_tag(name, source, change, option_tags = nil, options = {})
        options["dynamic-select"] = source
        options["dynamic-select-change"] = change
        select_tag(name, option_tags, options)
      end
    end
  end
end
class ActionView::Helpers::FormBuilder #:nodoc:
  def dynamic_select(method, source, change, choices = {}, options = {}, html = {})
    @template.dynamic_select(@object_name, method, source, change, choices, objectify_options(options), html)
  end
end