# == Schema Information
#
# Table name: post_subs
#
#  id      :bigint           not null, primary key
#  post_id :integer          not null
#  sub_id  :integer          not null
#

class Post_sub < ApplicationRecord
    validates :post_id, uniqueness: {scope: :sub_id}
  

    belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post

    belongs_to :sub,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Sub



end
