require 'benchmark'
require 'render_anywhere'

namespace :bench do
  desc 'Run simply test'
  task :simply => :environment do
    results = {}
    LIMIT = 1000

    puts ' === Test AMS ==='
    puts ' == Preparing'
    posts = Post.includes({:comments => :author}, :author).limit(LIMIT).to_a
    puts ' == Testing'
    ms = Benchmark.ms do
      results[:ams] = ActiveModel::ArraySerializer.new(
        posts, each_serializer: PostSerializer, root: :posts)
        .to_json
    end
    puts " = RESULT: #{ms}"

    puts ' === Test Jbuilder ==='
    puts ' == Preparing'
    extend RenderAnywhere
    MultiJson.use :oj
    rendering_controller.lookup_context.view_paths << Rails.root.join('app/views/jbuilder')
    posts = Post.includes({:comments => :author}, :author).limit(LIMIT).to_a
    puts ' == Testing'
    ms = Benchmark.ms do
      results[:jbuilder] = render(template: 'posts', layout: nil, locals: { posts: posts })
    end
    puts " = RESULT: #{ms}"

    puts "IDENTICAL: #{results[:ams] == results[:jbuilder]}"

  end
end
