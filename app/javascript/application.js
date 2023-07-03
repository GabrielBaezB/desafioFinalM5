// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbolinks:load', function() {
    $(document).on('click', '.pagination a', function(e) {
      e.preventDefault();
      var url = $(this).attr('href');
      $.ajax({
        url: url,
        dataType: 'script'
      });
    });
  });
  