module ApplicationHelper

    def print_parent(comment)
        html="<li>"
        html+= "#{h(comment.content)}"

        html+="<form action=\"#{comments_url}\" method=\"post\">"
        html+="<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">"

        html+="<label for=\"comment\">Comment</label>"
        html+="<input type=\"text\" name=\"comment[content]\" >"
        html+="<input type=\"hidden\" name=\"comment[parent_comment_id]\" value=\"#{comment.id}\" >"
        html+="<input type=\"hidden\" name=\"comment[post_id]\" value=\"#{@post.id}\">"

        html+="<input type=\"submit\" value=\"Reply\">"
        html+="</form>"
        html+="</li>"

        if !comment.children.empty?
            html+="<ul>"
                comment.children.each do |child|
                    # debugger
                    html+=print_parent(child)
                end

            html+="</ul>"
        end

        html.html_safe

    end
end
