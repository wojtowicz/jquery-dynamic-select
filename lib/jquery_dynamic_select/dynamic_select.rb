    
module JQueryDynamicSelect
  module DynamicSelect
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, JQueryDynamicSelect::Orm::ActiveRecord
    end
    module ClassMethods
      def dynamic_select(field, method, options = {})
        define_method("dynamic_select_#{field}_#{method.to_s.pluralize}") do
          field_value = params[:field]
          field_id = (options[:field_id] == false) ? field : field.to_s+'_id'
          method_id = (options[:method_id] == false) ? method : method.to_s+'_id'

          object = (options.has_key?(:object)) ? options[:object] : Module.const_get(method.capitalize.to_s)
          
          items = get_dynamic_select_items({:object => object, :field => field_id, :field_value => field_value})
          selected = get_selected_items(object)
          
          render :layout => false, :text => select_for_dynamic_select(params[:controller].singularize, method_id, request.fullpath.gsub( /\?.*/, "" ), items, selected, field_id)
        end
      end
    end
    def select_for_dynamic_select(object,method, source, items, selected, change)
      helpers = self.class.helpers
      select_options = helpers.options_for_select(items.collect { |model| [model.name, model.id] }, selected)
      helpers.dynamic_select(object, method, source, change, select_options, {:prompt => "Wybierz model samochodu"}, {:class => 'input'})
    end
  end
end