/**
 * Aquisicao.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE AQUISICAO
  aqu_cod: {
    type: 'int',
    primaryKey : true
    
  },
  aqu_dat_cad: {
    type: 'datetime'
   

 },
 
aqu_ebuilder: {
  type: 'boolean'

},

aqu_eb_nom: {
  type: 'string'

},

aqu_imp_cli: {
   type: 'boolean'

},


aqu_imp_ev: {
   type: 'boolean'

},

aqu_imp_inv: {
  type: 'boolean'

},

aqu_imp_prec: {
   type: 'boolean'

},


aqu_imp_prod: {
   type: 'boolean'

},

aqu_imp_xml: {
  type: 'boolean'

},

aqu_imp_cnab: {
   type: 'boolean'

},


aqu_imp_ibpt: {
   type: 'boolean'

},


aqu_can_ped_bol: {
   type: 'boolean'

},


aqu_can_ped_car: {
   type: 'boolean'

},

aqu_env_bol: {
  type: 'boolean'

},

aqu_exp_sint: {
   type: 'boolean'

},


aqu_consig: {
   type: 'boolean'

},
aqu_trocdev: {
   type: 'boolean'

},

aqu_dist_cor: {
   type: 'boolean'

},


aqu_dist_proc: {
   type: 'boolean'

},


aqu_dist_dir: {
   type: 'boolean'

},

aqu_dist_tot: {
  type: 'boolean'

},

aqu_dist_out: {
   type: 'boolean'

},


aqu_hub_mel: {
   type: 'boolean'

},

aqu_hub_cnova: {
   type: 'boolean'

},


aqu_hub_b2w: {
   type: 'boolean'

},


aqu_int_plat: {
   type: 'boolean'

},

aqu_int_erp: {
  type: 'boolean'

},

aqu_int_wms: {
   type: 'boolean'

},


aqu_prod_sku: {
   type: 'boolean'

},


aqu_prod_kit: {
   type: 'boolean'

},

aqu_prod_simp: {
   type: 'boolean'

},


aqu_prod_brin: {
   type: 'boolean'

},


aqu_dash: {
   type: 'boolean'

},

aqu_dash_email: {
  type: 'string'

},

 pro_uni_cod:{
      model:'projetoUnidade'
    }


},

autoPK: false,
tableName: 'AQUISICAO',
autoCreatedAt:false,
autoUpdatedAt:false

};

