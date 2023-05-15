module TailwindHelpers
  def email_input(form, attribute)
    content_tag(:div, class: 'mb-4') do
      concat(form.label(attribute, class: "block text-gray-700 text-sm font-bold mb-2"))
      concat(form.email_field(attribute, autofocus: true, class: " w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-red-500", :placeholder => "Your email", :required => "", :type => "text"))
    end
  end

  def password_input(form, attribute, **options)
    content_tag(:div, class: 'mb-4') do
      concat(form.label(attribute, class: " block text-gray-700 text-sm font-bold mb-2"))
      concat(form.password_field(:password, autocomplete: :off, class: " w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-red-500", :placeholder => "Your password", :required => "", :type => "password", **options))
    end
  end
  
  def submit_button(form, text, &block)
    content_tag(:div, class: "flex items-center justify-between") do
      concat(form.submit(text, class: " bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"))

      yield
    end
  end
end
