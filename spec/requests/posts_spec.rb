require 'spec_helper'

describe "Posts" do
  let!(:root) { Fabricate :root }
  let!(:posts) { Fabricate :page, slug: 'posts', parent: root }

  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      response.status.should be(200)
    end
  end
end
