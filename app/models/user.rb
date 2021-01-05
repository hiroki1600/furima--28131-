class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         
   validates :nickname, presence: true, length: { maximum: 40 }
   validates :birthday, presence: true
  
 with_options presence: true do
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'passwordには英字と数字の両方を含めて設定してください' }
 end

 has_many :items
 has_many :favorites, dependent: :destroy
 has_many :messages
 has_many :sns_credentials

 def already_favorited?(item)
  self.favorites.exists?(item_id: item.id)
 end

 def self.from_omniauth(auth)
  sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  # sns認証したことがあればアソシエーションで取得
  # 無ければemailでユーザー検索して取得orビルド(保存はしない)
  user = User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
      email: auth.info.email
  )
  # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
  if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
  end

end
