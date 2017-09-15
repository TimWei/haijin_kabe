class Kabe
  def initialize opt={}
    #load_setting
    @config = opt[:config]
    freq = @config['frequency']
    @pic_num = (freq['download_new_image'] / freq['change_wallpapper']) + 1
  end

  def init
    self.class.clear_old_img
    @source = SourceFactory.new(source: @config['source'], pixiv: @config['pixiv']).get_product
    @source.get_daily @pic_num
  end

  private
  def self.internet_available?
    begin
      true if open("http://www.google.com/")
    rescue
      false
    end
  end
  
  def self.detect_os_and_clear file
    if OS.windows?
      `del "#{file.gsub('/','\\')}"`
    else
      `rm #{file}`
    end
  end
  def self.clear_old_img
    if self.internet_available?
      files = Dir[File.dirname(__FILE__)+'/../img/*']
      files.each_with_index do |file, i|
        if file.match(/\.(jpg|png)/).nil?
          next
        elsif i == 0 
          # left at least one image
          next
        else
          self.detect_os_and_clear file
        end
      end
    end
  end
end