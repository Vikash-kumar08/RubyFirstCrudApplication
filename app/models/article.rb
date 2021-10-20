class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }, format: { with: /\A[a-zA-Z0-9 ]+\z/ , message: "no special characters, only letters and numbers" }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  #validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
  validates :phone_number, presence: true, format: { with: /[5-9]{1}\d{9}/, message: "bad format" }, length: { :minimum => 10, :maximum => 10 , message: "bad size"}
  belongs_to :user
  validates :user_id, presence: true, numericality: true


end
