# frozen_string_literal: true

class User < ActiveRecord::Base
  include UserQuery
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :comments
  has_many :posts
end
