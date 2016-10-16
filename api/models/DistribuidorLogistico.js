/**
 * DistribuidorLogistico.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DISTRIBUIDOR_LOGISTICO
  dist_cod: {
    type: 'int',
    primaryKey : true
    
  },
  dist_nom: {
    type: 'string'
   
 },
 dist_cnpj: {
  type: 'string'
   
 },

 dist_cod_adm: {
  type: 'string'

},

dist_car_pst: {
  type: 'string'

},

dist_url_sigp: {
  type: 'string'

},


dist_sigp_usu: {
  type: 'string'

},

dist_sigp_sen: {
  type: 'string'

},
dist_url_ws_homo: {
  type: 'string'

},


dist_usu_homo: {
  type: 'string'

},

dist_sen_homo: {
  type: 'string'

},
dist_url_ws_prod: {
  type: 'string'

},
dist_usu_prod: {
  type: 'string'

},


dist_sen_prod: {
  type: 'string'

},

 pro_uni_cod:{
      model:'projetoUnidade'
    }


},
autoPK: false,
tableName: 'DISTRIBUIDOR_LOGISTICO',
autoCreatedAt:false,
autoUpdatedAt:false

};

