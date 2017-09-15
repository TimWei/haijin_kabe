require_relative 'source'
require_relative 'source/pixiv'
require_relative 'source/third_party_api'

class SourceFactory
  def initialize opt={}
    raise 'Empty Source' unless opt[:source]
    source = URI.parse(opt[:source]).host
    case source
    when 'pixiv.net'
      raise 'Inlalide Account Info' unless opt[:pixiv]
      @product = Pixiv.new account: opt[:pixiv]['account'], passowrd: opt[:pixiv]['password']
    when 'pixiv.moe'
      @product = ThirdPartyApi.new host_name: 'https://api.pixiv.moe/', path: 'v2/ranking', url_pattern: /original_image_url":"(https:.\/.\/api\.pixiv\.moe.\/v[0-9].\/image.\/[a-zA-Z0-9]*=?)/
    when 'imjad.cn'
      @product = ThirdPartyApi.new referer: 'https://pixiv.net/', host_name: 'https://api.imjad.cn/', path: 'pixiv/v1/?type=rank&mode=daily&content=illust', url_pattern: /large":"(https:.\/.\/i2\.pixiv\.net.\/img-original.\/img.\/([0-9]*.\/){6}[0-9]*(_p[0-9])?\.(jpg|png))/
    end
  end

  def get_product
    @product
  end
end