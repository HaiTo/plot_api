class Server < Sinatra::Base
  # @PARAM json {
  #     "title": "String",
  #     "datas" = [
  #       {"category": "string", "points": [float...]}
  #     ],
  #     "labels" = {
  #       {"Integer": "string"...}
  #     },
  #     "size" = "string"  # "0000x0000" # NOT RQEUIRED
  # @RETURN json {img: blob}
  post '/' do
    # NOTE JSONの形式は正しいかい？
    begin
      json = JSON.load(request.body.read)
    rescue
      return [400, 'json parse error']
    end

    begin
      graph = Graph.new(json['title'], json['size'])
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
      return [200, {'Content-Type' => 'image/png'}, graph.plot!]
    rescue
      status 400
    end
  end
end
