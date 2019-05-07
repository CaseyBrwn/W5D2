# == Schema Information
#
# Table name: posts
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  url     :string
#  content :string
#  sub_id  :integer          not null
#  user_id :integer          not null
#

class Post < ApplicationRecord

    validates :title, :sub_id, :user_id, presence: true

    belongs_to :sub,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Sub

    belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :post_subs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post_sub

    has_many :comments

end
