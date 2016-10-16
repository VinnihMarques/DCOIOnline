/**
 * Hub.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

   attributes: {
  // ATRIBUTOS DA TABELA HUB
  hub_cod: {
    type: 'int',
    primaryKey : true
    
  },
  hub_contato: {
    type: 'string'
   
 },
 hub_email: {
  type: 'string'
   
 },

 hub_meli_ofc: {
  type: 'boolean'

},

hub_tip_anun: {
  type: 'string'

},

hub_tip_env: {
  type: 'string'

},


hub_full_fil: {
  type: 'boolean'

},

hub_col_cross: {
  type: 'boolean'

},
hub_cus_var: {
  type: 'boolean'

},


hub_ent_comb: {
  type: 'boolean'

},

hub_rep: {
  type: 'boolean'

},
hub_url_rep: {
  type: 'string'

},

 pro_uni_cod:{
      model:'projetoUnidade'
    }


},
autoPK: false,
tableName: 'HUB',
autoCreatedAt:false,
autoUpdatedAt:false

};
