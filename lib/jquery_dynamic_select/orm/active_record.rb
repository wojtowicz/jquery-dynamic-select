module JQueryDynamicSelect
  module Orm
    module ActiveRecord
      
      def get_model(model_name)
        Module.const_get(model_name.capitalize.to_s)
      end
      
      def get_dynamic_select_items(parameters)
        object = parameters[:object]
        field = parameters[:field]
        field_value = parameters[:field_value]
        
        #model = get_model(object)
        
        model_method = "dynamic_select_#{field.to_s.gsub('_id', '')}_#{object.to_s.pluralize}"
        
        #Tworzenie metody get modelu (jeżeli nie ma)
        unless object.respond_to?(model_method)
          object.class.send(:define_method, model_method.to_sym) do |fv|
            where(field => fv)
          end
        end
        
        object.send(model_method, field_value)
        
      end
      
      def get_selected_items(object)
        #model = get_model(object)
        #Tworzenie metody get selected modelu (jeżeli nie ma)
        model_method = "dynamic_select_#{object.to_s.pluralize}_selected"
        unless object.respond_to?(model_method)
          object.class.send(:define_method, model_method.to_sym) do |object_id|
            if object.exists?(object_id)
              item = object.find(object_id) 
              selected = item.id
            else
              selected = ''
            end
            selected
          end
        end
        
        return object.send(model_method, params[:object])
      end
    end
  end
end