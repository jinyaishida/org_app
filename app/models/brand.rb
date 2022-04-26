class Brand < ActiveHash::Base
  self.data = [
     {id: 1, name: '---'},
     {id: 2, name: 'アークテリクス(ARCTERYX)'},
     {id: 3, name: 'エムエスアール(MSR)'}, 
     {id: 4, name: 'コールマン(Coleman)'}, 
     {id: 5, name: 'ザ・ノース・フェイス(THE NORTH FACE)'}, 
     {id: 6, name: 'スノーピーク(SNOW PEAK)'}, 
     {id: 7, name: 'ハイパーライトマウンテンギア(HYPERLITE MOUNTAIN GEAR)'}, 
     {id: 8, name: 'パタゴニア(patagonia)'},
     {id: 9, name: 'モンベル(mont bell)'},
     {id: 10, name: '山と道'},
     {id: 11, name: 'その他'}
]

include ActiveHash::Associations
has_many :posts

end