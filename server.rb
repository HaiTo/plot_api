# SERVER

class Server < Sinatra::Base
  # @PARAM json {
  #     "title": "String",
  #     "datas" = [
  #       {"category": "string", "points": [float...]}
  #     ],
  #     "labels" = {
  #       {Integer: "string"...}
  #     }
  #   }
  # @RETURN json {img: blob}
  post '/' do
    begin
      json = JSON.load(request.body.read)
    rescue
      return status 400
    end

    begin
      graph = Graph.new(json['title'])
      # NOTE グラフデータのセット
      json['datas'].each do |data|
        graph.append(data['category'], data['points'])
      end

      # NOTE ラベルの整形
      labels = {}
      json['labels'].each do |key, value|
        labels[key.to_i] = value
      end

      graph.labels = labels

      # NOTE PngのBlobを取得
      graph.plot!
    rescue
      status 400
    end
  end
end
