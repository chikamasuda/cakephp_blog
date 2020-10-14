<h2>Edit Post</h2>

<form action="/posts/edit/<?php echo $this->request->data['Post']['id']; ?>" id="PostEditForm" method="post" accept-charset="utf-8">

  <div style="display:none;">
    <input type="hidden" name="_method" value="POST" />
  </div>

  <div class="input text required">
    <label for="PostTitle">Title</label>
    <input name="data[Post][title]" maxlength="50" type="text" class="title" value="<?php echo $this->request->data['Post']['title']; ?>">
  </div>

  <div class="input textarea required">
    <label for="PostBody">Body</label>
    <textarea name="data[Post][body]" rows="3" cols="30" id="PostBody" required="required"><?php echo $this->request->data['Post']['body']; ?></textarea>
  </div>

  <div class="submit">
    <input type="submit" id="ajax_edit" value="Save Post" data-post-id="<?php echo $this->request->data['Post']['id']; ?>"></input>
  </div>

</form>

<script>
  $(function() {
    $('#ajax_edit').click(function(e) {
        $.post('/posts/ajax_edit/'+$(this).data('post-id'), $('form').serialize(), function(res){
          window.location.href = '/';
        }, "json");
    })
  });
</script>