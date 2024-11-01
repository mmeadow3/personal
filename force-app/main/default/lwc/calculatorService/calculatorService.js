import { updateRecord } from "lightning/uiRecordApi";

const addNumbertoField = (id, fieldToUpdate, value) => {
  const fields = {};

  fields.Id = id;
  fields[fieldToUpdate] = value;

  const recordInput = {
    fields: fields
  };

  updateRecord(recordInput).then((record) => {
    console.log(record);
  });
};

export { addNumbertoField };
