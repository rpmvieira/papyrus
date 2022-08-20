class AaBuilder < ActionView::Helpers::FormBuilder
	include ActionView::Helpers::TagHelper
	include ActionView::Context


	# # def label(attribute_name, *args, &block)
	# 	options = args.extract_options!.dup

	# 	default_class = "peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
	# # 	options = arguments_with_updated_default_class(default_class, **options)

	# 	super(attribute_name, *[args.first, options], &block)
	# # end



	# def label(attribute_name, *args, &block)
	# 	# options = args.extract_options!.dup

	# 	# default_class = "peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
	# 	# options = arguments_with_updated_default_class(default_class, **options)

	# 	super(attribute_name, *args, options.reverse_merge(class: 'peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6'), &block)
	# end


	def text_field(attribute, options={})
		content_tag :div, class: "relative z-0 mb-6 w-full group" do
			super(attribute,options.reverse_merge(class: 'block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer'))
		end
	end


	# private

	# def arguments_with_updated_default_class(default_class, **kwargs)
	# 	kwargs = kwargs.dup
	# 	classes = default_class.to_s

	# 	remove_key = :remove_default_class
	# 	class_key = :class

	# 	if kwargs[remove_key].present?
	# 		classes = (classes.split - kwargs[remove_key].split).join(" ")
	# 		kwargs.delete(remove_key)
	# 	end

	#   # simple_form sometimes uses array of classes instead of strings
 #  	# so we have to account for that
 #  	if kwargs[class_key].is_a?(Array)
 #  		kwargs[class_key] = kwargs[class_key].map(&:to_s).join(" ")
 #  	end

 #  	kwargs[class_key] = (classes.split + kwargs[class_key].to_s.split)
 #  	kwargs[class_key] = kwargs[class_key].join(" ")

 #  	kwargs
 #  end


end