/**
 * Projeto.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE PROJETO_UNIDADE
  proj_cod: {
    type: 'int',
    primaryKey : true
    
  },
  proj_nome: {
    type: 'string'
   

 },
   proj_desc: {
    type: 'desc'
   

 },
   proj_status: {
    type: 'boolean'
   

 },

 // COLEÇÃO DE PROJETO_UNIDADE 
projetosCatalogo: {
  collection: 'projetoUnidade',
  via: 'proj_cod'
},

},
autoPK: false,
tableName: 'PROJETO',
autoCreatedAt:false,
autoUpdatedAt:false

};

