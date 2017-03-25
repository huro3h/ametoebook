@Article = Backbone.Model.extend
  urlRoot: '/articles'

@Articles = Backbone.Collection.extend
  model: Article
  url: '/articles'