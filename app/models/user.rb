class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false}
    validates :place , length: { minimum: 2, maximum: 30 } , presence: true
    validates :self_introduction , length: { minimum: 2, maximum: 100 } , presence: true
    validates :password , length: { minimum: 5, maximum: 50 } , presence: true
    has_secure_password
    
    has_many :microposts
end
