class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります', allow_blank: true }

  with_options presence: { message: 'を入力してください' } do
    validates :first_name
    validates :last_name
    validates :nickname
    validates :first_name_kana
    validates :last_name_kana
    validates :birth_date
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'に全角文字を使用してください', allow_blank: true } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください', allow_blank: true } do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many :items
end
