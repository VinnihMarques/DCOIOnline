/**
 * Usuario.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  	id: {
  		type: 'int',
      primaryKey : true
  		
  	},
  	usu_nome: {
  		type: 'string'
  	
  	},
      usu_log: {
      type: 'string'
      
    },
    
    usu_sen: {
  		type: 'string'
  		
  	},



   

  },
  autoPK: true,
  tableName: 'TADM_USUSIS',
  autoCreatedAt:false,
  autoUpdatedAt:false
  
};
