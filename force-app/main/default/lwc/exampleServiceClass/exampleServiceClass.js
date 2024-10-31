const sayHelloFromServiceClass = () => {
    console.log('hello from the service class');
}

const returnSomeTestData = () => {
    return [
      { label: "20 years", value: 20 },
      { label: "25 years", value: 25 },
    ];
  };
  

export {sayHelloFromServiceClass, returnSomeTestData}