# Form object for handling two-factor authentication sessions
#
# Automatically generated by the orthodox gem (https://github.com/bodacious/orthodox)

class TfaSession
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  # =============
  # = Constants =
  # =============
  
  ##
  # Regex for OTP format
  OTP_FORMAT = /\A\d{3,5}\Z|/
  
  ##
  # Regex for recovery code format
  RECOVERY_CODE_FORMAT = /\A\w{5}\-\w{5}\Z/
  
  # ==============
  # = Attributes =
  # ==============
  
  attribute :otp, :string
  
  attribute :recovery_code, :string
  
  attribute :record
  
  
  # ===============
  # = Validations =
  # ===============
  
  validates :otp, format: { with: OTP_FORMAT }, 
                  numericality: { allow_blank: true },
                  presence: { unless: :recovery_code? }
  
  validates :record, presence: true
  
  validate :otp_correct, if: :otp?, unless: :recovery_code?

  validate :recovery_code_correct, if: :recovery_code?, unless: :otp?
  
  
  # ===========================
  # = Public instance methods =
  # ===========================
  
  def otp?
    otp.present?
  end
  
  def recovery_code?
    recovery_code.present?
  end
  
  private
  
  # ============================
  # = Private instance methods =
  # ============================
  
  def otp_correct
    unless record.valid_otp?(otp.to_s)
      errors.add(:base, "OTP code was not correct")
    end
  end
  
  def recovery_code_correct
    unless record.valid_recovery_code?(recovery_code.to_s)
      errors.add(:base, "Recovery code was not correct")
    end    
  end
  
end
