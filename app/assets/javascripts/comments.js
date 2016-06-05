console.log("comments js file")
$(function(){
  $('.new_comment').on('submit', function(e){
    e.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/comments', values);
    posting.done(function(data){
      console.log(data.created_at);
      comment = new Comment(data.content, data.created_at);
      comment.addComment();
    });
    // comment = new Comment(input);
    // console.log(comment.content)
    // comment.addComment();
    // console.log('comment submitted!');
  });
});

var Comment = function(content, created_at){
  this.content = content;
  this.created_at = created_at.slice(0,10);
};

Comment.prototype.addComment = function(){
  $('#comments_list').append('<p>' + this.created_at + ' ' + this.content + '</p> <hr>');
  $('#comment_content').val('');
}
