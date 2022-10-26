class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: {message: 'を入力してください'}

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}

  with_options presence: {message: 'を入力してください'}, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'に全角文字を使用してください'} do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: {message: 'を入力してください'}, format: {with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください'} do
  validates :first_name_kana
  validates :last_name_kana
  end

  validates :birth_date, presence: {message: 'を入力してください'}
end
