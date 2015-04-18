class Make
  def process(json)
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

    graph
  end
end
