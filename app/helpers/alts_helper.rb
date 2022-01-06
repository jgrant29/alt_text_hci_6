module AltsHelper
	def linked_tag_list(alt)
		list = alt.tag_list.map do |tag_name|
      		link_to tag_name, root_path(tag: tag_name)
    	end
    	safe_join list, ", "
	end
end
