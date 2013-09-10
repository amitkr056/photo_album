module ApplicationHelper

	def fancy_button(text, path, options={})
		link_to "#{text}", path, options.merge({:class => "fncyBtn #{options[:class]}", :tabindex => autotab})
  	end

  	def autotab
    	current_tab_plus_one
  	end

  	def current_tab_plus_one
  		session[:tab_index] = @current_tab = current_tab + 1
  	end

  	def current_tab
    	return @current_tab if defined?(@current_tab)
    	if request.xhr?
      		@current_tab = session[:tab_index] || 0
    	else
      		session[:tab_index]  = @current_tab = 0
    	end
  	end

end
