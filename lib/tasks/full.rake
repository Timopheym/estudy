# encoding: UTF-8
task :full => :environment do
  categorias = Category.all()
  dataDir = 'data'
  cat = -1
  Dir.foreach(dataDir) do |item|
    next if item == '.' or item == '..' or item == '.DS_Store'
    categorias.each do |c|
      if c.name.to_s == item.to_s
        cat = c
      end
    end
    puts "Загружается категория: " + cat.name.to_s
    list_of_files = Dir.entries(dataDir+'/'+item)
    list_of_files.each do |file|
      next if file == '.' or file == '..' or file == '.DS_Store'
      i = Infographic.new
      i.src = File.open(dataDir+'/'+item+'/'+file)
      i.categories.push(cat)
      i.name = file
      i.save!
    end
  end
end