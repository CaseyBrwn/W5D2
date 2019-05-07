# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  content           :text             not null
#  user_id           :integer          not null
#  post_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

class Comment < ApplicationRecord
    validates :content, presence: true

    belongs_to :user

    belongs_to :post

    has_one :parent,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: :Comment

    def children
        my_children = Comment.where(parent_comment_id: self.id)
    end

    def self.parentless_comments_by_post_id(post_id)
        Comment.where(post_id: post_id, parent_comment_id: nil)
    end

end
