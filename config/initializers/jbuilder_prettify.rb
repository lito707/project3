require "jbuilder"

# Enable prettification in your `.jbuilder` files
# Via https://github.com/rails/jbuilder/issues/195#issuecomment-44440569
#
# Example:
#   json.prettify! if params[:pretty] == "1"
#
class Jbuilder
  # Enable or disable prettification
  # Example:
  #   json.prettify!
  #   json.prettify!(false)
  def prettify!(enabled = true)
    @prettify = enabled
  end

  alias_method :_original_target, :target!
  def target!
    @prettify ? ::JSON.pretty_generate(@attributes) : _original_target
  end
end


# Add comments attributes in your JSON files.
#
# This can be usefull in understanding certain aspects of your JSON
# or when building an automatic documentation.
#
# Example:
#   json.commentify! if params[:comments] == "1"
#
#   json.comment "Unique identifier"
#   json.id 42
#   json.comment "Product name"
#   json.name "Foo"
#
# Would render:
#   {
#      "_comment_0": "Unique identifier",
#      "id": 42,
#      "_comment_1": "Product name",
#      "name": "Foo"
#    }
#
# This output can then be transformed by your automatic documentation,
# for example by transforming them in JS comments with the following
# regular expression:
#
#     output.gsub(/^( *)"_comment_\d+": "(.*)",$/, '\1// \2')
#
# Would return:
#   {
#      // Unique identifier
#      "id": 42,
#      // Product name
#      "name": "Foo"
#    }
#
class Jbuilder
  # Enable or disable comments
  # Example:
  #   json.commentify!
  #   json.commentify!(false)
  def commentify!(enabled = true)
    @commentify = enabled
    @comment_index ||= 0
  end

  # Add a comment.
  # Example:
  #   json.comment "foo"
  def comment(text)
    return unless @commentify
    set!(:"_comment_#{@comment_index}", text)
    @comment_index += 1
  end
end
