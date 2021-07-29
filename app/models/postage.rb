class Postage < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '着払い(購入者負担)' },
    { id: 2, name: '送料込み(出品者負担)' },
    { id: 3, name: '目立った傷や汚れなし' },
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end