/**
 * Banco.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
 module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE BANCO
  ban_cod: {
    type: 'int',
    primaryKey : true
    
  },
  ban_nom: {
    type: 'string'
   // required : true


 },
 ban_agt: {
  type: 'string'
   //required : true

 },

 ban_cont: {
  type: 'string',
  
},

ban_cod_emp: {
  type: 'string'

},

ban_cod_conv: {
  type: 'string'

},

ban_cod_ced: {
  type: 'string'

},

ban_num_cart: {
  type: 'string'

},
 pro_uni_cod:{
      model:'projetoUnidade'
    }

},
autoPK: false,
tableName: 'BANCO',
autoCreatedAt:false,
autoUpdatedAt:false


};
