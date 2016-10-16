/**
 * AnaliseRisco.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA ANALISE_RISCO
  ana_cod: {
    type: 'int',
    primaryKey : true
    
  },
  ana_nom: {
    type: 'string'
   
 },
 ana_chave_loja_homo: {
  type: 'string'
   
 },

 ana_usu_homo: {
  type: 'string'

},

ana_sen_homo: {
  type: 'string'

},

ana_chave_loja_prod: {
  type: 'string'

},


ana_usu_prod: {
  type: 'string'

},

ana_sen_prod: {
  type: 'string'

},
 pro_uni_cod:{
      model:'projetoUnidade'
    }


},
autoPK: false,
tableName: 'ANALISE_RISCO',
autoCreatedAt:false,
autoUpdatedAt:false

};
