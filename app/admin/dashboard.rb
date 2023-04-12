# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    div do
      columns do
        column do
          panel "User Order's count", class:"charge-panel" do
            div class: 'custom-class' do
              data = Hash.new
              User.all.each do |user|
                if user.orders.count > 0
                  data[user.name] = user.orders.count
                end
              end
              top_ten_data = data.sort_by { |k, v| v }.reverse.first(20)
              column_chart top_ten_data
            end
          end
        end

        column do
          panel "Product Based On Category", class:"charge-panel" do
            div class: 'custom-class' do
              data = Hash.new
              Category.all.each do |c|
              if c.products.count > 0
                data[c.name] = c.products.count
              end
              end
              top_ten_data = data.sort_by { |k, v| v }.reverse.first(20)
              pie_chart top_ten_data
            end
          end
        end
      end
    end
    

    # panel "Order count", class:"charge-panel" do
    #   div class: 'custom-class' do
    #     @metric = Order.all # whatever data you pass to chart
    #     render partial: 'metrics/partial_name', locals: {metric: @metric, toggel: "line_chart"}
    #   end
    # end

    # panel "Charges Amount On Pie Chart", class:"charge-panel" do
    #   div class: 'custom-class' do
    #     @metric = User.all # whatever data you pass to chart
    #     render partial: 'metrics/partial_name', locals: {metric: @metric, toggel: "pie_chart"}
    #   end
    # end

    # panel "Admin User Area Chart" do
    #   div class: 'custom-class-user' do
    #     # whatever data you pass to chart
    #     render partial: 'metrics/partial_name', locals: {toggel: ""}
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
