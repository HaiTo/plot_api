# SERVER

class Server < Sinatra::Base
  # @PARAM json {title: String, datas =
  #     [
  #       {category: string, points: [float...]}
  #     ]
  #   }
  # @RETURN json {img: blob}
  post '/graph' do
    begin
      json = JSON.load(request.body.read)
    rescue
      return status 400
    end

    begin
      graph = Graph.new(json['title'])
      # NOTE グラフデータのセット
      json['datas'].each do |data|
        graph.set(data['category'], data['points'])
      end

      # NOTE PngのBlobを取得
      graph.plot!
    rescue
      status 400
    end
  end
end
