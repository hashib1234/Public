class ComponentsController < ApplicationController
	def component
		
		 str = params[:pages]
			  
			case str  
			when "covid-vaccination"  
			 render "alert"
			when "blood-bank"  
			  render "badges"
			when "covid-result" 

			   
			 render "breadcrumbs"
			when "buttons"  
			   render "button"
			when "button-group"  
			   render "button-group"
			when "cards"  
			   render "cards"  
			when "carousel"  
			   render "carousel"  
			when "collapse"  
			   render "collapse"  
	        when "dropdowns"
	         	render "dropdowns"
	        when "list-group"
	         	render "list-group"
	        when "media-object"
	         	render "media-object"
	        when "modal"
	         	render "modal"
	        when "navbar"
	         	render "navbar"
	        when "navs"
	         	render "navs"
	        when "pagination"
	         	render 'pagination'
	        when "popover"
	         	render 'popover'
	        when "progress"
	         	render 'progress'
	        when "scrollpy"
	         	render 'scrollpy'
	        when "spinner"
	         	render 'spinner'
	        when "tooltip"
	         	render 'tooltip'
	        when "scrollbar"
	         	render 'scrollbar'
	        when "basic-elements"
	         	render 'basic-elements'
	        when "advanced-elements"
	         	render 'advanced-elements'
	        when "editors"
	         	render 'editors'
	        when "wizard"
	         	render 'wizard'
	        when "basic-table"
                  @base_table = DataTable.select(:id, :name, :age, :salary).limit(5)
                  @base_table1 = DataTable.select(:id, :name, :position, :office).limit(5)
                  @base_table3 = DataTable.select(:id, :name, :age, :salary,:start_date).limit(5)
	        	render "basic-table"
            when "data-table"
                @data_table = DataTable.all
            	render 'data-table'
	        when "owl_carousel"
	        	render 'owl-carousel'
	        when "sweet-alert"
	        	render 'sweet-alert'
	        when "feather-icons"
	        	render 'feather-icons'
	        when "flag-icones"
	        	render 'flag-icones'
	        when "faq"
	        	render 'faq'
	        when "error"
	        	render "404"
	        when "error1"
	        	render "500"
	        else  
                 puts "Default!"
			end  

   end

end