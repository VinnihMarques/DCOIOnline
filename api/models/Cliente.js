/**
 * Cliente.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
  	cli_cod: {
  		type: 'int',
  		unique: true,
  		required: true
  	},
  	cli_cnpj: {
  		type: 'int',
  		unique: true,
  		required: true
  	},
      cli_nomeFantasia: {
      type: 'string',
      
    },
    
    cli_razaoSocial: {
  		type: 'string',
  		
  	},
  	cli_IE: {
  		type: 'int',
  		unique: true
  		
  	},
  	cli_endereco: {
  		type: 'string',
  		
  	},

  }
};

