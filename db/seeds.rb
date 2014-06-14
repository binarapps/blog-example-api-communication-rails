def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

Entry.create(name: "sample entry", text: "sample text", file: seed_image("seed.jpg"))
