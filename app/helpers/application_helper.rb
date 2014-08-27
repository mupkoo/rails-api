module ApplicationHelper

    def render_errors_for(form)
        if form.object.errors.any?
            content_tag :div, class: 'alert alert-danger' do
                form.object.errors.full_messages.map do |message|
                    content_tag :p, message
                end.join('').html_safe
            end
        end
    end

    def resolve_flash(key)
        main = 'alert alert-dismissable '

        case key.to_s
            when 'notice'  then main + 'alert-info'
            when 'success' then main + 'alert-success'
            when 'error'   then main + 'alert-danger'
            when 'alert'   then main + 'alert-danger'
        end
    end

end
