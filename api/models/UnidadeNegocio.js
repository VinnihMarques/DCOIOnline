/**
 * UnidadeNegocio.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

 module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE UNIDADE DE NEGOCIO
  uni_cod: {
    type: 'int',
    primaryKey : true
    
  },
  uni_nom: {
    type: 'string',
    required : true


  },

  uni_cnpj: {
    type: 'string',
    unique: true


  },
  uni_ie: {
    type: 'string',
    unique: true


  },
  uni_im: {
    type: 'string',
    unique: true


  },
  uni_sig: {
    type: 'string'

  },


  uni_reg: {
    type: 'string'

  },

  // COLEÇÃO DE ENDERECOS 
enderecos: {
  collection: 'endereco',
  via: 'uni_cod'
},
 // COLEÇÃO DE PROJETO_UNIDADE 
projetosUnidade: {
  collection: 'projetoUnidade',
  via: 'uni_cod'
},

//RELAÇÃO COM CLIENTE VIA COLLECTION
  cli_cod:{

    model: 'cliente'
  }

},

autoPK: false,
tableName: 'UNIDADE_NEGOCIO',
autoCreatedAt:false,
autoUpdatedAt:false
};
