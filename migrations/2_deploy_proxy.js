const Dogs = artifacts.require('Dogs');
const Proxy = artifacts.require('Proxy');
const DogsUpdated = artifacts.require('DogsUpdated');

module.exports = async function (deployer, network, accounts) {
  //Deploy Contracts
  const dogs = await Dogs.new();
  const proxy = await Proxy.new(dogs.address);

  //creat proxyDog to fool Truffle
  var proxyDog = await Dogs.at(proxy.address);

  //set the number of dogs through the proxy
  await proxyDog.setNumberOfDogs(10);

  //tested
  var nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log("Before Update: " + nrOfDogs.toNumber());

  nrOfDogs = await dogs.getNumberOfDogs();
  console.log(nrOfDogs.toNumber());

  //Deploy DogsUpdated contract
  const dogsUpdated = await DogsUpdated.new();
  proxy.upgrade(dogsUpdated.address);

  nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log("After Update: " + nrOfDogs.toNumber());

  //set the number of dogs on the new contract
  proxyDog.setNumberOfDogs(30);


  
}


