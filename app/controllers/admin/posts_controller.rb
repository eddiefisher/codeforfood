class Admin::PostsController < Puffer::Base

  setup do
    group :post
    order :'created_at desc'
  end

  index do
    field :title
    field :slug
    field :created_at
    field :updated_at
  end

  form do
    field :title
    field :slug
    field :body, type: :codemirror
    field :created_at
    field :updated_at
  end

end
