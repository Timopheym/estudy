categorias = Category.all()
Dir.foreach('data') do |item|
  next if item == '.' or item == '..'
  categorias.each do |c|
    if c.name == item
      cat = c.id
    end
  end


  list_of_files = Dir.entries(item)
  list_of_files.each do |file|
    uploader = InfographicUploader.new
    uploader.store!(file)
    i = Infographic.new
    i.src = File.open('/data/'+item+'/'+file)
    i.category_id = cat
    i.name = file
    i.save!
  end