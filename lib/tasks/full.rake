task :full => :environment do
  categorias = Category.all()
  cat = -1
  Dir.foreach('data') do |item|
    next if item == '.' or item == '..'

    categorias.each do |c|
      #puts c.name+">>"
      #puts item+"<<"
      if c.name == item
        cat = c.id
      end
    end
    #puts item
    #puts cat


    list_of_files = Dir.entries('data/'+item)
    list_of_files.each do |file|
      next if file == '.' or file == '..'
      #puts file
      #uploader = InfographicUploader.new
      #uploader.store!(file)
      i = Infographic.new
      i.src = File.open('data/'+item+'/'+file)
      #i.category = cat
      i.name = file
      i.save!
      #puts i
    end
  end
end