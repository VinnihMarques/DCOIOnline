/**
 * GatewayPagamento.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA GATEWAY_PAGAMENTO
  gat_cod: {
    type: 'int',
    primaryKey : true
    
  },
  gat_nom: {
    type: 'string'
   
 },
  gat_afi_adq: {
    type: 'boolean'
   
 },

 gat_chave_loja_homo: {
  type: 'string'
   
 },

 gat_usu_homo: {
  type: 'string'

},

gat_sen_homo: {
  type: 'string'

},

gat_chave_loja_prod: {
  type: 'string'

},


gat_usu_prod: {
  type: 'string'

},

gat_sen_prod: {
  type: 'string'

},
 pro_uni_cod:{
      model:'projetoUnidade'
    }


},
autoPK: false,
tableName: 'GATEWAY_PAGAMENTO',
autoCreatedAt:false,
autoUpdatedAt:false

};
