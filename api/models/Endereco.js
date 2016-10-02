/**
 * Endereco.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE ENDERECO
  end_cod: {
    type: 'int',
    primaryKey : true
    
  },
  end_log: {
    type: 'string'
   // required : true


 },
 end_num: {
  type: 'string'
   //required : true

 },

 end_bai: {
  type: 'string'
},

end_comp: {
  type: 'string'

},

end_cid: {
  type: 'string'

},

end_uf: {
  type: 'string'

},
 uni_cod:{

    model: 'unidadenegocio'
  }

},

autoPK: false,
tableName: 'ENDERECO',
autoCreatedAt:false,
autoUpdatedAt:false
};
