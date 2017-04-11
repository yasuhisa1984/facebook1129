# encoding: utf-8

Shindo.tests('Internetfacebook1129 | signed_params', ['internetfacebook1129']) do
  returns( Fog::Internetfacebook1129.escape( "'Stöp!' said Fred_-~." ) ) { "%27St%C3%B6p%21%27%20said%20Fred_-~." }
end
