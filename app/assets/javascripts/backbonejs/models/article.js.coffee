@Article = Backbone.Model.extend
  urlRoot: '/articles'

@Articles = Backbone.Collection.extend
  model: Article
  url: '/articles'

# 投稿一覧
@ArticlesView = Backbone.View.extend
  el: '#articles' #DOM要素の割り当て

  initialize: ->
    @render() #描画
    @listenTo(@collection, 'add', @addNew)

  addNew: (article) ->
    articleView = new ArticleView(model: article)
    @$el.append(articleView.render().el)

  render: ->
    @collection.each (article, i) =>
      articleView = new ArticleView(model: article, index: i)
      @$el.append(articleView.render().el)
    @

# 投稿
@ArticleView = Backbone.View.extend
  tagName: 'div' #ラップするタグ名
  className: 'article'
  template: _.template($('#article-template').html())
  initialize: (@options) ->
  render: ->
    template = @template(article: @model.toJSON(), index: @options.index)
    console.log(@model.toJSON())
    @$el.html(template)
    @