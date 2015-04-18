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
      image = Make.process(json)

      # NOTE PngのBlobを取得
      return [200, {'Content-Type' => 'image/png'}, image]
    rescue
      return [400, 'Occurred error']
    end
  end
end
