module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      site.categories.each do |category, posts|
        site.pages << CategoryPage.new(site, site.source, "category/#{Jekyll::Utils.slugify(category)}", category)
      end
    end
  end

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category.html')
      self.data['category'] = category
      self.data['title'] = "Category: #{category}"
    end
  end
end