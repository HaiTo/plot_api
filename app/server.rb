class Server < Sinatra::Base
  # @PARAM json {
  #     "title": "String",
  #     "datas" = [
  #       {"category": "string", "points": [float...]}
  #     ],
  #     "labels" = {
  #       {"Integer": "string"...}
  #     },
  #     "theme": "String" // not required
  #       # ... theme_keynote
  #       # ... theme_37signals
  #       # ... theme_rails_keynote <- Default
  #       # ... theme_odeo
  #       # ... theme_pastel
  #       # ... theme_greyscale
  #   }
  # @RETURN json {img: blob}
  post '/' do
    # NOTE JSONの形式は正しいかい？
    begin
      json = JSON.load(request.body.read)
    rescue
      return [400, 'json parse error']
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

      # NOTE テーマの設定
      p json
      graph.theme = json['theme']

      # NOTE PngのBlobを取得
      return [200, {'Content-Type' => 'image/png'}, graph.plot!]
    rescue
      status 400
    end
  end
end
