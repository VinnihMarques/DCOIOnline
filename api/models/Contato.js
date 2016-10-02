/**
 * Contato.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

 module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE CONTATO
  con_cod: {
    type: 'int',
    primaryKey : true
    
  },
  con_tel: {
    type: 'string'
   // required : true


 },
 con_cel: {
  type: 'string'
   //required : true

 },

 con_fax: {
  type: 'string'
},

con_email: {
  type: 'string'

},

con_resp: {
  type: 'string'

},



  cli_cod: {
    model: 'cliente'
  },

},

autoPK: false,
tableName: 'CONTATO',
autoCreatedAt:false,
autoUpdatedAt:false
};

