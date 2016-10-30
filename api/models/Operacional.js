/**
 * Operacional.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
 module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE OPERACIONAL
  opr_cod: {
    type: 'int',
    primaryKey : true
    
  },
  opr_smtp: {
    type: 'string'
   // required : true


 },
 opr_port_smtp: {
  type: 'int'
   //required : true

 },

 opr_cont_danfe: {
  type: 'string',
  
},

 opr_sen_danfe: {
  type: 'string'

},

 opr_email_ocul_danfe: {
  type: 'string'

},

opr_serie: {
  type: 'int'

},


opr_bol_ant: {
  type: 'boolean'

},

opr_bol_pos: {
  type: 'boolean'

},
opr_cheque: {
  type: 'boolean'

},

opr_dep: {
  type: 'boolean'

},

opr_cart_cred: {
  type: 'boolean'

},

opr_cart_deb: {
  type: 'boolean'

},


 pro_uni_cod:{
      model:'projetoUnidade'
    }
},
autoPK: false,
tableName: 'OPERACIONAL',
autoCreatedAt:false,
autoUpdatedAt:false


};
