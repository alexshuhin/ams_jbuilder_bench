require 'benchmark/ips'

file_contents = {}
def render(file, locals)
  (file_contents ||= {})[file] ||= File.read(Rails.root.join("app/views/jbuilder/#{file}.jbuilder"))

  #scope = Object.new
  #b = scope.instance_eval { binding }
  b = binding
  locals.each do |(k, v)|
    b.local_variable_set(k, v)
  end

  Jbuilder.encode do |json|
    b.local_variable_set(:json, json)
    eval(file_contents[file], b)
  end
end

namespace :bench do
  desc 'Run simply test'
  task :simply => :environment do
    results = {}
    LIMIT = 1
    #extend RenderAnywhere
    #rendering_controller.lookup_context.view_paths << Rails.root.join('app/views/jbuilder')
    MultiJson.use :oj

    posts = Post.includes({:comments => :author}, :author).limit(LIMIT).to_a
    file_content = File.read(Rails.root.join('app/views/jbuilder/posts.jbuilder'))
    Benchmark.ips do |x|
      x.config(time: 5, warmup: 2)

      x.report 'jbuilder-serializer' do
        results[:jbuilder_serializer] = JbuilderPostsSerializer.new(posts: posts).to_json
      end

      x.report 'jbuilder' do
        #results[:jbuilder] = render(template: 'posts', layout: nil, locals: { posts: posts })
        { posts: posts }
        results[:jbuilder] = render('posts', posts: posts)
      end

      x.report 'ams' do
        results[:ams] = ActiveModel::ArraySerializer.new(
          posts, each_serializer: PostSerializer, root: :posts)
          .to_json
      end


      x.compare!
    end

    puts "IDENTICAL: #{results[:jbuilder_serializer] == results[:jbuilder]}"
  end
end
