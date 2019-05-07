# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<form action="<%= comments_url %>" method="post">
<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

<label for="comment">Comment</label>
<input type="text" name="comment[content]" value="" >
<input type="hidden" name="comment[parent_comment_id]" value="comment.id" >
<input type="hidden" name="comment[post_id]" value="<%= @post.id %>">


<input type="submit" name="" value="Reply">


</form>
<br>