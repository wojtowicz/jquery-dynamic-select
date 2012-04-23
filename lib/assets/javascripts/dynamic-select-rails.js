$(document).ready(function(){
    $('select[dynamic-select-change]').each(function(){
        var id = $(this).attr('dynamic-select-change');
        var hash_id = '#'+id;
        var url = $(this).attr('dynamic-select');
        var selected = $(this).attr('dynamic-select-selected')
        id = $(this).attr('id');
        $(hash_id).change(function(){
            var field = $(hash_id+" option:selected").val();
            $.ajax({
              url: url,
              type: 'GET',
              data: 'field='+field+'&object='+selected,
              beforeSend: function(){
                  console.log('BEFORE_SEND');
                  $("#"+id).parent().append('<img class="loader" src="/assets/my/ajax-loader.gif" alt="loader" id="'+id+'">');
                  $("#"+id).remove();
              },
              error: function() {
                  console.log('ERROR');
              },
              complete: function(){
                  console.log('COMPLETE')
              },
              success: function(msg) {
                var select_update =  $("#"+id);
                var select_update_parent = select_update.parent();
                select_update.remove();
                select_update_parent.append(msg);
              }
            });
        });
        $(hash_id).change();
    });
});