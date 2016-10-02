/**
 * Cliente.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

 module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE CLIENTES
  cli_cod: {
    type: 'int',
    primaryKey : true
    
  },
  cli_nom: {
    type: 'string'
   // required : true


 },
 cli_raz: {
  type: 'string'
   //required : true

 },

 cli_cnpj: {
  type: 'string',
  unique: true


},

cli_ie: {
  type: 'string'

},

cli_status: {
  type: 'boolean'

},

cli_aten: {
  type: 'string'

},


cli_qtd_usu: {
  type: 'int'

},

cli_ana_prj: {
  type: 'string'

},

cli_hosp: {
  type: 'string'
   // required : true

 },

 cli_id_hosp: {
  type: 'string'
   // required : true

 },

 cli_dat_cad: {
  type: 'datetime'

},


// COLEÇÃO DE CONTATOS 
contatos: {
  collection: 'contato',
  via: 'cli_cod'
},

// COLEÇÃO DE UNIDADES DE NEGOCIO 
unidades: {
  collection: 'unidadeNegocio',
  via: 'cli_cod'
},

},
autoPK: false,
tableName: 'CLIENTE',
autoCreatedAt:false,
autoUpdatedAt:false


};