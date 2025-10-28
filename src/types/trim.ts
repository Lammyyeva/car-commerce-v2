export interface IAttrs {
  capacity: number;
  horsePower: number;
  transmissionType: string;
  driveType: string;
}

export interface ICreateTrimResponse {
  id: number;
  name: string;
  model_id: number;
  bType_id: number;
  year: number;
  createdAt: Date;
  updatedAt: Date;
}

