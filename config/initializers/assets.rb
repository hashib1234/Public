# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( application.js )
Rails.application.config.assets.precompile += %w( application.scss )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( jquery.validate.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-maxlength.min.js )
Rails.application.config.assets.precompile += %w( jquery.inputmask.bundle.min.js )
Rails.application.config.assets.precompile += %w( select2.min.js )
Rails.application.config.assets.precompile += %w( typeahead.bundle.min.js )
Rails.application.config.assets.precompile += %w( jquery.tagsinput.min.js )
Rails.application.config.assets.precompile += %w( dropzone.min.js )
Rails.application.config.assets.precompile += %w( dropify.min.js )
Rails.application.config.assets.precompile += %w( dropify.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-colorpicker.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-datepicker.min.js )
Rails.application.config.assets.precompile += %w( moment.min.js )
Rails.application.config.assets.precompile += %w( tempusdominus-bootstrap-4.js )

Rails.application.config.assets.precompile += %w( form-validation.js )
Rails.application.config.assets.precompile += %w( bootstrap-maxlength.js )
Rails.application.config.assets.precompile += %w( inputmask.js )
Rails.application.config.assets.precompile += %w( select2.js )
Rails.application.config.assets.precompile += %w( typeahead.js )
Rails.application.config.assets.precompile += %w( tags-input.js )
Rails.application.config.assets.precompile += %w( dropzone.js )
Rails.application.config.assets.precompile += %w( dropify.js )
Rails.application.config.assets.precompile += %w( bootstrap-colorpicker.js )
Rails.application.config.assets.precompile += %w( datepicker.js )
Rails.application.config.assets.precompile += %w( timepicker.js )
Rails.application.config.assets.precompile += %w( wizard.js )
Rails.application.config.assets.precompile += %w( jquery.steps.min.js )
Rails.application.config.assets.precompile += %w( core.js )
Rails.application.config.assets.precompile += %w( jquery.steps.css )
Rails.application.config.assets.precompile += %w( template.js )
Rails.application.config.assets.precompile += %w( prism.js )
Rails.application.config.assets.precompile += %w( clipboard.min.js )
Rails.application.config.assets.precompile += %w( feather.min.js )
