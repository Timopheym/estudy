task :full => :environment do
  categorias = Category.all()
  dataDir = 'data-test'
  cat = -1
  Dir.foreach(dataDir) do |item|
    next if item == '.' or item == '..'

    categorias.each do |c|
      #puts c.name+">>"
      #puts item+"<<"
      if c.name == item
        cat = c
      end
    end
    #puts item
    #puts cat


    list_of_files = Dir.entries(dataDir+'/'+item)
    list_of_files.each do |file|
      next if file == '.' or file == '..'
      i = Infographic.new
      i.src = File.open(dataDir+'/'+item+'/'+file)
      i.categories.push( cat)
      i.name = file
      i.save!
    end
  end
end