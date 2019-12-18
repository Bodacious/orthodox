# frozen_string_literal
#
# Model concern to provide shared behaviour for password resets
#
# Automatically generated by the orthodox gem (https://github.com/katanacode/orthodox)
# (c) Copyright 2019 Katana Code Ltd. All Rights Reserved. 
module PasswordResetable
  
  extend ActiveSupport::Concern
  
  included do
    has_one :password_reset_token, as: :resetable, dependent: :destroy
  end
  
  def destroy_password_reset_token
    password_reset_token.try(:destroy)
  end
  
end