# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Books" do
          ul do
            Book.order(created_at: :desc).limit(5).map do |book|
              li link_to(book.title, admin_book_path(book))
            end
          end
        end
      end

      column do
        panel "Recent Authors" do
          ul do
            Author.order(created_at: :desc).limit(5).map do |author|
              li link_to(author.name, admin_author_path(author))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Genres" do
          ul do
            Genre.order(created_at: :desc).limit(5).map do |genre|
              li link_to(genre.name, admin_genre_path(genre))
            end
          end
        end
      end

      column do
        panel "Recent Reviews" do
          ul do
            Review.order(created_at: :desc).limit(5).map do |review|
              li link_to(review.content.truncate(30), admin_review_path(review))
            end
          end
        end
      end
    end
  end
end
