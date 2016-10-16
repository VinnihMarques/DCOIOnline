/**
 * Plataforma.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA PLATAFORMA
  plat_cod: {
    type: 'int',
    primaryKey : true
    
  },
  plat_nom: {
    type: 'string'
   
 },
 plat_con_tec: {
  type: 'string'
   
 },

 plat_url_adm: {
  type: 'string'

},

plat_usu: {
  type: 'string'

},

plat_sen: {
  type: 'string'

},


plat_url_loja: {
  type: 'string'

},

plat_chave: {
  type: 'string'

},

 pro_uni_cod:{
      model:'projetoUnidade'
    }


},
autoPK: false,
tableName: 'PLATAFORMA',
autoCreatedAt:false,
autoUpdatedAt:false

};

