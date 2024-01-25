# frozen_string_literal: true

module DeviseHelper
  FLASH_STYLE = {
    'alert' => 'warning',
    'notice' => 'success',
    'error' => 'danger'
  }.freeze

  def bootstrap_alert(key)
    FLASH_STYLE[key]
  end
end
