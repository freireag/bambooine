atom_feed do |feed|
  feed.title "freireag"
  feed.updated(@collection.first.created_at)
  for post in @collection
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author do |author|
        author.name "Thiago Freire"
      end
    end
  end
end
