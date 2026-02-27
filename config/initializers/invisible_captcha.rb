# https://www.rubydoc.info/gems/invisible_captcha/2.3.0

InvisibleCaptcha.setup do |config|
  config.honeypots = :subtitle 
  config.visual_honeypots = false
  config.timestamp_threshold = 3
  config.timestamp_enabled = true
  config.injectable_styles = false
  config.spinner_enabled  = true

  # Leave these unset if you want to use I18n (see below)
  config.sentence_for_humans = 'If you are a human, ignore this field'
  config.timestamp_error_message = 'Sorry, Something went wrong! Please try again later.'
end
 