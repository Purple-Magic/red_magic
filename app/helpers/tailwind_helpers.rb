module TailwindHelpers
  def email_input(form, attribute, **options, &block)
    content_tag(:div, class: 'mb-4') do
      concat(form.label(attribute, class: "block text-gray-700 text-sm font-bold mb-2"))
      concat(form.email_field(attribute, autofocus: true, class: " w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-red-500", :required => "", :type => "text", **options))
    end
  end

  def text_input(form, attribute, **options, &block)
    content_tag(:div, class: 'mb-4') do
      concat(form.label(attribute, class: "block text-gray-700 text-sm font-bold mb-2"))
      concat(form.email_field(attribute, class: " w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-red-500", :required => "", :type => "text", **options))
    end
  end

  def file_input(form, attribute, **options, &block)
    content_tag(:div, class: 'mb-4') do
      concat(form.label(attribute, class: 'inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded cursor-pointer mt-4', for: :logo, id: :logo_label) do
        "Upload logo"
      end)
      concat(form.file_field(attribute, class: :hidden, id: :logo, onchange: 'document.getElementById("logo_label").textContent = this.files[0].name'))
    end
  end

  def password_input(form, attribute, **options, &block)
    content_tag(:div, class: 'mb-4') do
      concat(form.label(attribute, class: " block text-gray-700 text-sm font-bold mb-2"))
      concat(form.password_field(:password, autocomplete: :off, class: " w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-red-500", :placeholder => "Your password", :required => "", :type => "password", **options))
      yield if block_given?
    end
  end
  
  def submit_button(form, text, &block)
    content_tag(:div, class: "flex items-center justify-between") do
      concat(form.submit(text, class: " bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"))

      yield if block_given?
    end
  end
end
