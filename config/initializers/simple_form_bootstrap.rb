# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.input_class = 'form-control'

  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers 'horizontal-group', tag: 'div', class: 'form-group row', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input, wrap_with: { class: 'col-lg-6' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
