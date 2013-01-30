class PostDrop < Liquid::PostDrop
  attr_accessor :post
  delegate :title, :body, to: :post

  def initialize post
    @post = post
  end

  def path
    controller.post_path post
  end

  def url
    controller.post_url post
  end

private

  def controller
    @context.registers[:controller] if @context
  end
end
