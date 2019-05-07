# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true
    validates :title, uniqueness: {scope: :moderator_id, message: "You are already a mod of this sub"}
    validates :title, uniqueness: true

    belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

    has_many :posts,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Post

    has_many :post_subs,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Post_sub

end
