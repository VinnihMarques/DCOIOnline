/**
 * ProjetoUnidade.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

 module.exports = {

  attributes: {
  // ATRIBUTOS DA TABELA DE PROJETO_UNIDADE
  pro_uni_cod: {
    type: 'int',
    primaryKey : true
    
  },
  proj_cod: {
   model: 'projeto'
   

 },
 uni_cod: {
  model: 'unidadeNegocio'

},

aquisicao: {
  model:'aquisicao'
},

hub: {
  model:'hub'
},

banco: {
  model:'banco'
}

},

autoPK: false,
tableName: 'PROJETO_UNIDADE',
autoCreatedAt:false,
autoUpdatedAt:false
};

